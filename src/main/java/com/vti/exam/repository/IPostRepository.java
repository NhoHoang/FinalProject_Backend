package com.vti.exam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.vti.exam.entity.Post;


public interface IPostRepository extends JpaRepository<Post, Integer>, JpaSpecificationExecutor<Post> {

	
	
	
}
