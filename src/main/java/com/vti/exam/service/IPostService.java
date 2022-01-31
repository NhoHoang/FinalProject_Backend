package com.vti.exam.service;

import java.util.ArrayList;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.vti.exam.entity.Post;

public interface IPostService {

	ArrayList<Post> getAllPost();

}
