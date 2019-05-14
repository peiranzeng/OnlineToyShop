package com.toyshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.toyshop.dataservice.ProductInfoService;

@WebServlet(name = "search", urlPatterns= "/search")
public class SearchToyServlet extends HttpServlet{
	ProductInfoService productInfoService = new ProductInfoService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<String> nameList = productInfoService.getAllName();
		
		String json = new Gson().toJson(nameList);
		
		PrintWriter out = resp.getWriter();
		
		out.print(json);
	}
	
}
