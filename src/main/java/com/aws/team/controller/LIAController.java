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
		
		return "WEB-INF/LIA/freeBoardList"; 
	}
	
	@RequestMapping(value="exerciseMain.aws", method=RequestMethod.GET)
	public String exerciseMain() {
		
		return "WEB-INF/LIA/exerciseMain"; 
	}

}
