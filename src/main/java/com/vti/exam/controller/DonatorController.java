package com.vti.exam.controller;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vti.exam.dto.DonateDTO;
import com.vti.exam.entity.Donator;
import com.vti.exam.service.IDonatorService;

@CrossOrigin("*")
@RestController
@RequestMapping(value = "/api/v1/donator")
@Validated
public class DonatorController {

	@Autowired
	private IDonatorService service;

	
	@GetMapping()
	public ResponseEntity<?> getAllPost() {
		ArrayList<Donator> entities = service.getAllDonator();
		return new ResponseEntity<>(entities, HttpStatus.OK);
	}
	
	@PostMapping()
	public ResponseEntity<?> createDonate(@Valid @RequestBody DonateDTO dto) {
		// create User
		Donator donater = service.createDonate(dto.toDonaterEntity());
		// ==> donator.id 
		int donaterId = donater.getId();
		service.createDonatePost(donaterId, dto.toDonatorPostEntity());

		return new ResponseEntity<>("Đang quyên góp", HttpStatus.OK);
	}
}
