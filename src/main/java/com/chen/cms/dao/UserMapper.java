package com.chen.cms.dao;

import java.util.List;

import com.chen.cms.domain.User;

public interface UserMapper {

	List<User> selects(User user);
	
	int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}