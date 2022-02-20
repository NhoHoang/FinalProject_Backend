package com.vti.exam.dto;

import com.vti.exam.entity.Donator;
import com.vti.exam.entity.Donator_Post;
import com.vti.exam.entity.Post;

public class DonatorPostDTO {
	private String fullName;
	private String email;
	private String address;
	private String phone;
//	private int donatorId;
//	private int postId;
	private Donator donator;
	private Post post;
	private int moneyDonation;
	private String message;

	public DonatorPostDTO() {
		super();
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

	public Donator getDonator() {
		return donator;
	}

	public void setDonator(Donator donator) {
		this.donator = donator;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public int getMoneyDonation() {
		return moneyDonation;
	}

	public void setMoneyDonation(int moneyDonation) {
		this.moneyDonation = moneyDonation;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public DonatorPostDTO(String fullName, String email, String address, String phone, Donator donator, Post post,
			int moneyDonation, String message) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.donator = donator;
		this.post = post;
		this.moneyDonation = moneyDonation;
		this.message = message;
	}

	public Donator_Post toDonatorPostEntity() {
		return new Donator_Post(donator, post, moneyDonation, message);
	}

	public DonatorDTO toDonatorDTOEntity() {
		return new DonatorDTO(fullName, email, address, phone);
	}

	public Donator toDonatorEntity() {
		return new Donator(fullName, email, address, phone);
	}

}
