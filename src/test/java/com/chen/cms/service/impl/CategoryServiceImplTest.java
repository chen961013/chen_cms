package com.chen.cms.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.chen.cms.domain.Category;
import com.chen.cms.service.CategoryService;

public class CategoryServiceImplTest extends AnnotationUtil {

	@Resource
	private CategoryService categoryService;
	
	@Test
	public void testSelects() {
		List<Category> selects = categoryService.selects(1);
		System.out.println(selects);
	}

}
