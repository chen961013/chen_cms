package com.chen.cms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chen.cms.domain.Channel;
import com.chen.cms.service.ChannelService;

@RequestMapping("channel")
@Controller
public class ChannelController {

	@Resource
	private ChannelService channelService;
	
	/**
	 * 
	 * @Title: channels 
	 * @Description: 查询所有栏目
	 * @return
	 * @return: List<Channel>
	 */
	@RequestMapping("channels")
	@ResponseBody
	public List<Channel> channels(){
		return channelService.channels();
	}
	
}
