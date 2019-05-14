package com.toyshop.dataservice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toyshop.domain.CartItem;
import com.toyshop.domain.Toy;

public class CartItemService {
	ConnectionTool cTool = new ConnectionTool();
	public void addItem(CartItem cartItem) {
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		
		System.out.println(cartItem.getUserId());
		
		try {
			pstmt = conn.prepareStatement("insert into cart_item values(?,?,?,?,?)");
			pstmt.setInt(1, 0);
			pstmt.setInt(2, cartItem.getQty());
			pstmt.setDouble(3, cartItem.getSubtotal());
			pstmt.setInt(4, cartItem.getToyId());
			pstmt.setInt(5, cartItem.getUserId());
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
	
	public CartItem searchItem(int UserId, int ToyId) {
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		CartItem cartItem = null;
		
		try {
			pstmt = conn.prepareStatement("select * from cart_item where toy_id = ? and user_id = ?");
			pstmt.setInt(1, ToyId);
			pstmt.setInt(2, UserId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				cartItem = new CartItem();
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
		return cartItem;
	}
	
	public void updateItem(int qty, double subtotal, int UserId, int ToyId) {
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		CartItem cartItem = null;
		
		System.out.println(UserId);
		
		try {
			pstmt = conn.prepareStatement("update cart_item set qty = qty + ?, subtotal = subtotal + ? where toy_id = ? and user_id = ?");
			pstmt.setInt(1, qty);
			pstmt.setDouble(2, subtotal);
			pstmt.setInt(3, ToyId);
			pstmt.setInt(4, UserId);
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
	
	public List<CartItem> getByUserId(int UserId){
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		ProductInfoService productInfoService = new ProductInfoService();
		List<CartItem> cartItem = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement("select * from cart_item where user_id = ?");
			pstmt.setInt(1, UserId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println("cur cartid" + rs.getInt("id"));
				Toy toy = productInfoService.getById(rs.getInt("toy_id"));
				CartItem Item = new CartItem(rs.getInt("id"),rs.getInt("qty"),rs.getDouble("subtotal"),toy);
				cartItem.add(Item);
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
		return cartItem;
	}
	
	public CartItem getById(int id) {
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		CartItem cartItem = null;
		
		try {
			pstmt = conn.prepareStatement("select * from cart_item where id = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				cartItem = new CartItem(rs.getInt("id"),rs.getInt("qty"),rs.getDouble("subtotal"),rs.getInt("toy_id"),
						rs.getInt("user_id")
						);
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
		return cartItem;
	}
	
	public void ChangeQtyAndSubtotal(int id, int qty, double subtotal) {
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("update cart_item set qty = ?, subtotal = ? where id = ?");
			pstmt.setInt(1, qty);
			pstmt.setDouble(2, subtotal);
			pstmt.setInt(3, id);
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
	
	public void deleteById(int id) {
		Connection conn = cTool.Connect();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("delete from cart_item where id = ?");
			pstmt.setInt(1, id);
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
