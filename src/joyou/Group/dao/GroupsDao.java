package joyou.Group.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import joyou.Group.model.Groups;

@Repository
public interface GroupsDao {

	int saveGroup(Groups groups);

	List<Groups> findAllGroups();

	public boolean isGroupExist(Groups groups);

	void updateGroup(Groups groups);

	void evictGroup(Groups members);

	public Integer checkGroupId(Integer groupid);

	Groups findByGroupId(Integer groupid);


}
