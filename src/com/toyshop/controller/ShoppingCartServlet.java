package com.toyshop.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toyshop.dataservice.CartItemService;
import com.toyshop.domain.CartItem;

@WebServlet(name = "shoppingCart", urlPatterns= "/shoppingCart")
public class ShoppingCartServlet extends HttpServlet{
	CartItemService cartItemService = new CartItemService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession(true);
		Integer curId = (Integer)session.getAttribute("KeyId");
		System.out.println("curId:" + curId);
		if(curId == null) {
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
			return;
		}
		
		List<CartItem> cartItem = cartItemService.getByUserId(curId.intValue());
		if(cartItem.size()==0) {
			req.setAttribute("emptyCart", "1");
		}
		int totalqty = 0;
		double totalPrice = 0.0;
		
		for(CartItem item : cartItem) {
			totalqty += item.getQty();
			totalPrice += item.getSubtotal();
		}
		
		BigDecimal bg = new BigDecimal(totalPrice);
		totalPrice = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		
		req.setAttribute("cartItem", cartItem);
		req.setAttribute("totalqty", totalqty);
		req.setAttribute("totalPrice", totalPrice);
		
		
		req.getRequestDispatcher("cart.jsp").forward(req, resp);
		
	}
	
}
