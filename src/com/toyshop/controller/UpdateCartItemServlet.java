package com.toyshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toyshop.dataservice.CartItemService;
import com.toyshop.dataservice.ProductInfoService;
import com.toyshop.domain.CartItem;
import com.toyshop.domain.Toy;

@WebServlet(name = "updatecart", urlPatterns = "/updatecart")
public class UpdateCartItemServlet extends HttpServlet {
	ProductInfoService productInfoService = new ProductInfoService();
	CartItemService cartItemService = new CartItemService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");

		System.out.println(action);

		int Cartid = Integer.parseInt(req.getParameter("Cartid"));

		if (action.equals("update")) {
			int qty = Integer.parseInt(req.getParameter("qty"));
			System.out.println(Cartid);
			System.out.println(qty);

			CartItem item = cartItemService.getById(Cartid);
			Toy toy = productInfoService.getById(item.getToyId());

			double price = toy.getOurPrice();
			int stock = toy.getStickNumber();
			System.out.println("price:" + price);
			System.out.println("stock" + stock);

			double subtotal = qty * price;
			cartItemService.ChangeQtyAndSubtotal(Cartid, qty, subtotal);
		}else if(action.equals("delete")){
			System.out.println(Cartid);
			cartItemService.deleteById(Cartid);
		}
		
		HttpSession session = req.getSession(true);
		Integer curId = (Integer)session.getAttribute("KeyId");
		
		List<CartItem> cartItem = cartItemService.getByUserId(curId.intValue());
		int totalqty = 0;
		double totalPrice = 0.0;
		
		for(CartItem item : cartItem) {
			totalqty += item.getQty();
			totalPrice += item.getSubtotal();
		}
		
		BigDecimal bg = new BigDecimal(totalPrice);
		totalPrice = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		
		PrintWriter out = resp.getWriter();
		
		String str = totalqty + "," + totalPrice;
		System.out.println(str);
		out.print(str);
	}

}
