package com.vti.exam.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vti.exam.entity.Post;
import com.vti.exam.service.IPostService;

@CrossOrigin("*")
@RestController
@RequestMapping(value = "/api/v1/post")
@Validated
public class PostController {

	@Autowired
	private IPostService service;

	@GetMapping()
	public ResponseEntity<?> getAllPost() {
		ArrayList<Post> entities = service.getAllPost();
		return new ResponseEntity<>(entities, HttpStatus.OK);
	}

}
