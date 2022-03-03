package com.vti.exam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vti.exam.dto.PostDTO;
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

	@GetMapping(value = "/{id}")
	public ResponseEntity<?> getPostByID(@PathVariable(name = "id") int id) {
		return new ResponseEntity<>(service.getPostByID(id), HttpStatus.OK);
//change
	}

	@PostMapping()
	public ResponseEntity<?> createPost(@RequestBody PostDTO form) {
		service.createPost(form);
		return new ResponseEntity<String>("Create Post successfully!", HttpStatus.OK);
	}

	@PutMapping(value = "/{id}")
	public ResponseEntity<?> updatePost(@PathVariable(name = "id") int id, @RequestBody PostDTO form) {
		service.updatePost(id, form);
		return new ResponseEntity<String>("Update Post successfully!", HttpStatus.OK);
	}

	@DeleteMapping(value = "/{ids}")
	public ResponseEntity<?> deletePost(@PathVariable(name = "ids") List<Integer> ids) {
		service.deletePost(ids);
		return new ResponseEntity<String>("Delete Post successfully!", HttpStatus.OK);
	}

}
