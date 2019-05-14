package com.toyshop.dataservice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toyshop.domain.CartItem;
import com.toyshop.domain.Toy;

public class ProductInfoService {
	ConnectionTool cTool = new ConnectionTool();
	
	public List<Toy> getAllToy(){
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		List<Toy> toyList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("select * from product");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Toy toy = new Toy(
						rs.getInt("id"),rs.getString("productname"),rs.getString("category"),
						rs.getInt("in_stock_number"),rs.getDouble("list_price"),rs.getDouble("our_price"),
						rs.getString("publish_date"),rs.getString("image"));
				toyList.add(toy);
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
		return toyList;
		
	}
	
	public List<String> getAllName(){
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		List<String> nameList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("select productname from product");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				nameList.add(rs.getString("productname"));
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
		return nameList;
		
	}
	
	public List<Toy> getByCategory(String category){
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		List<Toy> toyList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("select * from product where category = ?");
			pstmt.setString(1, category);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Toy toy = new Toy(
						rs.getInt("id"),rs.getString("productname"),rs.getString("category"),
						rs.getInt("in_stock_number"),rs.getDouble("list_price"),rs.getDouble("our_price"),
						rs.getString("publish_date"),rs.getString("image"));
				toyList.add(toy);
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
		return toyList;
		
	}
	
	public Toy getById(int id) {
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		Toy toy = null;
		
		try {
			pstmt = conn.prepareStatement("select * from product where id = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				toy = new Toy(
						rs.getInt("id"),rs.getString("productname"),rs.getString("category"),
						rs.getInt("in_stock_number"),rs.getDouble("list_price"),rs.getDouble("our_price"),
						rs.getString("publish_date"),rs.getString("image"));
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
		return toy;
		
	}
	
	public void updateStockById(int id, int qty) {
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("update product set in_stock_number = in_stock_number - ? where id = ?");
			pstmt.setInt(1, qty);
			pstmt.setInt(2, id);
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
	}
}
