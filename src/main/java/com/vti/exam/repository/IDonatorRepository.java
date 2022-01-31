package com.vti.exam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.vti.exam.entity.Donator;

public interface IDonatorRepository extends JpaRepository<Donator, Integer>, JpaSpecificationExecutor<Donator> {

}
