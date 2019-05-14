package com.toyshop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.toyshop.dataservice.ProductInfoService;
import com.toyshop.domain.Toy;

@WebServlet(name = "toy", urlPatterns= "/toy")
public class ToyPageServlet extends HttpServlet{
	ProductInfoService productInfoService = new ProductInfoService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Toy> toys = new ArrayList<>();
		
		toys = productInfoService.getAllToy();
		
		req.setAttribute("toys", toys);
		
		req.getRequestDispatcher("toy.jsp").forward(req, resp);
	}
	
}
