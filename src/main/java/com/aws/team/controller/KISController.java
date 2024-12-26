package com.aws.team.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/KIS/")
public class KISController {

private static final Logger logger = LoggerFactory.getLogger(KISController.class);
	
	@RequestMapping(value="freeBoardContents.aws", method=RequestMethod.GET)
	public String freeBoardContents() {
		
		//System.out.println("contents.aws µé¾î¿È");
		
		return "WEB-INF/KIS/freeBoardContents"; 
	}
	
	@RequestMapping(value="noticeBoardContents.aws", method=RequestMethod.GET)
	public String noticeBoardContents() {
		
		//System.out.println("noticeBoardContents.aws µé¾î¿È");
		
		return "WEB-INF/KIS/noticeBoardContents"; 
	}
	
	@RequestMapping(value="qnaBoardContents.aws", method=RequestMethod.GET)
	public String qnaBoardContents() {
		
		//System.out.println("qnaBoardContents.aws µé¾î¿È");
		
		return "WEB-INF/KIS/qnaBoardContents"; 
	}
}
