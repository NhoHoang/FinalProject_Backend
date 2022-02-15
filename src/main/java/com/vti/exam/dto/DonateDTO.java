package com.vti.exam.dto;

import com.vti.exam.entity.Donator;

public class DonateDTO {
	private String fullname;
	private String email;
	private String address;
	private String phone;
	private int postId;
	private int moneyDonation;
	private String message;
	
	public DonateDTO(String fullname, String email, String address, String phone) {
		this.fullname = fullname;
		this.email = email;
		this.address=address;
		this.phone=phone;
	}
	public DonateDTO(int postId, int moneyDonation, String message) {
		this.moneyDonation = moneyDonation;
		this.postId = postId;
		this.message = message;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getMoneyDonation() {
		return moneyDonation;
	}
	public void setMoneyDonation(int moneyDonation) {
		this.moneyDonation = moneyDonation;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Donator toDonaterEntity() {
		return new Donator(fullname, email,address, phone);
	}
	
	
}
