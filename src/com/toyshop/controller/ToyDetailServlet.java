package com.toyshop.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toyshop.dataservice.ProductInfoService;
import com.toyshop.domain.Toy;

@WebServlet(name = "toyDetail", urlPatterns= "/toyDetail")
public class ToyDetailServlet extends HttpServlet{
	ProductInfoService productInfoService = new ProductInfoService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int toyId = Integer.parseInt(req.getParameter("id"));
		
		Toy toy = productInfoService.getById(toyId);
		
		req.setAttribute("toy", toy);
		req.getRequestDispatcher("toydetail.jsp").forward(req, resp);
	}
	
}
