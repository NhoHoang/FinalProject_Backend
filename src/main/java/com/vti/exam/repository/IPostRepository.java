package com.vti.exam.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.vti.exam.entity.Post;

public interface IPostRepository extends JpaRepository<Post, Integer>, JpaSpecificationExecutor<Post> {

	@Modifying(clearAutomatically = true)
	@Transactional
	@Query("UPDATE Post p SET p.money_achieved = p.money_achieved + ?2 , p.donator_quantity = p.donator_quantity + 1 Where p.id = ?1")
	void extraMoney(int postId, int money);

	void deleteByIdIn(List<Integer> ids);

}
