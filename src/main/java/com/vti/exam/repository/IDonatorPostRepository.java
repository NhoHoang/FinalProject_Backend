package com.vti.exam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.vti.exam.entity.Donator_Post_Save_Data;

public interface IDonatorPostRepository
		extends JpaRepository<Donator_Post_Save_Data, Integer>, JpaSpecificationExecutor<Donator_Post_Save_Data> {

}
