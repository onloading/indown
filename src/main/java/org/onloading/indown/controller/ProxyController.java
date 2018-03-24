package org.onloading.indown.controller;

import java.util.List;

import org.onloading.indown.entity.FreeProxy;
import org.onloading.indown.service.ProxyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/proxy")
public class ProxyController {
	@Autowired
	private ProxyService proxyService;

	private Logger logger = LoggerFactory.getLogger(ProxyController.class);

	@RequestMapping("/queryAll")
	@ResponseBody
	public List<FreeProxy> queryAll() {
		return proxyService.query();
	}

}
