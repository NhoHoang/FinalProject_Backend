package com.vti.exam.dto;

public class ProfileDTO {

	private String userName;

	private String email;

	private String fullName;

	private String phone;

	private String role;

	private String status;

	private String avatarUrl;

	public ProfileDTO(String userName, String email, String fullName, String role, String status, String avatarUrl) {
		this.userName = userName;
		this.email = email;
		this.fullName = fullName;

		this.role = role;
		this.status = status;
		this.avatarUrl = avatarUrl;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserName() {
		return userName;
	}

	public String getEmail() {
		return email;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
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

	public String getStatus() {
		return status;
	}

	public String getAvatarUrl() {
		return avatarUrl;
	}

}
