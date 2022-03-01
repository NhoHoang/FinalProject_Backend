package com.vti.exam.dto;

import com.vti.exam.entity.User;

public class UserUpdateDTO {

	// (regex)...
	private String email;

	private String address;

	private String phone;
// check not null, check length, check format (regex)...

	// check not null, check length, check format (regex)...
	private String fullName;

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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public UserUpdateDTO(String email, String address, String phone, String fullName) {
		super();
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.fullName = fullName;
	}

	public UserUpdateDTO() {
		super();
	}

	public User toEntity() {
		return new User(email, address, phone, fullName);
	}

}
