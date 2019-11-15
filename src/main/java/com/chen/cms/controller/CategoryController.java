package com.chen.cms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chen.cms.domain.Category;
import com.chen.cms.service.CategoryService;

@RequestMapping("category")
@Controller
public class CategoryController {

	@Resource
	private CategoryService categoryService;
	
	@RequestMapping("categorys")
	@ResponseBody
	public List<Category> selects(Integer channelId) {
		return categoryService.selects(channelId);
	}
}
