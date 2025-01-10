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
			// 접속한 후에 가로채기  > 정보 담기 
			
			// RedirectAttribute 나 Model 객체에 담은 값을 꺼낸다
			String user_pk = modelAndView.getModel().get("user_pk").toString();
			String grade =  modelAndView.getModel().get("grade").toString();
			String username = modelAndView.getModel().get("username").toString();
			String usernick = modelAndView.getModel().get("usernick").toString();
			//controller에 있는 rttr에 담아둔 값 가져오겠다는 뜻
			
			modelAndView.getModel().clear();		// 파라미터 모델 값을 지운다 
			HttpSession session = request.getSession();
			// 세션을 담는다
			if(user_pk != null) {
				session.setAttribute("user_pk", user_pk);
				session.setAttribute("grade", grade);
				session.setAttribute("username", username);
				session.setAttribute("usernick", usernick);
				
			}
			
		}

	}
