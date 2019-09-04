package com.onlineauction.model;

public class Bid {

		private int bidId;
		private int auctionId;
		private int cusId;
		private double price;
		private String date;
		
		public int getBidId() {
			return bidId;
		}
		
		public void setBidId(int bidId) {
			this.bidId = bidId;
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
		
		public double getPrice() {
			return price;
		}
		
		public void setPrice(double price) {
			this.price = price;
		}
		
		public String getDate() {
			return date;
		}
		
		public void setDate(String date) {
			this.date = date;
		}
}
