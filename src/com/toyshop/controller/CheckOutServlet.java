package com.toyshop.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toyshop.dataservice.CartItemService;
import com.toyshop.dataservice.OrderService;
import com.toyshop.dataservice.ProductInfoService;
import com.toyshop.domain.CartItem;
import com.toyshop.domain.Order;

@WebServlet(name = "checkout", urlPatterns= "/checkout")
public class CheckOutServlet extends HttpServlet{
	CartItemService cartItemService = new CartItemService();
	ProductInfoService productInfoService = new ProductInfoService();
	OrderService orderService = new OrderService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		Integer curId = (Integer)session.getAttribute("KeyId");
		List<CartItem> cartItem = cartItemService.getByUserId(curId.intValue());
		
		if(cartItem.size() == 0) {
			
			req.getRequestDispatcher("shoppingCart").forward(req, resp);
			return;
		}
		
		double total = 0.0;
		
		for(CartItem item : cartItem) {
			if(item.getQty() > item.getToy().getStickNumber()) {
				req.setAttribute("notEnough", "1");
				req.getRequestDispatcher("shoppingCart").forward(req, resp);
				return;
			}
			total += item.getSubtotal();
		}
		
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		String date = ft.format(dNow);
		
		Order order = new Order(0,date,total,curId.intValue());
		orderService.putOrderInfo(order);
		
		Calendar now = Calendar.getInstance();
		now.add(Calendar.DATE, 3);
		String redate = ft.format(now.getTime());
		req.setAttribute("deliver", redate);
		
		req.setAttribute("cartItem", cartItem);
		req.getRequestDispatcher("comfirmation.jsp").include(req, resp);
		
		for(CartItem item: cartItem) {
			productInfoService.updateStockById(item.getToy().getId(), item.getQty());
		}
		
		for(CartItem item : cartItem) {
			cartItemService.deleteById(item.getId());
		}
		
	}
	
}
