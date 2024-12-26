package com.aws.team.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/LKH/")
public class LKHController {
	private static final Logger logger = LoggerFactory.getLogger(LKHController.class); // 디버깅 코드 처럼 찍어보는 코드
	
	
	@RequestMapping(value = "userJoin.aws", method = RequestMethod.GET)
	public String userJoin() {
		return "WEB-INF/LKH/userJoin";
	}
	@RequestMapping(value = "userLogin.aws", method = RequestMethod.GET)
	public String userLogin() {
		return "WEB-INF/LKH/userLogin";
	}
}
