package com.toyshop.dataservice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.toyshop.domain.Order;


public class OrderService {
	ConnectionTool cTool = new ConnectionTool();
	
	public void putOrderInfo(Order order) {
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("insert into user_order values(?,?,?,?)");
			pstmt.setInt(1, 0);
			pstmt.setString(2, order.getOrderDate());
			pstmt.setDouble(3, order.getOrderTotal());
			pstmt.setInt(4, order.getUserId());
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
		
		return;
	}
}
