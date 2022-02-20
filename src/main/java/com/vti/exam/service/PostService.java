package com.vti.exam.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vti.exam.entity.Post;
import com.vti.exam.repository.IPostRepository;

@Service
public class PostService implements IPostService {

	@Autowired
	private IPostRepository repository;

	@Override
	public ArrayList<Post> getAllPost() {

		return (ArrayList<Post>) repository.findAll();
	}

	@Override
	public Post getPostByID(int id) {
		return repository.findById(id).get();
	}

}
