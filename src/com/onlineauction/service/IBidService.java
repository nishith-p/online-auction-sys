package com.onlineauction.service;

import java.util.List;

import com.onlineauction.model.Bid;

public interface IBidService {
	
	public void addBid(Bid bid);
	
	public List<Bid> getAllBids();
	
	public List<Bid> getBid(int cus_id);
	
	public Bid getBidMax(int cus_id);
	
	public double getBidMax2(int auc_id, int cus_id);
	
	public double getFinal(int auc_id);
	
	public void deleteBid(int bidId);

}
