package org.onloading.indown.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/home")
public class HomeController {

	@RequestMapping("/index")
	@ResponseBody
	public String index() {
		return "this is test!!!";
	}
}