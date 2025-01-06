package com.aws.team.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class TodoController {
	
	@RequestMapping(value="todoList.aws", method=RequestMethod.GET)
	public String todoList() {
		
		//System.out.println("todoList.aws");
		
		return "WEB-INF/KIS/todoList"; 
	}

}
