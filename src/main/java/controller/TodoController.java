package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/Todo/")
public class TodoController {
	
	@RequestMapping(value="todoList.aws", method=RequestMethod.GET)
	public String todoList() {
		
		//System.out.println("todoList.aws ����");
		
		return "WEB-INF/todo/todoList"; 
	}

}
