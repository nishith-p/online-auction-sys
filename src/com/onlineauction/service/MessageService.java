package com.onlineauction.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.onlineauction.model.Message;
import com.onlineauction.util.DBConnection;

public class MessageService implements IMessageService {

	private Connection conn;
	
	public MessageService() {
		conn = DBConnection.getConnection();
	}
	
	public void addMessage(Message msj) {
		String query;
		
		try {
			query = "insert into message(name, email, phone, message) values( ?, ?, ?, ?)";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, msj.getName());
			st.setString(2, msj.getEmail());
			st.setString(3, msj.getPhone());
			st.setString(4, msj.getMessage());
			
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Message> getAllMessages() {
		List<Message> msj = new ArrayList<>();
		String query;
		
		try {
			query = "select * from message";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while (rs.next()) {
				Message message = new Message();
				
				message.setMsjId(rs.getInt("msj_id"));
				message.setName(rs.getString("name"));
				message.setEmail(rs.getString("email"));
				message.setPhone(rs.getString("phone"));
				message.setMessage(rs.getString("message"));
				
				msj.add(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return msj;
	}
	
	public void deleteMessage(int msjId) {
		String query;
		
		try {
			query = "delete from message where msj_id = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, msjId);
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
