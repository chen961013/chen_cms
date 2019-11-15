package com.chen.cms.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import com.chen.cms.domain.User;
import com.chen.cms.service.UserService;
import com.github.pagehelper.PageInfo;

public class UserServiceImplTest extends AnnotationUtil {

	@Resource
	private UserService userService;
	
	@Test
	public void testSelects() {
		PageInfo<User> users = userService.selects(null, 0, 3);
		System.out.println(users);
	}

}
