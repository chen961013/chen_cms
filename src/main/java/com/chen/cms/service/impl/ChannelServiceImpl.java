package com.chen.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chen.cms.dao.ChannelMapper;
import com.chen.cms.domain.Channel;
import com.chen.cms.service.ChannelService;

@Service
public class ChannelServiceImpl implements ChannelService {

	@Resource
	private ChannelMapper channelMapper;
	
	@Override
	public List<Channel> channels() {
		return channelMapper.channels();
	}

}
