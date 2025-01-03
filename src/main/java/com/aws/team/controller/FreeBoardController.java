package com.aws.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/freeBoard/")
public class FreeBoardController {

	@RequestMapping(value= "freeBoardWrite.aws", method=RequestMethod.GET)
	public String boardWrite() {
		
		return "WEB-INF/freeBoard/freeBoardWrite";
	}

	@RequestMapping(value= "freeBoardModify.aws", method=RequestMethod.GET)
	public String boardModify() {
		
		return "WEB-INF/freeBoard/freeBoardModify";
	}
	
	@RequestMapping(value="freeBoardContents.aws", method=RequestMethod.GET)
	public String freeBoardContents() {
		return "WEB-INF/freeBoard/freeBoardContents"; 

	}
	
	@RequestMapping(value="freeBoardList.aws", method=RequestMethod.GET)
	public String freeBoardList() {
		
		return "WEB-INF/freeBoard/freeBoardList"; 
	}

}
