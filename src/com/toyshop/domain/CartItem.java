package com.toyshop.domain;

public class CartItem {
	int id;
	int qty;
	double subtotal;
	int toyId;
	int userId;
	Toy toy;
	User user;
	
	public Toy getToy() {
		return toy;
	}

	public void setToy(Toy toy) {
		this.toy = toy;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public CartItem(int id, int qty, double subtotal, int toyId, int userId) {
		this.id = id;
		this.qty = qty;
		this.subtotal = subtotal;
		this.toyId = toyId;
		this.userId = userId;
	}
	
	
	public CartItem(int id, int qty, double subtotal, Toy toy) {
		this.id = id;
		this.qty = qty;
		this.subtotal = subtotal;
		this.toy = toy;
	}
	
	

	public CartItem() {
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public int getToyId() {
		return toyId;
	}

	public void setToyId(int toyId) {
		this.toyId = toyId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
