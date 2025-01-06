package com.aws.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/noticeBoard/")
public class NoticeBoardController {
	
	// �������� �ۼ� ������
	@RequestMapping(value= "noticeBoardWrite.aws", method=RequestMethod.GET)
	public String noticeBoardWrite() {
		
		return "WEB-INF/KES/noticeBoardWrite";
	}
	
	// �������� ���� ������
	@RequestMapping(value= "noticeBoardModify.aws", method=RequestMethod.GET)
	public String noticeBoardModify() {
		
		return "WEB-INF/KES/noticeBoardModify";
	}

	@RequestMapping(value="noticeBoardContents.aws", method=RequestMethod.GET)
	public String noticeBoardContents() {
		
		//System.out.println("noticeBoardContents.aws ����");
		
		return "WEB-INF/KIS/noticeBoardContents"; 
	}
	
	@RequestMapping(value="noticeBoardList.aws", method=RequestMethod.GET)
	public String noticeBoardList() {
		
		return "WEB-INF/LIA/noticeBoardList"; 
	}

}
