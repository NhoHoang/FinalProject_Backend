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

	@Override
	public ArrayList<Donator> getAllDonator() {

		return (ArrayList<Donator>) repository.findAll();
	}

}
