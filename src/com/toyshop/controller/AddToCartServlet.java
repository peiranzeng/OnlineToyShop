package com.toyshop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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

@WebServlet(name = "addtocart", urlPatterns= "/addtocart")
public class AddToCartServlet extends HttpServlet{
	ProductInfoService productInfoService = new ProductInfoService();
	CartItemService cartItemService = new CartItemService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(true);
		Integer curId = (Integer)session.getAttribute("KeyId");
		System.out.println("curId:" + curId);
		if(curId == null) {
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
		else {
			
			int toyId = Integer.parseInt(req.getParameter("toyId"));
			int userId = curId.intValue();
			int qty = Integer.parseInt(req.getParameter("qty"));
			Toy toy = productInfoService.getById(toyId);
			int instockNumber = toy.getStickNumber();
			if(instockNumber < qty) {
				req.setAttribute("notEnoughStock", "no");
			}else {
				double subtotal = qty * toy.getOurPrice();
				
				CartItem cartItem = cartItemService.searchItem(userId, toyId);
				
				if(cartItem != null) {
					cartItemService.updateItem(qty, subtotal, userId, toyId);
				}else {
				
				CartItem addItem = new CartItem(0,qty,subtotal,toyId, userId);
				
				cartItemService.addItem(addItem);
				}
				req.setAttribute("addSuccess", "yes");
			}
			req.setAttribute("toy", toy);
			RequestDispatcher rd=req.getRequestDispatcher("toydetail.jsp");
			rd.include(req, resp);
		}
		
	}
}
