package com.onlineauction.service;

import java.util.List;

import com.onlineauction.model.Favourite;

public interface IFavouriteService {

	public void addFavourite(Favourite fav);
	
	public List<Favourite> getFavourites(int cus_id);
	
	public void deleteFavourite(String auctionId, String cus_id);
}
