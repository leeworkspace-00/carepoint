package com.aws.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aws.team.domain.TodoVo;
import com.aws.team.service.TodoService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/todo/")
public class TodoController { 
    
	String path = "";
	
	@Autowired
	private TodoService todoService;
	
	@RequestMapping(value="todoList.aws", method=RequestMethod.GET)
	public String todoList(
			Model model,
	        HttpServletRequest request
			) {
		
		int user_pk = Integer.parseInt(request.getSession().getAttribute("user_pk").toString());
		
		ArrayList<TodoVo> tlist = todoService.todoSelectAll(user_pk);
		
		model.addAttribute("tlist", new Gson().toJson(tlist));

		return "WEB-INF/todo/todoList"; 
	}
	
	@ResponseBody
	@RequestMapping(value = "todoWriteAction.aws", method = RequestMethod.POST)
	public Map<String, Object> todoWriteAction(@RequestBody TodoVo tv) {
		
	    Map<String, Object> result = new HashMap<>();
	    
	    try {
	    	int num = todoService.todoCount(tv.getSelectdate());
	    	
	    	tv.setNum(num + 1);
	    	
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
