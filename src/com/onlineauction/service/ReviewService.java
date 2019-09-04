package com.onlineauction.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.onlineauction.model.Review;
import com.onlineauction.util.DBConnection;

public class ReviewService implements IReviewService {

	private Connection conn;
	
	public ReviewService() {
		conn = DBConnection.getConnection();
	}
	
	public void addReview(Review rev) {
		String query;
		
		try {
			query = "insert into review(auc_id, cus_id, date, review) values( ?, ?, ?, ?)";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, rev.getAuctionId());
			st.setInt(2, rev.getCusId());
			st.setString(3, rev.getDate());
			st.setString(4, rev.getReview());
			
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Review> getAllReviews(int auctionId) {
		List<Review> review = new ArrayList<>();
		String query;
		
		try {
			query = "select * from review where auc_id = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, auctionId);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Review rev = new Review();
				
				rev.setRevId(rs.getInt("rev_id"));
				rev.setAuctionId(rs.getInt("auc_id"));
				rev.setCusId(rs.getInt("cus_id"));
				rev.setDate(rs.getString("date"));
				rev.setReview(rs.getString("review"));
				
				review.add(rev);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return review;
	}

}
