package com.aws.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.aws.team.domain.UserDetailVo;
import com.aws.team.service.UserDetailService;


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
	public String userDetail(HttpSession session, Model model) {
		logger.info("userDetail.aws 들어옴");
		
		// 세션에서 user_pk 가져오기
	    Integer user_pk = (Integer) session.getAttribute("user_pk");
	    if (user_pk != null) {
	        logger.info("세션에서 가져온 user_pk: " + user_pk);
	        model.addAttribute("user_pk", user_pk); // user_pk 값을 JSP로 전달
	    } else {
	        logger.warn("세션에 user_pk 값이 없습니다.");
	    }
		
		return "WEB-INF/user/detail/userDetail";
	}
	// 상세정보 입력 동작 기능
	@RequestMapping(value = "userDetailAction.aws", method = RequestMethod.POST)
	public String userDetailAction(UserDetailVo u_dv,
			RedirectAttributes rttr, 
			HttpServletRequest request,
			HttpSession session) {
		// 세션에서 user_pk 가져오기
		//Integer user_pk = (Integer)session.getAttribute("user_pk");
	    String user_pk = request.getSession().getAttribute("user_pk").toString();
		int user_pk_int = Integer.parseInt(user_pk);
		System.out.println("userdetailaction 들어옴");
	    System.out.println("user_pk_int 값 : " + user_pk_int);
		System.out.println("drink : " + u_dv.getDrink());
		System.out.println("smoke : " + u_dv.getSmoke());
		u_dv.setUser_pk(user_pk_int);
		int value = userDetailService.userDetailInsert(u_dv);
		int value2 = userDetailService.updateDetail_pk(u_dv);
		int result = value+value2;
		System.out.println("메서드 실행 성공 하면 2 실패하면 0 : "+result);
		String path = "";
		if(result == 2) {
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
