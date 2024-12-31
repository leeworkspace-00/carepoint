package com.aws.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="/KES/")
public class KESController {
	
	
	
	//�����Խ��� �۾��� ������
	@RequestMapping(value= "boardWrite.aws", method=RequestMethod.GET)
	public String boardWrite() {
		
		return "WEB-INF/KES/boardWrite";
	}
	
	// �����Խ��� �����ϱ� ������
	@RequestMapping(value= "boardModify.aws", method=RequestMethod.GET)
	public String boardModify() {
		
		return "WEB-INF/KES/boardModify";
	}
	
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

	//�Ĵ���õ ������
	@RequestMapping(value= "foodRecom.aws", method=RequestMethod.GET)
	public String foodRecom() {
		
		return "WEB-INF/KES/foodRecom";
	}
	
	// �Ĵ� �󼼳��� ������
	@RequestMapping(value= "foodDetail.aws", method=RequestMethod.GET)
	public String foodDetail() {
		
		return "WEB-INF/KES/foodDetail";
	}
	
	// �Ĵ� ���� ������
	@RequestMapping(value= "foodMain.aws", method=RequestMethod.GET)
	public String foodMain() {
		
		return "WEB-INF/KES/foodMain";
	}
	
}
