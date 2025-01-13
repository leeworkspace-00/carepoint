package com.aws.team.controller;

import java.lang.System.Logger;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aws.team.api.MailApi;
import com.aws.team.service.UserService;

@Controller
@RequestMapping(value = "/user/password/")
public class PasswordController {
	
	@Autowired(required=false)
	private MailApi mailApi; 
	
	@Autowired(required = false)
	private UserService userService;  // 사용자 서비스 (비밀번호 변경, 사용자 조회 등)
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	//비밀번호 찾기 페이지 매핑
	@RequestMapping(value = "findPwd.aws", method = RequestMethod.GET)	// 메일 작성하는 페이지
	public String findPwd() {
		String path = "WEB-INF/user/password/findPwd";
		return path;
	}
	
	// 비밀번호 찾기 요청처리
	@RequestMapping(value="findPwdAction.aws", method = RequestMethod.POST)
	public String findPwdAction(HttpServletRequest request, HttpServletResponse response,
			@Param("username")String username,
			@Param("userid")String userid,
			@Param("useremail")String useremail) {
		System.out.println("비번찾기 들어옴");
		String path="";
		try {
		// 사용자가 입력한 정보를 기반으로 사용자 조회하기
		int userCheck = userService.userCheck(username, userid, useremail);
		System.out.println("회원 확인 성공시 1 : "+ userCheck);
		System.out.println("회원이름 : "+ username);
		System.out.println("회원아이디 : "+ userid);
		System.out.println("회원이메일 : "+ useremail);
		// 결과값이 true라면
		if(userCheck == 1) {
			//새로운 비밀번호 생성하는 메서드 실행
			
			
			  String newPwd = userService.randomPwd(); System.out.println("새 랜덤 비번 : " +
			  newPwd);
			 
			// 비밀번호 암호화하기
			String newEncryPwd = bCryptPasswordEncoder.encode(newPwd);
			//db에 저장하기
			int updatePwd = userService.updatePwd(userid,newEncryPwd);
			
			if(updatePwd==1) {
				//이메일로 비밀번전송하기
                HashMap<String, Object> emailDetails = new HashMap<>();
                emailDetails.put("subject", "비밀번호 변경 안내");
                emailDetails.put("contents", "새로운 비밀번호는 " + newPwd + "입니다.");
                emailDetails.put("receiveremail", useremail);
                emailDetails.put("senderemail", "a01024705367@gmail.com");

                mailApi.sendEmail(request, response, emailDetails);
                
                request.setAttribute("msg", "새로운 비밀번호가 이메일로 전송되었습니다.");
                path="WEB-INF/user/userLogin";
            }else {
                request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
                path="WEB-INF/user/password/findPwd";
            }
        } else {
            request.setAttribute("msg", "입력하신 정보와 일치하는 회원이 없습니다.");
            path="WEB-INF/user/password/findPwd";
        }
		}catch (Exception e) {
            e.printStackTrace(); // 예외 출력
            request.setAttribute("msg", "서버에서 오류가 발생했습니다.");
            path="WEB-INF/user/password/findPwd";
        }
		
        return path;
    }
		
}
