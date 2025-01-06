package com.aws.team.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.PageMaker;
import com.aws.team.domain.SearchCriteria;
import com.aws.team.service.FreeBoardService;
import com.aws.team.util.UserIp;

@Controller
@RequestMapping(value="/freeBoard/")
public class FreeBoardController {

	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);   
	   
	String path = "";
	   
	@Autowired
	private FreeBoardService freeBoardService;
	
	@Autowired(required = false)
	private PageMaker pm;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	   
	@Autowired(required = false)
	private UserIp userIp;

	@RequestMapping(value="freeBoardList.aws", method=RequestMethod.GET)
	public String freeBoardList(SearchCriteria scri, Model model) {
		
		System.out.println("freeBoardList들어옴");
		
		int cnt = freeBoardService.freeBoardTatalCount(scri);
		  
		pm.setScri(scri);		
		pm.setTotalCount(cnt);
		  
		ArrayList<BoardVo> blist = freeBoardService.freeBoardSelectAll(scri);
		
		System.out.println("freeBoardList들어옴" + pm);
		System.out.println("freeBoardList들어옴" + blist);
		  
		model.addAttribute("blist", blist);
		model.addAttribute("pm", pm);
		
		return "WEB-INF/freeBoard/freeBoardList"; 
	}
	
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

} 
