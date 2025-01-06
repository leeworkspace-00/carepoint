package com.aws.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/food/")
public class FoodController {
	
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
