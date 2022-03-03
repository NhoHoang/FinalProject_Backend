package com.vti.exam.service;

import java.util.ArrayList;
import java.util.List;

import com.vti.exam.dto.PostDTO;
import com.vti.exam.entity.Post;

public interface IPostService {

	ArrayList<Post> getAllPost();

	Post getPostByID(int id);

	void createPost(PostDTO form);

	void updatePost(int id, PostDTO form);

	void deletePost(List<Integer> ids);

}
