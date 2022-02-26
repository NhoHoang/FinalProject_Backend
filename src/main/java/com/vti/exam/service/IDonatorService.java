package com.vti.exam.service;

import java.util.ArrayList;

import com.vti.exam.dto.DonatorPostDTO;
import com.vti.exam.entity.Donator;

public interface IDonatorService {

	ArrayList<Donator> getAllDonator();

	void createDonatePost(int donatorId, int postId, String mess, int money);

	Donator findDonatorByPhone(String phone);

	void createDonator(DonatorPostDTO dto);

}
