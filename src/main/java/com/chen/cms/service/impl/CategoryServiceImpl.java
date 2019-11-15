package com.chen.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chen.cms.dao.CategoryMapper;
import com.chen.cms.domain.Category;
import com.chen.cms.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Resource
	private CategoryMapper categoryMapper;

	@Override
	public List<Category> selects(Integer channelId) {
		return categoryMapper.selectBychannelId(channelId);
	}
	
	
}
