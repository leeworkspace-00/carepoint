package com.aws.team.controller;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONObject;
import com.aws.team.domain.UserVo;
import com.aws.team.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/user/")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	SqlSession sqlSession;


	@RequestMapping(value = "userJoin.aws", method = RequestMethod.GET)
	public String userJoin() {
		return "WEB-INF/user/userJoin";
	}

	// 회원가입 동작구현
	@RequestMapping(value = "userJoinAction.aws", method = RequestMethod.POST)
	public String userJoinAction(UserVo uv) {
		logger.info("회원가입 동작");
		
		String userpwd_enc = bCryptPasswordEncoder.encode(uv.getUserpwd()); // 이게 비밀번호 암호화 시키는 코드
		logger.info("암호화된 비밀번호 :  "+userpwd_enc);
		uv.setUserpwd(userpwd_enc);
		
		int value = userService.userInsert(uv);
		String path = "";
		if (value == 1) {
			path = "redirect:/";
		} else if (value == 0) {
			path = "redirect:/user/userJoin.aws";
		}
		return path;
	}
	
	@ResponseBody // 결과값은 객체로 보낸다는 의미의 어노테이션
	@RequestMapping(value = "userIdCheck.aws", method = RequestMethod.POST) // 아이디 중복 체크 동작 메서드 구현
	public JSONObject JSONObject(@RequestParam("userid") String userid) { 
		int cnt = userService.userIdCheck(userid);
		JSONObject obj = new JSONObject();
		obj.put("cnt", cnt); // 객체명.put("담을 값이름",담을 값);
		return obj;
	}
	@ResponseBody // 결과값은 객체로 보낸다는 의미의 어노테이션
	@RequestMapping(value = "userNickCheck.aws", method = RequestMethod.POST) // 닉네임 중복 체크 동작 메서드 구현
	public JSONObject JSONObject2(@RequestParam("usernick") String usernick) { 
		int cnt = userService.userNickCheck(usernick);
		JSONObject obj = new JSONObject();
		obj.put("cnt", cnt); // 객체명.put("담을 값이름",담을 값);
		return obj;
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

