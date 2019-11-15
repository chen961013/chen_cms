package com.chen.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {

	/**
	 * 管理页首页
	 * @Title: index 
	 * @Description: TODO
	 * @return
	 * @return: String
	 */
	@RequestMapping("/index")
	public String index() {
		
		return "admin/index"; 
	}
}
