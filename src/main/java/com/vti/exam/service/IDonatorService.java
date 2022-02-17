package com.vti.exam.service;

import java.util.ArrayList;

import com.vti.exam.entity.Donator;
import com.vti.exam.entity.Donator_Post_Save_Data;

public interface IDonatorService {

	ArrayList<Donator> getAllDonator();

	Donator createDonate(Donator donaterEntity);

	void createDonatePost(int donaterId, Donator_Post_Save_Data donator_Post_Save_Data);

	
	

}
