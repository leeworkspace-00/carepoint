package com.aws.team.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.aws.team.service.NoticeBoardService;
import com.aws.team.util.MediaUtils;
import com.aws.team.util.UploadFileUtiles;
import com.aws.team.util.UserIp;

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
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@Autowired(required = false) 
	private UserIp userIp;
	
	

	// 공지사항 글쓰기
	@RequestMapping(value= "noticeBoardWrite.aws", method=RequestMethod.GET)
	public String noticeBoardWrite() {
		
		return "WEB-INF/noticeBoard/noticeBoardWrite";
	}

	
	// 공지사항 수정
	@RequestMapping(value="noticeBoardModify.aws")
	public String noticeBoardModify(@RequestParam("board_pk") int board_pk, Model model){
		
		BoardVo bv = noticeBoardService.noticeBoardSelectOne(board_pk);
		model.addAttribute("bv", bv);
		
		return "WEB-INF/noticeBoard/noticeBoardModify";
	}
	
	
	
	@RequestMapping(value= "noticeBoardModifyAction.aws")
	public String noticeBoardModifyAction(
		BoardVo bv, 
		@RequestParam("attachfile") MultipartFile attachfile,
		HttpServletRequest request,
		RedirectAttributes rttr
		) throws Exception { 
		
		MultipartFile file = attachfile; //저장된 파일 이름 꺼내기 
		String uploadedFileName=""; // 파일이 업로드된 후 저장된 파일명을 저장할 변수
			
		if(! file.getOriginalFilename().equals("")) { // 해당 파일이 존재한다면
			 // 파일을 서버에 저장하고 저장된 파일 이름을 반환받음
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		}
		
		String user_pk = request.getSession().getAttribute("user_pk").toString();
		int user_pk_int = Integer.parseInt(user_pk); 
		String ip = userIp.getUserIp(request);
			
		bv.setBoard_pk(user_pk_int);
		bv.setUploadedFileName(uploadedFileName);  
		bv.setIp(ip);
		
		//수정 처리
		int value = noticeBoardService.noticeBoardUpdate(bv); // 서비스에서 만든 메서드 호출하기
			
		String path="";
		if(bv.getUser_pk() == user_pk_int) {
	        if(value == 1) {
	           path = "redirect:/noticeBoard/noticeBoardList.aws";
	        }else {
	             rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
	             path = "redirect:/noticeBoard/noticeBoardModify.aws?board_pk=" + bv.getBoard_pk();
	         }
	     }else {
	         rttr.addFlashAttribute("msg", "자신의 게시글만 수정 할 수 있습니다.");
	         path = "redirect:/noticeBoard/noticeBoardModify.aws?board_pk=" + bv.getBoard_pk();
	     } 
	     return path; 
	}	
	
	
	// 공지사항 내용
	@RequestMapping(value= "noticeBoardContents.aws")
	public String noticeBoardContents(@RequestParam("board_pk") int board_pk, Model model, HttpSession session) {
		
		// 세션에서 사용자 등급 가져오기
		String grade = (String) session.getAttribute("grade");
		
		BoardVo bv = noticeBoardService.noticeBoardSelectOne(board_pk);
		
		model.addAttribute("bv", bv);
		model.addAttribute("grade", grade);
		
		String path="WEB-INF/noticeBoard/noticeBoardContents";		
		return path;
	}
	
	
	// 삭제하기 기능
	@RequestMapping(value = "noticeBoardDelete.aws", method = RequestMethod.GET)
	public String noticeBoardDelete(
			@RequestParam("board_pk") int board_pk){
		
	    // 게시글 삭제 서비스 호출
	    int result = noticeBoardService.noticeBoardDelete(board_pk);
	   
	    // 삭제 후 목록 페이지로 리다이렉트
	    return "redirect:/noticeBoard/noticeBoardList.aws";
	}	
	
	
	//게시글 목록을 조회하고 검색 조건에 맞는 게시글을 화면에 표시하는 메서드
	@RequestMapping(value="noticeBoardList.aws", method=RequestMethod.GET)
	public String noticeBoardList(SearchCriteria scri, Model model, HttpSession session) {
		
		// 세션에서 사용자 등급 가져오기
		String grade = (String) session.getAttribute("grade");
		
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
		// 사용자 등급
		model.addAttribute("grade", grade);
			
		//경로에 해당하는 JSP 뷰 페이지를 반환
		return "WEB-INF/noticeBoard/noticeBoardList";
	}	
	
	
	// 공지사항 글작성과 파일 업로드 처리하기
	@RequestMapping(value= "noticeBoardWriteAction.aws")
	public String noticeBoardWriteAction(
		BoardVo bv, // 게시글 정보를 담고 있는 BoardVo 객체를 매개변수로 받음
		@RequestParam("attachfile") MultipartFile attachfile, // 업로드된 파일을 받기 위한 MultipartFile 객체
		HttpServletRequest request,
		RedirectAttributes rttr
		) throws Exception { // 윗단에 보고를 하는것
		
		MultipartFile file = attachfile; //저장된 파일 이름 꺼내기 
		String uploadedFileName=""; // 파일이 업로드된 후 저장된 파일명을 저장할 변수
		
		if(! file.getOriginalFilename().equals("")) { // 해당 파일이 존재한다면
			 // 파일을 서버에 저장하고 저장된 파일 이름을 반환받음
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		}
		
		String user_pk = request.getSession().getAttribute("user_pk").toString();
		int user_pk_int = Integer.parseInt(user_pk);
		String ip = userIp.getUserIp(request);
		
		bv.setUploadedFileName(uploadedFileName);  // vo에 담아서 가져가기 
		bv.setUser_pk(user_pk_int);
		bv.setIp(ip);
		
		int value = noticeBoardService.noticeBoardInsert(bv);

		String path="";
		if(value == 1) { //성공하면
			path = "redirect:/noticeBoard/noticeBoardList.aws";
		}else {
			rttr.addFlashAttribute("msg","입력이 잘못되었습니다.");
			path = "redirect:/noticeBoard/noticeBoardWrite.aws"; // 리다이랙트로 넘기는것은 내부가 아니라 외부기 때문에 전체경로를 넘겨줘야 한다(aws)
		}
		return path;
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/displayFile.aws", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(
			@RequestParam("fileName") String fileName,
			@RequestParam(value="down", defaultValue="0") int down   // 화면에 보여줄 것인가. 다운로드 하게 할 것인가?
			) {
		
		ResponseEntity<byte[]> entity = null;  //객체를 담는 애인데 byte계열을 다 담는다. 
		InputStream in = null;	// 데이터의 수로와 같은데, 처음에 읽어들이는 시작점이 InputStream
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1); // 확장자가 무엇인지 물어본다.
			MediaType mType = MediaUtils.getMediaType(formatName); // 위에서 확장자를 꺼내서 미디어 유틸이라는 곳에 넣는다. 왜냐면 여기서 확장자가 무엇인지 타입을 알기 위해서 (png,jpg)
			
			HttpHeaders headers = new HttpHeaders();		
			 
			in = new FileInputStream(uploadPath+fileName);  // 위에서 초기화한 애를 객체생성시켜서 해당되는 파일 위치를 
			
			if(mType != null){
				
				if (down==1) {
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");	
				}else {
					headers.setContentType(mType);	
				}
			}else{
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			try {
				in.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return entity;
	}

}
