package com.toyshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toyshop.dataservice.UserInfoService;
import com.toyshop.domain.User;

@WebServlet(name = "registerCheck", urlPatterns= "/registerCheck")
public class RegisterValidatorServlet extends HttpServlet{
	UserInfoService userInfoService = new UserInfoService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String state = "";
		
		String action = req.getParameter("action");
		
		List<User> userList = userInfoService.getAllUserInfo();
		
		if(action.equals("checkName")) {
			String name = req.getParameter("curName");
			state = "yes";
			for(User user : userList) {
				if(name.equals(user.getUsername())) {
					state = "no";
				}
			}
		}else {
			String email = req.getParameter("curEmail");
			state = "yes";
			for(User user : userList) {
				if(email.equals(user.getEmail())) {
					state = "no";
				}
			}
		}
		
		System.out.println(state);
		
		PrintWriter out = resp.getWriter();
		
		out.print(state);
		
	}
	
}
