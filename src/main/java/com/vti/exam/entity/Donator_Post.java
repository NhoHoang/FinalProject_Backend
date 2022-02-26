package com.vti.exam.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "`Donator_Post`")
public class Donator_Post implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

//	@Id
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "donatorID")
	private Donator donator;

//	@Id
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "postID")
	private Post post;

	@Column(name = "`total_money`")
	private int total_money;

	@Column(name = "`message`", length = 1000)
	private String message;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public Donator_Post(Donator donator, Post post, int total_money, String message) {
		super();
		this.donator = donator;
		this.post = post;
		this.total_money = total_money;
		this.message = message;
	}

	public Donator_Post() {
		super();
	}

	@Override
	public int hashCode() {
		return Objects.hash(donator, message, post, total_money);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Donator_Post other = (Donator_Post) obj;
		return Objects.equals(donator, other.donator) && Objects.equals(message, other.message)
				&& Objects.equals(post, other.post) && total_money == other.total_money;
	}

}
