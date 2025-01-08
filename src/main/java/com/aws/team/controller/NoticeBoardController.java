package com.aws.team.controller;

import java.util.ArrayList;

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
import com.aws.team.service.NoticeBoardService;

@Controller
@RequestMapping(value="/noticeBoard/")
public class NoticeBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);
	
	
	// NoticeBoardService 타입의 객체를 자동으로 주입. 주입 실패 시에도 에러가 발생하지 않고 null로 설정됨
	@Autowired(required = false) 
	private NoticeBoardService noticeBoardService;
	
	// PageMaker 객체를 자동으로 주입하여 페이지 정보를 설정
	@Autowired(required = false) 
	private PageMaker pm;

	// 공지사항 글쓰기
	@RequestMapping(value= "noticeBoardWrite.aws", method=RequestMethod.GET)
	public String noticeBoardWrite() {
		
		return "WEB-INF/noticeBoard/noticeBoardWrite";
	}

	// 공지사항 수정
	@RequestMapping(value= "noticeBoardModify.aws", method=RequestMethod.GET)
	public String noticeBoardModify() {
		
		return "WEB-INF/noticeBoard/noticeBoardModify";
	}

	// 공지사항 내용
	@RequestMapping(value="noticeBoardContents.aws", method=RequestMethod.GET)
	public String noticeBoardContents() {
		
		return "WEB-INF/noticeBoard/noticeBoardContents"; 

	}
	
	// 공지사항 목록
	@RequestMapping(value="noticeBoardList.aws", method=RequestMethod.GET)
	public String noticeBoardList() {
		
		return "WEB-INF/noticeBoard/noticeBoardList"; 
	}
	
	
	//게시글 목록을 조회하고 검색 조건에 맞는 게시글을 화면에 표시하는 메서드
	@RequestMapping(value="NoticeBoardList.aws", method=RequestMethod.GET)
	public String NoticeBoardList(SearchCriteria scri, Model model) {
		
		// 총 게시글 수를 검색 조건(scri)을 기준으로 조회
		int cnt = noticeBoardService.noticeBoardTotalCount(scri);
		// PageMaker 객체에 검색 조건과 총 게시글 수를 설정하여 페이지 네비게이션을 준비
		pm.setScri(scri);
		pm.setTotalCount(cnt);
			
		// noticeBoardService에서 주어진 검색 조건(scri)을 기반으로 게시글 목록을 조회
		ArrayList<BoardVo> blist = noticeBoardService.noticeBoardSelectAll(scri);
		
		// 조회된 게시글 목록을 "blist"라는 이름으로 모델에 추가하여 JSP 뷰 페이지로 전달
		model.addAttribute("blist",blist);
		// PageMaker 객체도 모델에 추가하여 JSP 뷰에서 페이지 정보도 접근할 수 있도록 설정
		model.addAttribute("pm",pm);
			
		//경로에 해당하는 JSP 뷰 페이지를 반환
		return "WEB-INF/noticeBoard/noticeBoardList";
		}

}
