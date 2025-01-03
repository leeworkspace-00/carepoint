package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping(value = "/user/")
public class UserController {
	@RequestMapping(value = "userJoin.aws", method = RequestMethod.GET)
	public String userJoin() {
		return "WEB-INF/LKH/userJoin";
	}
	@RequestMapping(value = "userLogin.aws", method = RequestMethod.GET)
	public String userLogin() {
		return "WEB-INF/LKH/userLogin";
	}
	
	@RequestMapping(value = "userDetail.aws", method = RequestMethod.GET)
	public String userDetail() {
		return "WEB-INF/LKH/userDetail";
	}
	@RequestMapping(value = "myPage.aws", method = RequestMethod.GET)
	public String myPage() {
		return "WEB-INF/LKH/myPage";
	}
	@RequestMapping(value = "mainPage.aws", method = RequestMethod.GET)
	public String mainPage() {
		return "WEB-INF/LKH/mainPage";
	}

}
