package org.onloading.indown.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.onloading.indown.model.MyDog;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/test")
public class TestController {
	// 添加一个日志器
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * 返回指定名称的jsp文件
	 * 
	 * @return
	 */
	@RequestMapping("/index")
	public String index() {
		// 输出日志文件
		logger.info("the first jsp pages");
		// 返回一个index.jsp这个视图
		return "test";
	}

	/**
	 * 返回指定的jsp文件，并且把message，作为变量传输过去。在前端使用${message}
	 * 
	 * @return
	 */
	@RequestMapping("/hello")
	public ModelAndView helloWorld() {
		String message = "Hello World, Spring 3.x!";
		return new ModelAndView("hello", "message", message);
	}

	/**
	 * 返回指定的jsp文件，并写入 map的内容
	 * 
	 * @return
	 */
	@RequestMapping("value = /show")
	public Map<String, String> getMap() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key1", "value-1");
		map.put("key2", "value-2");
		return map;
	}

	@RequestMapping(value = "/print")
	@ResponseBody
	public String print() {
		String message = "Hello World, Spring MVC!";
		return message;
	}

	@RequestMapping("/load1")
	@ResponseBody
	public String load1(@RequestParam String name, @RequestParam String password) throws IOException {
		System.out.println(name + " : " + password);
		// return name+" : "+password;
		MyDog dog = new MyDog();
		dog.setName("小哈");
		dog.setAge(1);
		dog.setColor("深灰");
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonString = objectMapper.writeValueAsString(dog);
		System.out.println(jsonString);
		return jsonString;
	}
}