package com.onlineauction.service;

import java.sql.*;
import com.onlineauction.util.DBConnection;

public class LoginDao implements ILoginDao {
	
	private static Connection conn;

	public boolean check(String userName, String password) {
		
		conn = DBConnection.getConnection();
		String query = "select * from customer where (uname = ? or email = ?) and password = ?";
		
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, userName);
			st.setString(2, userName);
			st.setString(3, password);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				return true;
			} 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
}
