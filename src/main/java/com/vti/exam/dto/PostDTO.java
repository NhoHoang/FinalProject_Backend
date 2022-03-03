package com.vti.exam.dto;

import com.vti.exam.entity.Post;

public class PostDTO {

	private int id;

	private String title;

	private String content_1;

	private String content_2;

	private String img_1;

	private String img_2;

	private int planBudget;

	private String startDate;

	private String finishDate;

	public PostDTO(String title, String content_1, String content_2, String img_1, String img_2, int planBudget,
			String startDate, String finishDate) {
		super();
		this.title = title;
		this.content_1 = content_1;
		this.content_2 = content_2;
		this.img_1 = img_1;
		this.img_2 = img_2;
		this.planBudget = planBudget;
		this.startDate = startDate;
		this.finishDate = finishDate;
	}

	public String getTitle() {
		return title;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getPlanBudget() {
		return planBudget;
	}

	public void setPlanBudget(int planBudget) {
		this.planBudget = planBudget;
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

	public Post toEntity() {
		return new Post(title, content_1, content_2, img_1, img_2, planBudget, startDate, finishDate);
	}

}
