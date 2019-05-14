package com.toyshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toyshop.dataservice.ConnectionTool;
import com.toyshop.dataservice.UserInfoService;
import com.toyshop.domain.User;


@WebServlet(name = "register", urlPatterns= "/register")
public class RegisterServlet extends HttpServlet{
	UserInfoService userInfoService = new UserInfoService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		boolean invalidEmail = false;
		boolean invalidUser = false;
		
		List<User> userList = userInfoService.getAllUserInfo();
		
		for(User user : userList) {
			System.out.println(user.getEmail());
			if(email.equals(user.getEmail())) {
				invalidEmail = true;
			}
			if(username.equals(user.getUsername())) {
				invalidUser = true;
			}
		}
		
		if(invalidEmail || invalidUser) {
			req.setAttribute("firstname", firstname);
			req.setAttribute("lastname", lastname);
			req.setAttribute("username", username);
			req.setAttribute("email", email);
			RequestDispatcher rd=req.getRequestDispatcher("/register.jsp");
			rd.include(req, resp);
		}
		
		else {
			User user = new User(firstname, lastname, username, password, email);
			userInfoService.putUserInfo(user);
			
			RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
			rd.forward(req, resp);
		}
		
	}
	
}
