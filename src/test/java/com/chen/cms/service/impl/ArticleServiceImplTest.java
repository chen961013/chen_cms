package com.chen.cms.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import com.chen.cms.domain.Article;
import com.chen.cms.service.ArticleService;
import com.github.pagehelper.PageInfo;

public class ArticleServiceImplTest extends AnnotationUtil {

	@Resource
	private ArticleService articleService;
	
	@Test
	public void testSelects() {
		PageInfo<Article> selects = articleService.selects(null, 3, 3);
		System.out.println(selects);
	}

}
