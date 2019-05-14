package com.toyshop.dataservice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toyshop.domain.Toy;
import com.toyshop.domain.User;

public class UserInfoService {
	ConnectionTool cTool = new ConnectionTool();
	
	public List<User> getAllUserInfo(){
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		List<User> userList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("select * from user_info");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User(
						rs.getInt("id"),rs.getString("username"),rs.getString("pswd"),rs.getString("email"));
				userList.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return userList;
	}
	
	public int putUserInfo(User user) {
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("insert into user_info values(?,?,?,?,?,?)");
			pstmt.setInt(1, 0);
			pstmt.setString(2, user.getFirstname());
			pstmt.setString(3, user.getLastname());
			pstmt.setString(4, user.getUsername());
			pstmt.setString(5, user.getPassword());
			pstmt.setString(6, user.getEmail());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return 0;
	}
	
	public User getById(int id) {
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		User user = null;
		
		try {
			pstmt = conn.prepareStatement("select * from user_info where id = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				user = new User(
								rs.getInt("id"),rs.getString("firstname"),rs.getString("lastname"),rs.getString("username"),rs.getString("email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return user;
	}
}
