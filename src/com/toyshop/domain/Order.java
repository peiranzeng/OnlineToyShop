package com.toyshop.domain;

public class Order {
	int id;
	String orderDate;
	double orderTotal;
	int userId;
	
	public Order(int id, String orderDate, double orderTotal, int userId) {
		this.id = id;
		this.orderDate = orderDate;
		this.orderTotal = orderTotal;
		this.userId = userId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public double getOrderTotal() {
		return orderTotal;
	}
	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
}
