package com.onlineauction.service;

import java.util.List;

import com.onlineauction.model.Order;

public interface IOrderService {
	
	public void addOrder(Order o);
	
	public List<Order> getAllOrders();
	
	public List<Order> getOrderByCusId(int cusId);

}
