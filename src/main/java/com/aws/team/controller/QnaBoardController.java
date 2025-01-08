package com.aws.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.PageMaker;
import com.aws.team.domain.SearchCriteria;
import com.aws.team.service.QnaBoardService;
@Controller
@RequestMapping(value="/qnaBoard/")
public class QnaBoardController {
	
	@Autowired(required=false)
	private QnaBoardService qnaBoardService;
	
	@Autowired(required=false)
	private PageMaker pm;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@RequestMapping(value="qnaBoardList.aws", method=RequestMethod.GET)
	public String qnaBoardList(SearchCriteria scri, Model model) {
		
		int cnt = qnaBoardService.qnaTotalCount(scri);
		
		scri.setPerPageNum(15); 
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
			
		ArrayList<BoardVo> blist = qnaBoardService.qnaSelectAll(scri);
			
		model.addAttribute("blist", blist);
		model.addAttribute("pm", pm);
		
		return "WEB-INF/qnaBoard/qnaBoardList"; 
	}
	
	@RequestMapping(value="qnaBoardContents.aws", method=RequestMethod.GET)
	public String qnaBoardContents(
			@RequestParam("board_pk") int board_pk, 
			Model model,
			HttpServletRequest request,
			RedirectAttributes rttr) {
		
		System.out.println("QnA Controller 들어옴");

		BoardVo bv = qnaBoardService.qnaSelectOne(board_pk);
		model.addAttribute("bv", bv);
		
		String user_pk = request.getSession().getAttribute("user_pk").toString();
		int user_pk_int = Integer.parseInt(user_pk); // 회원번호를 숫자형으로 추출
		
		String grade = request.getSession().getAttribute("grade").toString();
		
		String path = "";
		
	    // 관리자는 모든 게시글에 접근 가능
	    if ("A".equals(grade)) {
	        path = "WEB-INF/qnaBoard/qnaBoardContents";
	    } 
	    // 회원은 자신이 작성한 글과 해당 글의 origin_num이 같은 모든 게시글 열람 가능
	    else {
	        // 회원이 작성한 origin_num 가져오기
	        List<Integer> userOriginNums = qnaBoardService.getUserOriginNums(user_pk_int);

	        // 현재 게시글의 origin_num이 회원의 origin_num 목록에 포함되어 있는지 확인
	        if (userOriginNums.contains(bv.getOrigin_num())) {
	            path = "WEB-INF/qnaBoard/qnaBoardContents";
	        } else {
	            rttr.addFlashAttribute("msg", "열람 권한이 없습니다.");
	            path = "redirect:/qnaBoard/qnaBoardList.aws";
	        }
	    }
	    
	    System.out.println("path ======> " + path);
	    return path;
	}

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

}
