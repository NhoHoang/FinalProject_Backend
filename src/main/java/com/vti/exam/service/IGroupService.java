package com.vti.exam.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.vti.exam.dto.GroupFormForCreating;
import com.vti.exam.dto.GroupFormForUpdating;
import com.vti.exam.dto.filter.GroupFilter;
import com.vti.exam.entity.Group;

public interface IGroupService {

	Page<Group> getAllGroups(Pageable pageable, GroupFilter filter, String search);

	boolean isGroupExistsByName(String name);

	void createGroup(GroupFormForCreating form);

	Group getGroupByID(short id);

	void updateGroup(short id, GroupFormForUpdating form);

	void deleteGroups(List<Short> ids);
}
