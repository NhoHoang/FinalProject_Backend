package com.vti.exam.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "`Donator_Post`")
public class Donator_Post implements Serializable {

	private static final long serialVersionUID = 1L;

	@EmbeddedId
	Donator_Post_Key id;

//	@Id
	@ManyToOne
	@MapsId("donatorID")
	@JoinColumn(name = "donatorID")
	private Donator donator;

//	@Id
	@ManyToOne
	@MapsId("postID")
	@JoinColumn(name = "postID")
	private Post post;

	@Column(name = "`total_money`")
	private int total_money;

	@Column(name = "`message`", length = 1000)
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;

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

	public int getTotal_money() {
		return total_money;
	}

	public void setTotal_money(int total_money) {
		this.total_money = total_money;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
