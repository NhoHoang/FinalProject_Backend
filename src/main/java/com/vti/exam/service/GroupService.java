package com.vti.exam.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.vti.exam.dto.GroupFormForCreating;
import com.vti.exam.dto.GroupFormForUpdating;
import com.vti.exam.dto.filter.GroupFilter;
import com.vti.exam.entity.Group;
import com.vti.exam.repository.GroupRepository;
import com.vti.exam.specification.GroupSpecificationBuilder;



@Service
public class GroupService implements IGroupService {

	@Autowired
	private GroupRepository repository;

	public Page<Group> getAllGroups(Pageable pageable, GroupFilter filter, String search) {

		GroupSpecificationBuilder specification = new GroupSpecificationBuilder(filter, search);

		return repository.findAll(specification.build(), pageable);
	}
	
	public boolean isGroupExistsByName(String name) {
		return repository.existsByName(name);
	}

	public void createGroup(GroupFormForCreating form) {
		repository.save(form.toEntity());
	}

	public Group getGroupByID(short id) {
		return repository.findById(id).get();
	}

	public void updateGroup(short id, GroupFormForUpdating form) {
		Group entity = repository.findById(id).get();
		entity.setName(form.getName());
		entity.setTotalMember(form.getTotalMember());
		repository.save(entity);
	}

	@Transactional
	public void deleteGroups(List<Short> ids) {
		repository.deleteByIdIn(ids);	
	}


}
