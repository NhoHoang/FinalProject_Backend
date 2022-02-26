package com.vti.exam.specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.vti.exam.entity.User;

@SuppressWarnings("serial")
public class UserSpecification implements Specification<User> {
	String operator;
	Object value;
	String feild;

	public UserSpecification(String operator, String feild, Object value) {
		super();
		this.operator = operator;
		this.value = value;
		this.feild = feild;
	}

	@Override
	public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
		// Find by ID OK
		if (operator.equals("id")) {
			return criteriaBuilder.equal(root.get(feild), value);
		}
		// MinId OK
		if (operator.equals(">minId")) {
			return criteriaBuilder.greaterThanOrEqualTo(root.get(feild), value.toString());
		}
		// MaxId OK
		if (operator.equals("<maxId")) {
			return criteriaBuilder.lessThanOrEqualTo(root.get(feild), value.toString());
		}
		
		// Find with LastName
		if (operator.equals("lastName")) {
			return criteriaBuilder.equal(root.get(feild), value);
		}
		// Find with like full name
		if (operator.equals("likeName")) {
			return criteriaBuilder.like(root.get(feild), "%" + value + "%");
		}
		// Find by UserName OK
		if (operator.equals("userName")) {
			return criteriaBuilder.equal(root.get(feild), value);
		}
		// Find By Role
		if (operator.equals("role")) {
			return criteriaBuilder.equal(root.get(feild), value);
		}
		// Find by Email
		if (operator.equals("email")) {
			return criteriaBuilder.equal(root.get(feild), value);
		}

		return null;
	}

}
