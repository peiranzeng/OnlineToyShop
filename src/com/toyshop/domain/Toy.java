package com.toyshop.domain;

public class Toy {
	int id;
	String productName;
	String category;
	int stickNumber;
	double listPrice;
	double ourPrice;
	String publishDate;
	String imageUrl;
	
	public Toy(int id, String productName, String category, int stickNumber, double listPrice, double ourPrice,
			String publishDate, String imageUrl) {
		this.id = id;
		this.productName = productName;
		this.category = category;
		this.stickNumber = stickNumber;
		this.listPrice = listPrice;
		this.ourPrice = ourPrice;
		this.publishDate = publishDate;
		this.imageUrl = imageUrl;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getStickNumber() {
		return stickNumber;
	}
	public void setStickNumber(int stickNumber) {
		this.stickNumber = stickNumber;
	}
	public double getListPrice() {
		return listPrice;
	}
	public void setListPrice(double listPrice) {
		this.listPrice = listPrice;
	}
	public double getOurPrice() {
		return ourPrice;
	}
	public void setOurPrice(double ourPrice) {
		this.ourPrice = ourPrice;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	
}
