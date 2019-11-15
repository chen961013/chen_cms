package com.chen.cms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chen.cms.domain.Article;
import com.chen.cms.domain.ArticleWithBLOBs;
import com.chen.cms.domain.User;
import com.chen.cms.service.ArticleService;
import com.github.pagehelper.PageInfo;

@RequestMapping("article")
@Controller
public class ArticleController {

	@Resource
	private ArticleService articleService;
	
	@RequestMapping("article")
	public String article(Model model,Integer id) {
		ArticleWithBLOBs article = articleService.article(id);
		model.addAttribute("article", article);
		return "/admin/article/article";
	}
	
	/**
	 * 管理员列表
	 * @Title: selects 
	 * @Description: TODO
	 * @param user
	 * @param pageNum
	 * @param pageSize
	 * @param model
	 * @return
	 * @return: String
	 */
	@RequestMapping("/articles")
	public String users(Article article,@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "3") Integer pageSize,Model model) {
		PageInfo<Article> info = articleService.selects(article, pageNum, pageSize);
		model.addAttribute("article", article);
		model.addAttribute("info", info);
	
		return "admin/article/articles";
	}
	
	/**
	 * 
	 * @Title: update 
	 * @Description: 修改文章的热门状态
	 * @return
	 * @return: String
	 */
	@RequestMapping("/update")
	@ResponseBody
	public boolean update(ArticleWithBLOBs article) {
		return articleService.update(article);
	}
	
}
