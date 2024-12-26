package com.aws.team.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/LIA/")
public class LIAController {
	
	private static final Logger logger = LoggerFactory.getLogger(LIAController.class);
	
	@RequestMapping(value="freeBoardList.aws", method=RequestMethod.GET)
	public String freeBoardList() {
		
		System.out.println("freeBoardList.aws ����");
		
		return "WEB-INF/LIA/freeBoardList"; 
	}

}
