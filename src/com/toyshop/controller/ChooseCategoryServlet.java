package com.toyshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name = "choice", urlPatterns= "/choice")
public class ChooseCategoryServlet extends HttpServlet{
	ProductInfoService productInfoService = new ProductInfoService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String Choice = req.getParameter("category");
		List<Toy> toys = new ArrayList<>();
		
		if(Choice.equals("All")) {
			toys = productInfoService.getAllToy();
		}else {
			toys = productInfoService.getByCategory(Choice);
		}
		
		String json = new Gson().toJson(toys);
		
		PrintWriter out = resp.getWriter();
		
		out.print(json);
		
	}
	
	
	
}
