package com.aws.team.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {		// 로그인 확인하는 클래스 
	
	

	// 로그인 후에 회원정보를 세션에 담는다.
		// 추상클래스에서 핸들 3 개 가져옴 preHandle,  postHandle,  afterConcurrentHandlingStarted
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
				// preHandle = 접속하기 전에 가로채기 > 정보  초기화 
			
			HttpSession session = request.getSession();
			if(session.getAttribute("user_pk") != null)  {
				session.removeAttribute("user_pk");
				session.removeAttribute("grade");
				session.removeAttribute("userid");
				session.removeAttribute("username");
				session.removeAttribute("usernick");
				
				session.invalidate();		// 완전 초기화 시킨다	
			}
			
			
			return true;
		}

		
		@Override
	    public void postHandle(
	            HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
	            throws Exception {
	        // 접속한 후에 가로채기 > 정보 담기

	        // RedirectAttribute 나 Model 객체에 담은 값을 꺼낸다
	        if (modelAndView != null && modelAndView.getModel() != null) {
	            String user_pk = (String) modelAndView.getModel().get("user_pk");
	            String userid = (String) modelAndView.getModel().get("userid");
	            String grade = (String) modelAndView.getModel().get("grade");
	            String username = (String) modelAndView.getModel().get("username");
	            String usernick = (String) modelAndView.getModel().get("usernick");

	            // controller에 있는 rttr에 담아둔 값 가져오겠다는 뜻
	            modelAndView.getModel().clear(); // 파라미터 모델 값을 지운다
	            HttpSession session = request.getSession();

	            // 세션에 담을 값이 null이 아니면 세션에 저장
	            if (user_pk != null) {
	                session.setAttribute("user_pk", user_pk);
	            }
	            if (userid != null) {
	                session.setAttribute("userid", userid);
	            }
	            if (grade != null) {
	                session.setAttribute("grade", grade);
	            }
	            if (username != null) {
	                session.setAttribute("username", username);
	            }
	            if (usernick != null) {
	                session.setAttribute("usernick", usernick);
	            }
	        }
	    }
	}