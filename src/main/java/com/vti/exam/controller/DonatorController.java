package com.vti.exam.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
	

}
