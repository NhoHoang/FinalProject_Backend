package com.vti.exam.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "`Donator`")
public class Donator implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "`id`", unique = true, nullable = false)
	private int id;

	@Column(name = "`phone`", nullable = false, length = 50, unique = true)
	private String phone;

	@Column(name = "`fullName`", nullable = false, length = 50)
	private String fullName;

	@Column(name = "`email`", nullable = false, length = 50, unique = true)
	private String email;

	@Column(name = "`address`", length = 800)
	private String address;

	@ManyToMany(mappedBy = "donator")
//	(fetch=FetchType.LAZY, mappedBy = "donator", cascade = CascadeType.ALL)
	private List<Post> post;

	// -----------------------------contructor-------------------------------------

	public Donator(int id, String phone, String fullName, String email, String address) {

		super();
		this.id = id;
		this.phone = phone;
		this.fullName = fullName;
		this.email = email;
		this.address = address;

	}

	public Donator(String phone, String fullName, String email, String address) {
		super();
		this.phone = phone;
		this.fullName = fullName;
		this.email = email;
		this.address = address;
	}

	// ----------------------------- getter & setter-----------------------------
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Donator() {
		super();
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
