package com.toyshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toyshop.dataservice.ConnectionTool;
import com.toyshop.dataservice.UserInfoService;
import com.toyshop.domain.User;
@WebServlet(name = "login", urlPatterns= "/login")
public class LoginServlet extends HttpServlet {
	UserInfoService userInfoService = new UserInfoService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		
		boolean valid = false;
		
		List<User> userList = userInfoService.getAllUserInfo();
		
		int key = 0;
		
		String findname = "no";
		
		for(User user : userList) {
			if(username.equals(user.getUsername()) && password.equals(user.getPassword())){
				key = user.getId();
				System.out.println(key);
				valid = true;
				findname = "yes";
				break;
			}else if(username.equals(user.getUsername())) {
				findname = "yes";
			}
		}
		
		
		if(valid)
		{
			HttpSession session = req.getSession(true);
			session.setAttribute("KeyId", key);
			RequestDispatcher rd=req.getRequestDispatcher("/");
			rd.forward(req, resp);
			valid = false;
		}
		else 
		{
			req.setAttribute("findname", findname);
			req.setAttribute("username", username);
			RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
			rd.include(req, resp);
		}
		
	}
	
	

}
