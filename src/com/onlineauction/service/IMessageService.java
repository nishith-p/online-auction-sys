package com.onlineauction.service;

import java.util.List;

import com.onlineauction.model.Message;

public interface IMessageService {
	
	public void addMessage(Message msj);
	
	public List<Message> getAllMessages();
	
	public void deleteMessage(int msjId);

}
