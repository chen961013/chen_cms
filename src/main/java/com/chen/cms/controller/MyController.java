package com.chen.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/my")
@Controller
public class MyController {

	/**
	 * 
	 * @Title: index 
	 * @Description: 跳转个人中心页
	 * @return
	 * @return: String
	 */
	@RequestMapping("index")
	public String index() {
		return "my/index";
	}
	
	@RequestMapping("publish")
	public String publish() {
		return "/my/article/publish";
	}
}
