package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/todo/")
public class TodoController {
	
	@RequestMapping(value="todoList.aws", method=RequestMethod.GET)
	public String todoList() {
		
		
		
		return "WEB-INF/todo/todoList"; 
	}

}
