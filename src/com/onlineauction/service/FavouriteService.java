package com.onlineauction.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.onlineauction.model.Favourite;
import com.onlineauction.util.DBConnection;

public class FavouriteService implements IFavouriteService {
	
	private Connection conn;
	
	public FavouriteService() {
		conn = DBConnection.getConnection();
	}
	
	public void addFavourite(Favourite fav) {
		String query;
		
		try {
			query = "insert into favourite(auc_id, cus_id) values(?, ?)";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, fav.getAuctionId());
			st.setInt(2, fav.getCus_id());
			st.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Favourite> getFavourites(int cus_id) {
		List<Favourite> fav = new ArrayList<>();
		String query;
		
		try {
			query = "select * from favourite where cus_id = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, cus_id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Favourite favourites = new Favourite();
				
				favourites.setFav_id(rs.getInt("fav_id"));
				favourites.setAuctionId(rs.getInt("auc_id"));
				favourites.setCus_id(rs.getInt("cus_id"));
				
				fav.add(favourites);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fav;
	}
	
	public void deleteFavourite(String auctionId, String cus_id) {
		String query;
		
		try {
			query = "delete from favourite where auc_id = ? and cus_id = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, auctionId);
			st.setString(2, cus_id);
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
