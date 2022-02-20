package com.vti.exam.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vti.exam.entity.Donator;
import com.vti.exam.entity.Donator_Post;

public interface IDonatorPostRepository extends JpaRepository<Donator_Post, Integer> {

}
