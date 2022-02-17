package com.vti.exam.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vti.exam.entity.Donator;
import com.vti.exam.repository.IDonatorRepository;

@Service
public class DonatorService implements IDonatorService {

	@Autowired
	private IDonatorRepository repository;
	
//	@Autowired
//	private IDonatorPostRepository donartorPostRP;
//	

	@Override
	public ArrayList<Donator> getAllDonator() {

		return (ArrayList<Donator>) repository.findAll();
	}

	@Override
	public Donator createDonate(Donator donaterEntity) {
		Donator donator = new Donator();
		Donator donator0 = repository.existsByEmail(donaterEntity.getEmail());
		if (donator0 != null) {
			return donator0;
		} else {
			donator.setAddress(donaterEntity.getAddress());
			donator.setEmail(donaterEntity.getEmail());
			donator.setFullName(donaterEntity.getFullName());
			donator.setPhone(donaterEntity.getPhone());
			repository.save(donator);
			return donator;
		}
	}

//	@Override
//	public void createDonatePost(int donaterId, Donator_Post_Save_Data donatorPostEntity ) {
//		
//		Donator_Post_Save_Data donatorPost = new Donator_Post_Save_Data();
//		donatorPost.setMessage(donatorPostEntity.getMessage());
//		donatorPost.setTotal_money(donatorPostEntity.getTotal_money());
//		donatorPost.setPostId(donatorPostEntity.getPostId());
//		donatorPost.setDonatorId(donaterId);
//		donartorPostRP.save(donatorPost);
//		
//		
//
//	}

}
