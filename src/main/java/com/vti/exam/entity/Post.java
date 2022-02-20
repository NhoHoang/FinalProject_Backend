package com.vti.exam.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "`Post`")
public class Post implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "`id`", unique = true, nullable = false)
	private int id;

	@Column(name = "`title`", nullable = false, length = 500, unique = true)
	private String title;

	@Column(name = "`content_1`", nullable = false, length = 1000)
	private String content_1;

	@Column(name = "`content_2`", nullable = false, length = 1000)
	private String content_2;

	@Column(name = "`img_1`", length = 500)
	private String img_1;

	@Column(name = "`img_2`", length = 500)
	private String img_2;

	@Column(name = "`donator_quantity`")
	private int donator_quantity;

	@Column(name = "`money_achieved`")
	private int money_achieved;

	private String startDate;

	private String finishDate;

//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "post", cascade = CascadeType.ALL)
	@ManyToMany
	@JoinTable(name = "Donator_Post", joinColumns = @JoinColumn(name = "postID"), inverseJoinColumns = @JoinColumn(name = "donatorID"))
	private List<Donator> donator;

	// -----------------------------contructor-------------------------------------
	public Post(int id, String title, String content_1, String content_2, String img_1, String img_2,
			int donator_quantity, int money_achieved, String startDate, String finishDate) {
		super();
		this.id = id;
		this.title = title;
		this.content_1 = content_1;
		this.content_2 = content_2;
		this.img_1 = img_1;
		this.img_2 = img_2;
		this.donator_quantity = donator_quantity;
		this.money_achieved = money_achieved;
		this.startDate = startDate;
		this.finishDate = finishDate;
	}

	public Post(int id) {
		super();
		this.id = id;
	}

	public Post() {
		super();
	}

	public Post(String title, String content_1, String content_2, String img_1, String img_2) {
		super();
		this.title = title;
		this.content_1 = content_1;
		this.content_2 = content_2;
		this.img_1 = img_1;
		this.img_2 = img_2;
	}

	// ----------------------------- getter & setter-----------------------------
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent_1() {
		return content_1;
	}

	public void setContent_1(String content_1) {
		this.content_1 = content_1;
	}

	public String getContent_2() {
		return content_2;
	}

	public void setContent_2(String content_2) {
		this.content_2 = content_2;
	}

	public String getImg_1() {
		return img_1;
	}

	public void setImg_1(String img_1) {
		this.img_1 = img_1;
	}

	public String getImg_2() {
		return img_2;
	}

	public void setImg_2(String img_2) {
		this.img_2 = img_2;
	}

	public int getDonator_quantity() {
		return donator_quantity;
	}

	public void setDonator_quantity(int donator_quantity) {
		this.donator_quantity = donator_quantity;
	}

	public int getMoney_achieved() {
		return money_achieved;
	}

	public void setMoney_achieved(int money_achieved) {
		this.money_achieved = money_achieved;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<Donator> getDonator() {
		return donator;
	}

	public void setDonator(List<Donator> donator) {
		this.donator = donator;
	}

}
