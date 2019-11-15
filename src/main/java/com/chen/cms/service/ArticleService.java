package com.chen.cms.service;

import com.chen.cms.domain.Article;
import com.chen.cms.domain.ArticleWithBLOBs;
import com.github.pagehelper.PageInfo;

public interface ArticleService {

	PageInfo<Article> selects(Article article, Integer pageNum, Integer pageSize);

	boolean update(ArticleWithBLOBs article);

	ArticleWithBLOBs article(Integer id);

}
