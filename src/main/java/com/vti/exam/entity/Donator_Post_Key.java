package com.vti.exam.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Donator_Post_Key implements Serializable {

	@Column(name = "donatorID")
	int donatorID;

	@Column(name = "postID")
	int postID;

	public int getDonatorID() {
		return donatorID;
	}

	public void setDonatorID(int donatorID) {
		this.donatorID = donatorID;
	}

	public int getPostID() {
		return postID;
	}

	public void setPostID(int postID) {
		this.postID = postID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(donatorID, postID);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Donator_Post_Key other = (Donator_Post_Key) obj;
		return donatorID == other.donatorID && postID == other.postID;
	}

}
