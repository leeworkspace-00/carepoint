package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping(value="/qnaBoard/")
public class QnaBoardController {
	
	@RequestMapping(value= "qnaBoardWrite.aws", method=RequestMethod.GET)
	public String qnaBoardWrite() {
		
		return "WEB-INF/qnaBoard/qnaBoardWrite";
	}
	
	@RequestMapping(value= "qnaBoardModify.aws", method=RequestMethod.GET)
	public String qnaBoardModify() {
		
		return "WEB-INF/qnaBoard/qnaBoardModify";
	}
	
	@RequestMapping(value= "qnaBoardReply.aws", method=RequestMethod.GET)
	public String qnaBoardReply() {
		
		return "WEB-INF/qnaBoard/qnaBoardReply";
	}
	
	@RequestMapping(value="qnaBoardContents.aws", method=RequestMethod.GET)
	public String qnaBoardContents() {
		
		return "WEB-INF/qnaBoard/qnaBoardContents"; 
	}
	
	@RequestMapping(value="qnaBoardList.aws", method=RequestMethod.GET)
	public String qnaBoardList() {
		
		return "WEB-INF/qnaBoard/qnaBoardList"; 
	}

}
