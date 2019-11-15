package com.chen.cms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chen.cms.domain.User;
import com.chen.cms.service.UserService;
import com.github.pagehelper.PageInfo;

@RequestMapping("/user")
@Controller
public class UserController {

	@Resource
	private UserService userService;
	
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
	@RequestMapping("/users")
	public String users(User user,@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "3") Integer pageSize,Model model) {

		PageInfo<User> info = userService.selects(user, pageNum, pageSize);
		model.addAttribute("users", info.getList());
		model.addAttribute("user", user);
		model.addAttribute("info", info);
		
		int[] nums = info.getNavigatepageNums();
		model.addAttribute("nums", nums);
		
		return "admin/user/users";
	}
	
	/**
	 * 
	 * @Title: update 
	 * @Description: 控制用户状态
	 * @return
	 * @return: String
	 */
	@RequestMapping("/update")
	@ResponseBody
	public boolean update(User user,Model model) {
		return userService.update(user);
	}
}
