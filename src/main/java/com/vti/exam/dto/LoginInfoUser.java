package com.vti.exam.dto;

public class LoginInfoUser {

	private String token;

	private String userName;

	private String email;

	private String fullName;

	private String address;

	private String role;

	private String status;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public LoginInfoUser(String token, String userName, String email, String fullName, String role, String status) {
		super();
		this.token = token;
		this.userName = userName;
		this.email = email;
		this.fullName = fullName;
		this.role = role;
		this.status = status;
	}

	public LoginInfoUser(String token, String userName, String email, String fullName, String address, String role,
			String status) {
		super();
		this.token = token;
		this.userName = userName;
		this.email = email;
		this.fullName = fullName;
		this.address = address;
		this.role = role;
		this.status = status;
	}

	public LoginInfoUser() {
		super();
	}

}
