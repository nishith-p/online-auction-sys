package com.onlineauction.model;

public class Favourite {

	private int fav_id;
	private int auctionId;
	private int cus_id;
	
	public int getFav_id() {
		return fav_id;
	}
	
	public void setFav_id(int fav_id) {
		this.fav_id = fav_id;
	}
	
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
}
