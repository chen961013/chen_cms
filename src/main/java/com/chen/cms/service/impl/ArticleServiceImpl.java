package com.chen.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chen.cms.dao.ArticleMapper;
import com.chen.cms.domain.Article;
import com.chen.cms.domain.ArticleWithBLOBs;
import com.chen.cms.domain.User;
import com.chen.cms.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Resource
	private ArticleMapper articleMapper;

	@Override
	public PageInfo<Article> selects(Article article, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Article> articles = articleMapper.selects(article);
		
		return new PageInfo<Article>(articles);
	}

	@Override
	public boolean update(ArticleWithBLOBs article) {
		try {
			return articleMapper.updateByPrimaryKeySelective(article)>0;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("修改失败");
		}
		
	}

	@Override
	public ArticleWithBLOBs article(Integer id) {
		return articleMapper.selectByPrimaryKey(id);
	}

	
	
}
