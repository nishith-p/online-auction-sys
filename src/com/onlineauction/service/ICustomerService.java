package com.onlineauction.service;

import java.util.List;
import com.onlineauction.model.Customer;

public interface ICustomerService {

	public void addCustomer(Customer cus);
	
	public List<Customer> getAllCustomers();
	
	public Customer getCustomerById(int cus_id);
	
	public Customer getCustomerByOtherType(String value, String type);
	
	public void updateCustomer(Customer cus);
	
	public void uploadProfilePicture(Customer cus);
	
	public void deleteCustomer(int cusId);
}
