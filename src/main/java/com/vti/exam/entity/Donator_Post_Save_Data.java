package com.vti.exam.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "`Donator_Post`")
public class Donator_Post_Save_Data implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "donatorID")
	private int donatorId;

	@Column(name = "postID")
	private int postId;

	@Column(name = "`total_money`")
	private int total_money;

	@Column(name = "`message`", length = 1000)
	private String message;

	public Donator_Post_Save_Data(int postId, int total_money, String message) {
		super();
		this.postId = postId;
		this.total_money = total_money;
		this.message = message;
	}

	public Donator_Post_Save_Data() {
		super();
	}

	public int getDonatorId() {
		return donatorId;
	}

	public void setDonatorId(int donatorId) {
		this.donatorId = donatorId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getTotal_money() {
		return total_money;
	}

	public void setTotal_money(int total_money) {
		this.total_money = total_money;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
