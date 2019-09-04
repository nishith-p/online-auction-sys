package com.onlineauction.model;

public class Auction {

	private int auctionId;
	private int cus_id;
	private String itemName;
	private String bDescription;
	private String category;
	private double startPrice;
	private double currentPrice;
	private String endDate;
	private String description;
	private String shippingAndDelivery;
	private String returnPolicy;
	private String image1;
	
	public int getAuctionId() {
		return auctionId;
	}
	
	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
	}
	
	public int getCus_id() {
		return cus_id;
	}

	public void setCus_id(int cus_id) {
		this.cus_id = cus_id;
	}

	public String getItemName() {
		return itemName;
	}
	
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public String getbDescription() {
		return bDescription;
	}

	public void setbDescription(String bDescription) {
		this.bDescription = bDescription;
	}

	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public double getStartPrice() {
		return startPrice;
	}
	
	public void setStartPrice(double startPrice) {
		this.startPrice = startPrice;
	}
	
	public double getCurrentPrice() {
		return currentPrice;
	}
	
	public void setCurrentPrice(double currentPrice) {
		this.currentPrice = currentPrice;
	}
	
	public String getEndDate() {
		return endDate;
	}
	
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getShippingAndDelivery() {
		return shippingAndDelivery;
	}
	
	public void setShippingAndDelivery(String shippingAndDelivery) {
		this.shippingAndDelivery = shippingAndDelivery;
	}
	
	public String getReturnPolicy() {
		return returnPolicy;
	}
	
	public void setReturnPolicy(String returnPolicy) {
		this.returnPolicy = returnPolicy;
	}
	
	public String getImage1() {
		return image1;
	}
	
	public void setImage1(String image1) {
		this.image1 = image1;
	}
}
