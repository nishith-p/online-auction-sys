package com.onlineauction.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.onlineauction.model.Order;
import com.onlineauction.util.DBConnection;

public class OrderService implements IOrderService{

	private Connection conn;
	
	public OrderService() {
		conn = DBConnection.getConnection();
	}

	public void addOrder(Order o) {
		String query;
		
		try {
			query = "insert into orders(auc_id, cus_id, bid_id, price, date) values( ?, ?, ?, ?, ?)";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, o.getAuctionId());
			st.setInt(2, o.getCusId());
			st.setInt(3, o.getBidId());
			st.setDouble(4, o.getPrice());
			st.setString(5, o.getDate());
			
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Order> getAllOrders() {
		List<Order> orders = new ArrayList<>();
		String query;
		
		try {
			query = "select * from orders";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while (rs.next()) {
				Order order = new Order();
				
				order.setOrderId(rs.getInt("order_id"));
				order.setAuctionId(rs.getInt("auc_id"));
				order.setBidId(rs.getInt("bid_id"));
				order.setCusId(rs.getInt("cus_id"));
				order.setPrice(rs.getDouble("price"));
				order.setDate(rs.getString("date"));
				
				orders.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orders;
	}
	
	public List<Order> getOrderByCusId(int cusId) {
		List<Order> orders = new ArrayList<>();
		String query;
		
		try {
			query = "select * from orders o, auction a where o.auc_id = a.auctionId and a.cus_id = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, cusId);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Order order = new Order();
				
				order.setOrderId(rs.getInt("order_id"));
				order.setAuctionId(rs.getInt("auc_id"));
				order.setBidId(rs.getInt("bid_id"));
				order.setCusId(rs.getInt("cus_id"));
				order.setPrice(rs.getDouble("price"));
				order.setDate(rs.getString("date"));
				
				orders.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orders;
	}
	
}
