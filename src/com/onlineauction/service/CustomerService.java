package com.onlineauction.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.onlineauction.model.Customer;
import com.onlineauction.util.DBConnection;

public class CustomerService implements ICustomerService {

	private Connection conn;
	
	public CustomerService() {
		conn = DBConnection.getConnection();
	}
	
	public void addCustomer(Customer cus) {
		try {
			String query = "insert into customer(uname, email, fName, lName, password, image) values( ?, ?, ?, ?, ?, ?)";
			PreparedStatement st = conn.prepareStatement(query);
			
			st.setString(1, cus.getUserName());
			st.setString(2, cus.getEmail());
			st.setString(3, "Your");
			st.setString(4, "Name");
			st.setString(5, cus.getPassword());
			st.setString(6, "profile-default-image.png");
			
			st.executeUpdate();	
		} catch (SQLException e) {
            e.printStackTrace();
        }
	}
	
	public List<Customer> getAllCustomers() {
		 List<Customer> customers = new ArrayList<Customer>();
		 
		 try {
			 String query = "select * from customer where cus_id not in (7)";
			 Statement st = conn.createStatement();
			 ResultSet rs = st.executeQuery(query);
			 
			 while(rs.next()) {
				 Customer cus = new Customer();
				 
				 cus.setCus_id(rs.getInt("cus_id"));
				 cus.setEmail(rs.getString("email"));
				 cus.setUserName(rs.getString("uname"));
				 cus.setFirstName(rs.getString("fName"));
				 cus.setLastName(rs.getString("lName"));
				 
				 customers.add(cus);
			 }
		 } catch (SQLException e) {
			 e.printStackTrace();
	     }
		 
		 return customers;
	}
	
	public Customer getCustomerById(int cus_id) {
		Customer customer = new Customer();
		
		try {
			String query = "select * from customer where cus_id = ?";
			PreparedStatement st = conn.prepareStatement(query);
			
			st.setInt(1, cus_id);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				 customer.setCus_id(rs.getInt("cus_id"));
				 customer.setEmail(rs.getString("email"));
				 customer.setUserName(rs.getString("uname"));
				 customer.setFirstName(rs.getString("fName"));
				 customer.setLastName(rs.getString("lName"));
				 customer.setAbout(rs.getString("about"));
				 customer.setImage(rs.getString("image"));
			}
		} catch (SQLException e) {
            e.printStackTrace();
        }
		
		return customer;
	}
	
	public Customer getCustomerByOtherType(String value, String type) {
		Customer customer = new Customer();
		
		try {
			String query;
			
			if (type.equalsIgnoreCase("uname")) {
				query = "select * from customer where uname = ?";
			} else {
				query = "select * from customer where email = ?";
			}
			
			PreparedStatement st = conn.prepareStatement(query);
			
			st.setString(1, value);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				 customer.setCus_id(rs.getInt("cus_id"));
				 customer.setEmail(rs.getString("email"));
				 customer.setUserName(rs.getString("uname"));
				 customer.setFirstName(rs.getString("fName"));
				 customer.setLastName(rs.getString("lName"));
				 customer.setAbout(rs.getString("about"));
				 customer.setImage(rs.getString("image"));
			} else {
				customer = null;
			}
		} catch (SQLException e) {
            e.printStackTrace();
        }
		
		return customer;
	}
	
	public void updateCustomer(Customer cus) {
		String query = "update customer set uname=?, email=?, fName=?, lName=?, about=? where uname=?";
		
		try {
			PreparedStatement st = conn.prepareStatement(query);
			
			st.setString(1, cus.getUserName());
			st.setString(2, cus.getEmail());
			st.setString(3, cus.getFirstName());
			st.setString(4, cus.getLastName());
			st.setString(5, cus.getAbout());
			st.setString(6, cus.getUserName());
			
			st.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
        }
	}
	
	public void uploadProfilePicture(Customer cus) {
		String query = "update customer set image=? where uname=?";
		
		try {
			PreparedStatement st = conn.prepareStatement(query);
			
			st.setString(1, cus.getImage());
			st.setString(2, cus.getUserName());
			
			st.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
        }
	}
	
	public void deleteCustomer(int cusId) {
		String query;
		
		try {
			query = "delete from customer where cus_id = ?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, cusId);
			
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
