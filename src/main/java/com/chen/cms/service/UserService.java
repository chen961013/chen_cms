package com.chen.cms.service;

import com.chen.cms.domain.User;
import com.github.pagehelper.PageInfo;

public interface UserService {

	PageInfo<User> selects(User user,Integer pageNum,Integer pageSize);

	boolean update(User user);
}
