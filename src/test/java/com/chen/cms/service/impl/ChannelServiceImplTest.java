package com.chen.cms.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.chen.cms.domain.Channel;
import com.chen.cms.service.ChannelService;

public class ChannelServiceImplTest extends AnnotationUtil {

	@Resource
	private ChannelService channelService;
	
	@Test
	public void testChannels() {
		List<Channel> channels = channelService.channels();
		
		for (Channel channel : channels) {
			System.out.println(channel);
		}
	}

}
