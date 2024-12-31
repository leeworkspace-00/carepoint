package com.aws.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="/KES/")
public class KESController {
	
	
	
	//자유게시판 글쓰기 페이지
	@RequestMapping(value= "boardWrite.aws", method=RequestMethod.GET)
	public String boardWrite() {
		
		return "WEB-INF/KES/boardWrite";
	}
	
	// 자유게시판 수정하기 페이지
	@RequestMapping(value= "boardModify.aws", method=RequestMethod.GET)
	public String boardModify() {
		
		return "WEB-INF/KES/boardModify";
	}
	
	// QnA 문의하기 페이지
	@RequestMapping(value= "qnaBoardWrite.aws", method=RequestMethod.GET)
	public String qnaBoardWrite() {
		
		return "WEB-INF/KES/qnaBoardWrite";
	}
	
	// QnA 수정하기 페이지
	@RequestMapping(value= "qnaBoardModify.aws", method=RequestMethod.GET)
	public String qnaBoardModify() {
		
		return "WEB-INF/KES/qnaBoardModify";
	}
	
	// QnA 답변하기 페이지
	@RequestMapping(value= "qnaBoardReply.aws", method=RequestMethod.GET)
	public String qnaBoardReply() {
		
		return "WEB-INF/KES/qnaBoardReply";
	}
	
	// 공지사항 작성 페이지
	@RequestMapping(value= "noticeBoardWrite.aws", method=RequestMethod.GET)
	public String noticeBoardWrite() {
		
		return "WEB-INF/KES/noticeBoardWrite";
	}
	
	// 공지사항 수정 페이지
	@RequestMapping(value= "noticeBoardModify.aws", method=RequestMethod.GET)
	public String noticeBoardModify() {
		
		return "WEB-INF/KES/noticeBoardModify";
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
