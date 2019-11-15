package com.chen.cms.service;

import java.util.List;

import com.chen.cms.domain.Category;

public interface CategoryService {

	List<Category> selects(Integer channelId);

	
}
