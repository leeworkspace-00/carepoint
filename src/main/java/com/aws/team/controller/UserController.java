package com.aws.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/user/")
public class UserController {
	
	@RequestMapping(value = "userJoin.aws", method = RequestMethod.GET)
	public String userJoin() {
		return "WEB-INF/user/userJoin";
	}
	@RequestMapping(value = "userLogin.aws", method = RequestMethod.GET)
	public String userLogin() {
		return "WEB-INF/user/userLogin";
	}
	
	@RequestMapping(value = "userDetail.aws", method = RequestMethod.GET)
	public String userDetail() {
		return "WEB-INF/user/userDetail";
	}
	@RequestMapping(value = "myPage.aws", method = RequestMethod.GET)
	public String myPage() {
		return "WEB-INF/user/myPage";
	}
	@RequestMapping(value = "mainPage.aws", method = RequestMethod.GET)
	public String mainPage() {
		return "WEB-INF/user/mainPage";
	}

}
