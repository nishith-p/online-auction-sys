package com.onlineauction.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import com.onlineauction.model.Auction;
import com.onlineauction.util.DBConnection;

public class AuctionService implements IAuctionService {

	private Connection conn;
	
	public AuctionService() {
		conn = DBConnection.getConnection();
	}
	
	public void addAuction(Auction auc) {
		
		try {
			String query = "insert into auction(cus_id, itemName, category, startPrice, currentPrice, endDate, bDescription, description, shippingAndDelivery, returnPolicy, image1) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, auc.getCus_id());
			st.setString(2, auc.getItemName());
			st.setString(3, auc.getCategory());
			st.setDouble(4, auc.getStartPrice());
			st.setDouble(5, auc.getStartPrice());
			st.setString(6, auc.getEndDate());
			st.setString(7, auc.getbDescription());
			st.setString(8, auc.getDescription());
			st.setString(9, auc.getShippingAndDelivery());
			st.setString(10, auc.getReturnPolicy());
			st.setString(11, auc.getImage1());
			
			st.executeUpdate();	
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
	}
	
	public List<Auction> getAllAuctions() {
		
		List<Auction> auctions = new ArrayList<Auction>();
		
		try {
			String query = "select * from auction where endDate > ?";
			PreparedStatement st = conn.prepareStatement(query);
			LocalDate date = java.time.LocalDate.now();
			String checkDate = String.valueOf(date);
			st.setString(1, checkDate);
			ResultSet rs = st.executeQuery();
			 
			while(rs.next()) {
				
				Auction auc = new Auction();
				
				auc.setAuctionId(rs.getInt("auctionId"));
				auc.setCus_id(rs.getInt("cus_id"));
				auc.setItemName(rs.getString("itemName"));
				auc.setbDescription(rs.getString("bDescription"));
				auc.setCategory(rs.getString("category"));
				auc.setStartPrice(rs.getDouble("startPrice"));
				auc.setCurrentPrice(rs.getDouble("currentPrice"));
				auc.setEndDate(rs.getString("endDate"));
				auc.setDescription(rs.getString("description"));
				auc.setShippingAndDelivery(rs.getString("shippingAndDelivery"));
				auc.setReturnPolicy(rs.getString("returnPolicy"));
				auc.setImage1(rs.getString("image1"));
				
				auctions.add(auc);
			}
		} catch (SQLException e) {
			 e.printStackTrace();
	    } 
		
		return auctions;
	}
	
	public List<Auction> getAllAuctions(int endPosition) {
		
		List<Auction> auctions = new ArrayList<Auction>();
		
		try {
			String query = "select * from auction where endDate > ? limit ?";
			PreparedStatement st = conn.prepareStatement(query);
			LocalDate date = java.time.LocalDate.now();
			String checkDate = String.valueOf(date);
			st.setString(1, checkDate);
			st.setInt(2, endPosition);
			ResultSet rs = st.executeQuery();
			 
			while(rs.next()) {
				
				Auction auc = new Auction();
				
				auc.setAuctionId(rs.getInt("auctionId"));
				auc.setCus_id(rs.getInt("cus_id"));
				auc.setItemName(rs.getString("itemName"));
				auc.setbDescription(rs.getString("bDescription"));
				auc.setCategory(rs.getString("category"));
				auc.setStartPrice(rs.getDouble("startPrice"));
				auc.setCurrentPrice(rs.getDouble("currentPrice"));
				auc.setEndDate(rs.getString("endDate"));
				auc.setDescription(rs.getString("description"));
				auc.setShippingAndDelivery(rs.getString("shippingAndDelivery"));
				auc.setReturnPolicy(rs.getString("returnPolicy"));
				auc.setImage1(rs.getString("image1"));
				
				auctions.add(auc);
			}
		} catch (SQLException e) {
			 e.printStackTrace();
	    } 
		
		return auctions;
	}
	
	public int getTotalCount() {
		int count = 0;
		
		try {
			String query = "select count(*) from auction where endDate > ?";
			PreparedStatement st = conn.prepareStatement(query);
			LocalDate date = java.time.LocalDate.now();
			String checkDate = String.valueOf(date);
			st.setString(1, checkDate);
			ResultSet rs = st.executeQuery();
			
			/*String query = "select count(*) from auction";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);*/
			
			while (rs.next()){
				count = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public List<Auction> getAuctionByAnyType(String value, String type) {
		List<Auction> auctions = new ArrayList<Auction>();
		
		try {
			String query;
			
			if (type.equalsIgnoreCase("cus_id")) {
				query = "select * from auction where cus_id = ?";
			} else if (type.equalsIgnoreCase("auctionId")) {
				query = "select * from auction where auctionId = ?";
			} else if (type.equalsIgnoreCase("other")) {
				query = "select * from auction where category = ?";
			} else {
				query = "select * from auction where itemName = ?";
			}
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, value);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Auction auc = new Auction();
				
				auc.setAuctionId(rs.getInt("auctionId"));
				auc.setCus_id(rs.getInt("cus_id"));
				auc.setItemName(rs.getString("itemName"));
				auc.setbDescription(rs.getString("bDescription"));
				auc.setCategory(rs.getString("category"));
				auc.setStartPrice(rs.getDouble("startPrice"));
				auc.setCurrentPrice(rs.getDouble("currentPrice"));
				auc.setEndDate(rs.getString("endDate"));
				auc.setDescription(rs.getString("description"));
				auc.setShippingAndDelivery(rs.getString("shippingAndDelivery"));
				auc.setReturnPolicy(rs.getString("returnPolicy"));
				auc.setImage1(rs.getString("image1"));
				
				auctions.add(auc);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return auctions;
	}
	
	public List<Auction> getAuctionByNameAndCategory(String name, String category) {
		List<Auction> auctions = new ArrayList<Auction>();
		String query;
		
		try {
			query = "select * from auction where itemName = ? and category = ? and endDate > ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, name);
			st.setString(2, category);
			LocalDate date = java.time.LocalDate.now();
			String checkDate = String.valueOf(date);
			st.setString(3, checkDate);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Auction auc = new Auction();
				
				auc.setAuctionId(rs.getInt("auctionId"));
				auc.setCus_id(rs.getInt("cus_id"));
				auc.setItemName(rs.getString("itemName"));
				auc.setbDescription(rs.getString("bDescription"));
				auc.setCategory(rs.getString("category"));
				auc.setStartPrice(rs.getDouble("startPrice"));
				auc.setCurrentPrice(rs.getDouble("currentPrice"));
				auc.setEndDate(rs.getString("endDate"));
				auc.setDescription(rs.getString("description"));
				auc.setShippingAndDelivery(rs.getString("shippingAndDelivery"));
				auc.setReturnPolicy(rs.getString("returnPolicy"));
				auc.setImage1(rs.getString("image1"));
				
				auctions.add(auc);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return auctions;
	}
	
	public List<Auction> getAuctionByPrice(double sPrice, double ePrice) {
		List<Auction> auctions = new ArrayList<Auction>();
		String query;
		
		try {
			query = "select * from auction where currentPrice between ? and ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setDouble(1, sPrice);
			st.setDouble(2, ePrice);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Auction auc = new Auction();
				
				auc.setAuctionId(rs.getInt("auctionId"));
				auc.setCus_id(rs.getInt("cus_id"));
				auc.setItemName(rs.getString("itemName"));
				auc.setbDescription(rs.getString("bDescription"));
				auc.setCategory(rs.getString("category"));
				auc.setStartPrice(rs.getDouble("startPrice"));
				auc.setCurrentPrice(rs.getDouble("currentPrice"));
				auc.setEndDate(rs.getString("endDate"));
				auc.setDescription(rs.getString("description"));
				auc.setShippingAndDelivery(rs.getString("shippingAndDelivery"));
				auc.setReturnPolicy(rs.getString("returnPolicy"));
				auc.setImage1(rs.getString("image1"));
				
				auctions.add(auc);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return auctions;
	}
	
	public void deleteAuction(int auctionId) {
		String query;
		
		try {
			query = "delete from auction where auctionId = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, auctionId);
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public Auction getAuctionById(int auc_id) {
		Auction auc = new Auction();
		String query;
		
		try {
			query = "select * from auction where auctionId = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, auc_id);
			ResultSet rs = st.executeQuery();
			
			if (rs.next()) {
				auc.setAuctionId(rs.getInt("auctionId"));
				auc.setCus_id(rs.getInt("cus_id"));
				auc.setItemName(rs.getString("itemName"));
				auc.setbDescription(rs.getString("bDescription"));
				auc.setCategory(rs.getString("category"));
				auc.setStartPrice(rs.getDouble("startPrice"));
				auc.setCurrentPrice(rs.getDouble("currentPrice"));
				auc.setEndDate(rs.getString("endDate"));
				auc.setDescription(rs.getString("description"));
				auc.setShippingAndDelivery(rs.getString("shippingAndDelivery"));
				auc.setReturnPolicy(rs.getString("returnPolicy"));
				auc.setImage1(rs.getString("image1"));	
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return auc;
	}
	
	public void updateCurrentPrice(int auctionId, double price) {
		String query;
		
		try {
			query = "update auction set currentPrice = ? where auctionId = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setDouble(1, price);
			st.setInt(2, auctionId);
			
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
}


