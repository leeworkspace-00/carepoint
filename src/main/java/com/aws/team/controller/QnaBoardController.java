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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.PageMaker;
import com.aws.team.domain.SearchCriteria;
import com.aws.team.service.QnaBoardService;
import com.aws.team.util.UploadFileUtiles;
import com.aws.team.util.UserIp;
@Controller
@RequestMapping(value="/qnaBoard/")
public class QnaBoardController {
	
	@Autowired(required=false)
	private QnaBoardService qnaBoardService;
	
	@Autowired(required=false)
	private PageMaker pm;
	
	@Autowired(required=false)
	private UserIp userIp;
	
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
	    
	    return path;
	}

	@RequestMapping(value= "qnaBoardWrite.aws", method=RequestMethod.GET)
	public String qnaBoardWrite() {
		
		return "WEB-INF/qnaBoard/qnaBoardWrite";
	}
	
	@RequestMapping(value="qnaBoardWriteAction.aws", method=RequestMethod.POST)
	public String qnaBoardWriteAction(
			BoardVo bv,
			@RequestParam("attachfile") MultipartFile attachfile,
			HttpServletRequest request,
			RedirectAttributes rttr
			) throws Exception {
		
		MultipartFile file = attachfile;
		String uploadedFileName = "";
		
		if (! file.getOriginalFilename().equals("")) {	
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			// 업로드 파일 이름 추출
		}
		
		String user_pk = request.getSession().getAttribute("user_pk").toString();
		int user_pk_int = Integer.parseInt(user_pk); // 회원번호를 숫자형으로 추출
		String ip = userIp.getUserIp(request); // ip 추출
		
		bv.setUser_pk(user_pk_int);
		bv.setIp(ip);
		bv.setUploadedFileName(uploadedFileName);
		
		int value = qnaBoardService.qnaInsert(bv);

		String path = "";
		if (value == 2) { 
			rttr.addFlashAttribute("msg", "게시글이 등록 되었습니다.");
			path = "redirect:/qnaBoard/qnaBoardList.aws"; 
		} else { 
			rttr.addFlashAttribute("msg", "입력이 잘못 되었습니다.");
			path = "redirect:/qnaBoard/qnaBoardWrite.aws"; 
		}	
		
		return path;  
	}
	
	@RequestMapping(value="qnaBoardDeleteAction.aws", method=RequestMethod.POST)
    public String qnaBoardDeleteAction(
    		@RequestParam("board_pk") int board_pk,
			RedirectAttributes rttr) {
		
		String path = "";
	 
		BoardVo bv = qnaBoardService.qnaSelectOne(board_pk); 	 
		int value = qnaBoardService.qnaDelete(bv);
	
		// 작성 되었었던 답글의 수에 따라서 value 값이 달라지기 때문에 1 이상으로 변경함.
		if(value >= 1) {
			rttr.addFlashAttribute("msg", "게시글이 삭제 되었습니다."); 
			path = "redirect:/qnaBoard/qnaBoardList.aws"; 
		}
	 
		return path; 
	}

	@RequestMapping(value= "qnaBoardModify.aws", method=RequestMethod.GET)
	public String qnaBoardModify(@RequestParam("board_pk") int board_pk, Model model) {
		
		BoardVo bv = qnaBoardService.qnaSelectOne(board_pk);
		model.addAttribute("bv", bv);
		
		return "WEB-INF/qnaBoard/qnaBoardModify";
	}
	
	@RequestMapping(value="qnaBoardModifyAction.aws", method=RequestMethod.POST)
	public String qnaBoardModifyAction(
			BoardVo bv,
			@RequestParam("attachfile") MultipartFile attachfile,
			HttpServletRequest request,
			RedirectAttributes rttr
			) throws Exception {
		
		MultipartFile file = attachfile;
		String uploadedFileName = "";
		
		if (! file.getOriginalFilename().equals("")) {	
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			// 업로드 파일 이름 추출
		}

		String user_pk = request.getSession().getAttribute("user_pk").toString();
		int user_pk_int = Integer.parseInt(user_pk); // 회원번호를 숫자형으로 추출
		String ip = userIp.getUserIp(request); // ip 추출
		
		String path = "";
		
		if (bv.getUser_pk() == user_pk_int) {
			
			bv.setUploadedFileName(uploadedFileName);
			bv.setIp(ip);

			int value = qnaBoardService.qnaUpdate(bv);
			
			if (value == 1) {
				rttr.addFlashAttribute("msg", "게시글이 수정 되었습니다.");
				path = "redirect:/qnaBoard/qnaBoardContents.aws?board_pk=" + bv.getBoard_pk();
			}
		} else { 
		    rttr.addFlashAttribute("msg", "자신의 게시글만 수정 할 수 있습니다.");
		    path = "redirect:/qnaBoard/qnaBoardList.aws";
		}
				
		return path; 
	}

	@RequestMapping(value= "qnaBoardReply.aws", method=RequestMethod.GET)
	public String qnaBoardReply(
			@RequestParam("board_pk") int board_pk, 
			Model model,
			HttpServletRequest request,
			RedirectAttributes rttr) {
		
		BoardVo bv = qnaBoardService.qnaSelectOne(board_pk);
		model.addAttribute("bv", bv);
		
		String grade = request.getSession().getAttribute("grade").toString();
		
		String path = "";
		
		if (grade.equals("A")) {
			path = "WEB-INF/qnaBoard/qnaBoardReply";
		} else { 
		    rttr.addFlashAttribute("msg", "관리자만 답변을 작성 할 수 있습니다.");
		    path = "redirect:/qnaBoard/qnaBoardList.aws";
		}
		
		return path;
	}
	
	@RequestMapping(value="qnaBoardReplyAction.aws", method=RequestMethod.POST)
	public String qnaBoardReplyAction(
			BoardVo bv,
			@RequestParam("attachfile") MultipartFile attachfile,
			HttpServletRequest request,
			RedirectAttributes rttr
			) throws Exception {
		
		int replyCnt = qnaBoardService.hasReply(bv.getOrigin_num());
		
		// 답변 존재 여부 확인
		if (replyCnt > 1) {
	        rttr.addFlashAttribute("msg", "이미 답변이 존재합니다.");
	        return "redirect:/qnaBoard/qnaBoardList.aws";
	    }
		
		MultipartFile file = attachfile;
		String uploadedFileName = "";
		
		if (! file.getOriginalFilename().equals("")) {	
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			// 업로드 파일 이름 추출
		}
		
		String user_pk = request.getSession().getAttribute("user_pk").toString();
		int user_pk_int = Integer.parseInt(user_pk); // 회원번호를 숫자형으로 추출
		
		String ip = userIp.getUserIp(request); // ip 추출
		
		bv.setUploadedFileName(uploadedFileName);
		bv.setUser_pk(user_pk_int);
		bv.setIp(ip);
		
		int value = qnaBoardService.qnaReply(bv);
		
		String path = "";
		if (value == 1) { 
			rttr.addFlashAttribute("msg", "답변이 등록 되었습니다.");
			path = "redirect:/qnaBoard/qnaBoardList.aws"; 
		} else { 
			rttr.addFlashAttribute("msg", "입력이 잘못 되었습니다.");
			path = "redirect:/qnaBoard/qnaBoardReply.aws?board_pk=" + bv.getBoard_pk(); 
		}	
		
		return path; 
	}

}
