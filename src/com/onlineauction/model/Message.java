package com.onlineauction.model;

public class Message {
	
	private int msjId;
	private String name;
	private String email;
	private String phone;
	private String message;
	
	public int getMsjId() {
		return msjId;
	}

	public void setMsjId(int msjId) {
		this.msjId = msjId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
}
