package com.aws.team.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aws.team.domain.TodoVo;
import com.aws.team.service.TodoService;

@Controller
@RequestMapping(value="/todo/")
public class TodoController { 
    
	String path = "";
	
	@Autowired
	private TodoService todoService;
	
	@RequestMapping(value="todoList.aws", method=RequestMethod.GET)
	public String todoList() {


		return "WEB-INF/todo/todoList"; 
	}
	
	@ResponseBody
	@RequestMapping(value = "todoWriteAction.aws", method = RequestMethod.POST)
	public Map<String, Object> todoWriteAction(@RequestBody TodoVo tv) {
		
	    Map<String, Object> result = new HashMap<>();
	    
	    try {
	        int value = todoService.todoInsert(tv);
	        result.put("status", "success");
	        result.put("value", value);
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("status", "fail");
	    }
	    return result;
	}
}
