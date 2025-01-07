package com.aws.team.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aws.team.domain.UserDetailVo;
import com.aws.team.domain.UserVo;
import com.aws.team.service.UserDetailService;
import com.aws.team.service.UserService;


@Controller
@RequestMapping(value = "/user/detail/")
public class UserDetailController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserDetailService userDetailService;

	@Autowired
	SqlSession sqlSession;
	
	//상세정보 입력 페이지 보여주기
	@RequestMapping(value = "userDetail.aws", method = RequestMethod.GET)
	public String userDetail() {
		return "WEB-INF/user/detail/userDetail";
	}
	// 상세정보 입력 동작 기능
	@RequestMapping(value = "userDetailAction.aws", method = RequestMethod.POST)
	public String userDetailAction(UserDetailVo u_dv, 
			RedirectAttributes rttr, 
			HttpSession session) {
		System.out.println("userdetailaction 들어옴");
		System.out.println("drink : " + u_dv.getDrink());
		System.out.println("smoke : " + u_dv.getSmoke());
		
		Integer user_pk = (Integer)session.getAttribute("user_pk");
		System.out.println("user_pk : " + u_dv.getUser_pk());
		
		u_dv.setUser_pk(user_pk);
		int value = userDetailService.userDetailInsert(u_dv) ;
		String path = "";
		if(value == 1) {
			//성공시 메시지 정달
			rttr.addFlashAttribute("msg", "상세정보 입력을 완료하셨습니다 !!");
			path = "redirect:/user/myPage.aws";
		}else {
			rttr.addFlashAttribute("msg", "상세정보 등록 실패 다시 시도해주세요.");
			path = "redirect:/user/detail/userDetail.aws";
		}
		
		return path;
	}


}
