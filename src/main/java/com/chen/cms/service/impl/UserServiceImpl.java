package com.chen.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chen.cms.dao.UserMapper;
import com.chen.cms.domain.User;
import com.chen.cms.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;

	@Override
	public PageInfo<User> selects(User user, Integer pageNum, Integer pageSize) {
		
		PageHelper.startPage(pageNum, pageSize);
		List<User> users = userMapper.selects(user);
		
		return new PageInfo<User>(users);
	}

	@Override
	public boolean update(User user) {
		
		try {
			userMapper.updateByPrimaryKeySelective(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("修改出现错误");
		}
	}
	
	
}
