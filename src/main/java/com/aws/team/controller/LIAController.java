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
		
<<<<<<< HEAD
		System.out.println("freeBoardList.aws ����");
		
		return "WEB-INF/LIA/freeBoardList"; 
=======
		return "WEB-INF/LIA/freeBoardList"; 
	}
	
	@RequestMapping(value="exerciseMain.aws", method=RequestMethod.GET)
	public String exerciseMain() {
		
		return "WEB-INF/LIA/exerciseMain"; 
>>>>>>> 6b9a59e74ca418e3e3ab2ac8bab3521ffc155f42
	}

}
