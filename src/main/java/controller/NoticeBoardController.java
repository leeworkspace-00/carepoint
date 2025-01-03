package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/noticeBoard/")
public class NoticeBoardController {
	
	
	@RequestMapping(value= "noticeBoardWrite.aws", method=RequestMethod.GET)
	public String noticeBoardWrite() {
		
		return "WEB-INF/noticeBoard/noticeBoardWrite";
	}
	
	
	@RequestMapping(value= "noticeBoardModify.aws", method=RequestMethod.GET)
	public String noticeBoardModify() {
		
		return "WEB-INF/noticeBoard/noticeBoardModify";
	}

	@RequestMapping(value="noticeBoardContents.aws", method=RequestMethod.GET)
	public String noticeBoardContents() {
		
		
		
		return "WEB-INF/noticeBoard/noticeBoardContents"; 
	}
	
	@RequestMapping(value="noticeBoardList.aws", method=RequestMethod.GET)
	public String noticeBoardList() {
		
		return "WEB-INF/noticeBoard/noticeBoardList"; 
	}

}
