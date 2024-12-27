package com.aws.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="/KES/")
public class KESController {
	
	
	
	//게시판 글쓰기
	@RequestMapping(value= "boardWrite.aws", method=RequestMethod.GET)
	public String boardWrite() {
		
		return "WEB-INF/KES/boardWrite";
	}

	//식단추천 페이지
	@RequestMapping(value= "foodRecom.aws", method=RequestMethod.GET)
	public String foodRecom() {
		
		return "WEB-INF/KES/foodRecom";
	}
	
	// 식단 상세내용 페이지
	@RequestMapping(value= "foodDetail.aws", method=RequestMethod.GET)
	public String foodDetail() {
		
		return "WEB-INF/KES/foodDetail";
	}
	
	// 식단 메인 페이지
	@RequestMapping(value= "foodMain.aws", method=RequestMethod.GET)
	public String foodMain() {
		
		return "WEB-INF/KES/foodMain";
	}

}
