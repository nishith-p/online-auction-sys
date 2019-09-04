package com.onlineauction.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.onlineauction.model.Subscriber;
import com.onlineauction.util.DBConnection;

public class SubscriberService implements ISubscriberService{
	
	private Connection conn;
	
	public SubscriberService() {
		conn = DBConnection.getConnection();
	}
	
	public void addSubscriber(Subscriber sub) {
		String query;
		
		try {
			query = "insert into subscriber(email) values(?)";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, sub.getEmail());
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Subscriber> getAllSubscribers() {
		List<Subscriber> subscriber = new ArrayList<>();
		String query;
		
		try {
			query = "select * from subscriber";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while (rs.next()) {
				Subscriber sub = new Subscriber();
				
				sub.setSub_id(rs.getInt("sub_id"));
				sub.setEmail(rs.getString("email"));
				
				subscriber.add(sub);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return subscriber;
	}

	public void deleteSubscriber(int subId) {
		String query;
		
		try {
			query = "delete from subscriber where sub_id = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, subId);
			
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
