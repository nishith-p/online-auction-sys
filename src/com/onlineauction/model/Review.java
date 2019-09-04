package com.onlineauction.model;

public class Review {

	private int revId;
	private int auctionId;
	private int cusId;
	private String date;
	private String review;
	
	public int getRevId() {
		return revId;
	}
	
	public void setRevId(int revId) {
		this.revId = revId;
	}
	
	public int getAuctionId() {
		return auctionId;
	}
	
	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
	}
	
	public int getCusId() {
		return cusId;
	}
	
	public void setCusId(int cusId) {
		this.cusId = cusId;
	}
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getReview() {
		return review;
	}
	
	public void setReview(String review) {
		this.review = review;
	}
}
