package com.onlineauction.service;

import java.util.List;
import com.onlineauction.model.Auction;

public interface IAuctionService {

	public void addAuction(Auction auc);
	
	public List<Auction> getAllAuctions();
	
	public Auction getAuctionById(int auctionId);
	
	public List<Auction> getAllAuctions(int endPosition);
	
	public int getTotalCount();
	
	public List<Auction> getAuctionByAnyType(String value, String type);
	
	public List<Auction> getAuctionByNameAndCategory(String name, String category);
	
	public List<Auction> getAuctionByPrice(double sPrice, double ePrice);
	
	public void deleteAuction(int auctionId);
	
	public void updateCurrentPrice(int auctionId, double price);
}
