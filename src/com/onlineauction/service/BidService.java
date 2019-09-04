package com.onlineauction.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.onlineauction.model.Bid;
import com.onlineauction.util.DBConnection;

public class BidService implements IBidService {

	private Connection conn;
	
	public BidService() {
		conn = DBConnection.getConnection();
	}
	
	public void addBid(Bid bid) {
		String query;
		
		try {
			query = "insert into bids(auc_id, cus_id, price, date) values(?, ?, ?, ?)";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, bid.getAuctionId());
			st.setInt(2, bid.getCusId());
			st.setDouble(3, bid.getPrice());
			LocalDate date = java.time.LocalDate.now();
			String currentDate = String.valueOf(date);
			st.setString(4, currentDate);
			
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Bid> getAllBids() {
		List<Bid> bids = new ArrayList<>();
		String query;
		
		try {
			query = "select * from bids";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while (rs.next()) {
				Bid bid = new Bid();
				
				bid.setBidId(rs.getInt("bid_id"));
				bid.setAuctionId(rs.getInt("auc_id"));
				bid.setCusId(rs.getInt("cus_id"));
				bid.setPrice(rs.getDouble("price"));
				bid.setDate(rs.getString("date"));
				
				bids.add(bid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bids;
	}
	
	public List<Bid> getBid(int cus_id) {
		List<Bid> bids = new ArrayList<>();
		String query;
		
		try {
			query = "select * from bids where cus_id = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, cus_id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Bid bd = new Bid();
				
				bd.setBidId(rs.getInt("bid_id"));
				bd.setAuctionId(rs.getInt("auc_id"));
				bd.setDate(rs.getString("date"));
				bd.setCusId(rs.getInt("cus_id"));
				bd.setPrice(rs.getDouble("price"));

				bids.add(bd);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bids;
	}
	
	public Bid getBidMax(int cus_id) {
		Bid bids2 = new Bid();
		String query;
		
		try {
			query = "SELECT auc_id, cus_id, max(price) FROM bids where cus_id = ? GROUP BY auc_id , cus_id";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, cus_id);
			ResultSet rs = st.executeQuery();
			
			if (rs.next()) {
				bids2.setAuctionId(rs.getInt("auc_id"));
				bids2.setCusId(rs.getInt("cus_id"));
				bids2.setPrice(rs.getDouble("max(price)"));

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bids2;
	}
	
	public double getBidMax2(int auc_id, int cus_id) {
		double cusMaxBid = 0; 
		String query; 
		
		try {
			query = "SELECT max(price) FROM bids where auc_id = ? && cus_id = ? group by auc_id, cus_id having max(price)";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, auc_id);
			st.setInt(2, cus_id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				cusMaxBid = rs.getDouble("max(price)"); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cusMaxBid; 
	}
	
	public double getFinal(int auc_id) {
		double cusFinal = 0; 
		String query; 
		
		try {
			query = "select max(price) from bids where auc_id = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, auc_id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				cusFinal = rs.getDouble("max(price)"); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cusFinal; 
	}
	
	public void deleteBid(int bidId) {
		String query;
		
		try {
			query = "delete from bids where bid_id = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, bidId);
			
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
