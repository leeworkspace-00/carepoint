package com.aws.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.json.simple.JSONObject;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.UserDetailVo;
import com.aws.team.domain.UserVo;
import com.aws.team.service.FreeBoardService;
import com.aws.team.service.QnaBoardService;
import com.aws.team.service.UserDetailService;
import com.aws.team.service.UserService;

@Controller
@RequestMapping(value = "/user/")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserDetailService userDetailService;
	
	// board
	@Autowired
	private FreeBoardService freeBoardService;
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	

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
	public String userJoinAction(UserVo uv, RedirectAttributes rttr, HttpSession session) {
		logger.info("회원가입 동작");
		
		String userpwd_enc = bCryptPasswordEncoder.encode(uv.getUserpwd()); // 이게 비밀번호 암호화 시키는 코드
		logger.info("암호화된 비밀번호 :  "+userpwd_enc);
		uv.setUserpwd(userpwd_enc);
		
		
		int value = userService.userInsert(uv);
		String path = "";
		 if (value == 1) {
		        // `uv.getUser_pk()`로 회원 번호 가져오기 전에 확인 필요
		        Integer user_pk = uv.getUser_pk();
		        if (user_pk == null) {
		            logger.error("회원가입 성공했지만, 회원번호(user_pk)가 null입니다.");
		            rttr.addFlashAttribute("msg", "회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
		            return "redirect:/user/userJoin.aws";
		        }

		        logger.info("회원가입 성공! user_pk: " + user_pk);

		        // 세션에 회원번호 저장
		        session.setAttribute("user_pk", user_pk);

		        // 성공 메시지와 리다이렉트 설정
		        rttr.addFlashAttribute("msg", "회원가입 성공!! 상세정보를 입력해주세요");
		        path = "redirect:/user/detail/userDetail.aws";
		    } else {
		        logger.error("회원가입 실패: 데이터 삽입 실패");
		        rttr.addFlashAttribute("msg", "회원가입 실패. 다시 작성해주세요.");
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
	
	// 로그인 페이지 보여주기
	@RequestMapping(value = "userLogin.aws", method = RequestMethod.GET)
	public String userLogin() {
		return "WEB-INF/user/userLogin";
	}
	
	// 회원로그인 동작 기능 구현
	// 회원아이디, 비번, 리다이렉트속성, 세션값 필요
	@RequestMapping(value = "userLoginAction.aws", method = RequestMethod.POST)
	public String userLoginAction(@RequestParam("userid") String userid, 
			@RequestParam("userpwd") String userpwd, 
			RedirectAttributes rttr, 
			HttpSession session) {
		UserVo uv = userService.userLoginCheck(userid); // 로그인 확인하는 메서드 
		String path = ""; // 리턴값 초기화

		if(uv != null) {	// uv가 null이 아니라면 >> uv에 뭐라도 담았다면?
			String reservedPwd = uv.getUserpwd();// uv에 있는 비밀번호를 변수에 담아준다
			
			if(bCryptPasswordEncoder.matches(userpwd, reservedPwd)) {	// 암호화된 비밀번호와 입력된 비번을 맞춰보고 맞으면
				session.setAttribute("user_pk", uv.getUser_pk());	// 회원번호
				session.setAttribute("grade", uv.getGrade());		// 회원등급
				session.setAttribute("username", uv.getUsername());// 회원 이름이랑
				session.setAttribute("usernick", uv.getUsernick());// 닉네임 담아서
				session.setAttribute("joindate", uv.getJoindate());
				session.setAttribute("userphone", uv.getUserphone());
				session.setAttribute("useremail", uv.getUseremail());
				
				UserDetailVo u_dv = userDetailService.userDetailSelectOne(uv.getUser_pk());
				List<BoardVo> mypageFreeList = freeBoardService.mypageFreeList(uv.getUser_pk());
				List<BoardVo> mypageQnaList = qnaBoardService.mypageQnaList(uv.getUser_pk());
				
				session.setAttribute("u_dv", u_dv);
				session.setAttribute("mypageQnaList", mypageQnaList);
				session.setAttribute("mypageFreeList", mypageFreeList);
				

				  if (session.getAttribute("saveUrl") != null) { path = "redirect:" +
						  session.getAttribute("saveUrl").toString();
						  System.out.println("이전 url값 확인하기  : " + path);
						  
						  } else { path = "redirect:/user/mainPage.aws";
						  
						  }
	        } else {
	            rttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
	            path = "redirect:/user/userLogin.aws";
	        }
	    } else {
	        rttr.addFlashAttribute("msg", "해당하는 아이디가 없습니다.");
	        path = "redirect:/user/userLogin.aws";    
	    }
	    
	    return path;
	}
	
	// 로그아웃 기능 완성
	@RequestMapping(value = "userLogout.aws", method = RequestMethod.GET)	
	public String userLogout(HttpSession session) {
		session.removeAttribute("user_pk");
		session.removeAttribute("grade");
		session.removeAttribute("username");
		session.removeAttribute("usernick");
		session.invalidate(); 
		
		return "redirect:/user/mainPage.aws";
	}

	@RequestMapping(value = "myPage.aws", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session) {
		//세션에서 사용자 ID 가져오기
		Integer user_pk = (Integer)session.getAttribute("user_pk");
		
		// 로그인되지 않은 경우, 로그인 페이지로 리다이렉트
	    if (user_pk == null) {
	        return "redirect:/user/userLogin.aws";
	    }
		
		// 사용자 정보를 데이터베이스에서 가져오기
		UserVo uv = userService.userSelectOne(user_pk);
		// 모델에 사용자 정보 추가해줌
		model.addAttribute("uv", uv);
		
		
		
		
		return "WEB-INF/user/myPage";
	}
	@RequestMapping(value = "mainPage.aws", method = RequestMethod.GET)
	public String mainPage() {
		return "WEB-INF/user/mainPage";
	}

}

