package com.vti.exam.dto;

import com.vti.exam.entity.Donator;

public class DonatorDTO {
	private String fullName;
	private String email;
	private String address;
	private String phone;

//	
	public DonatorDTO() {
		super();
	}

	public DonatorDTO(String fullName, String email, String address, String phone) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.address = address;
		this.phone = phone;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
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

	// method toEntity()
	public Donator toDonatorEntity() {
		return new Donator(phone, fullName, email, address);
	}

	public Donator toDonatorEntity1() {
		return new Donator(phone, fullName, email, address);
	}

}
