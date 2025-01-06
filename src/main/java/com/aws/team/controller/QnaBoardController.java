package com.aws.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping(value="/qnaBoard/")
public class QnaBoardController {
	
	// QnA �����ϱ� ������
	@RequestMapping(value= "qnaBoardWrite.aws", method=RequestMethod.GET)
	public String qnaBoardWrite() {
		
		return "WEB-INF/KES/qnaBoardWrite";
	}
	
	// QnA �����ϱ� ������
	@RequestMapping(value= "qnaBoardModify.aws", method=RequestMethod.GET)
	public String qnaBoardModify() {
		
		return "WEB-INF/KES/qnaBoardModify";
	}
	
	// QnA �亯�ϱ� ������
	@RequestMapping(value= "qnaBoardReply.aws", method=RequestMethod.GET)
	public String qnaBoardReply() {
		
		return "WEB-INF/KES/qnaBoardReply";
	}
	
	@RequestMapping(value="qnaBoardContents.aws", method=RequestMethod.GET)
	public String qnaBoardContents() {
		
		//System.out.println("qnaBoardContents.aws ����");
		
		return "WEB-INF/KIS/qnaBoardContents"; 
	}
	
	@RequestMapping(value="qnaBoardList.aws", method=RequestMethod.GET)
	public String qnaBoardList() {
		
		return "WEB-INF/LIA/qnaBoardList"; 
	}

}
