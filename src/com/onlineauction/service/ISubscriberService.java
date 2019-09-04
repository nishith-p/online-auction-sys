package com.onlineauction.service;

import java.util.List;

import com.onlineauction.model.Subscriber;

public interface ISubscriberService {
	
	public void addSubscriber(Subscriber sub);
	
	public List<Subscriber> getAllSubscribers();
	
	public void deleteSubscriber(int subId);

}
