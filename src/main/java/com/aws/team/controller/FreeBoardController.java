package com.aws.team.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.CommentVo;
import com.aws.team.domain.PageMaker;
import com.aws.team.domain.SearchCriteria;
import com.aws.team.service.FreeBoardService;
import com.aws.team.util.MediaUtils;
import com.aws.team.util.UploadFileUtiles;
import com.aws.team.util.UserIp;


@Controller
@RequestMapping(value="/freeBoard/")
public class FreeBoardController {

   private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);   
      
   String path = "";
      
   @Autowired
   private FreeBoardService freeBoardService;
   
   @Autowired(required = false)
   private PageMaker pm;
   
   @Resource(name = "uploadPath")
   private String uploadPath;
      
   @Autowired(required = false)
   private UserIp userIp;

   @RequestMapping(value="freeBoardList.aws", method=RequestMethod.GET)
   public String freeBoardList(SearchCriteria scri, Model model) {
      
      int cnt = freeBoardService.freeBoardTatalCount(scri);
        
      pm.setScri(scri);      
      pm.setTotalCount(cnt);
        
      ArrayList<BoardVo> blist = freeBoardService.freeBoardSelectAll(scri);
        
      model.addAttribute("blist", blist);
      model.addAttribute("pm", pm);
      
      return "WEB-INF/freeBoard/freeBoardList"; 
   }
   
   @RequestMapping(value= "freeBoardWrite.aws", method=RequestMethod.GET)
   public String freeBoardWrite() { 
      
      return "WEB-INF/freeBoard/freeBoardWrite";
   }
   
   @RequestMapping(value = "freeBoardWriteAction.aws", method = RequestMethod.POST)
   public String freeBoardWriteAction(
         BoardVo bv,
         @RequestParam("attachfile") MultipartFile attachfile,
         RedirectAttributes rttr,
         HttpServletRequest request
         ) throws IOException, Exception { 
      
      MultipartFile file = attachfile;
      String uploadedFileName = "";
      
      if (! file.getOriginalFilename().equals("")) {   // 파일업로드
         uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());         
      }
      
      int user_pk = Integer.parseInt(request.getSession().getAttribute("user_pk").toString());
      String ip = userIp.getUserIp(request);
      
      bv.setUploadedFileName(uploadedFileName);
      bv.setUser_pk(user_pk);
      bv.setIp(ip);
      
      int value = freeBoardService.freeBoardInsert(bv);
      
      if (value == 1) {
         rttr.addFlashAttribute("msg", "글이 등록되었습니다.");
         path = "redirect:/freeBoard/freeBoardList.aws";         
      } else {         
         rttr.addFlashAttribute("msg", "입력이 잘못되었습니다.");
         path = "redirect:/freeBoard/freeBoardWrite.aws";
      }
      
      return path;
   }
   
   @RequestMapping(value= "freeBoardModify.aws", method=RequestMethod.GET)
   public String freeBoardModify(
         @RequestParam("board_pk") int board_pk,
         Model model
         ) {
      
      BoardVo bv = freeBoardService.freeBoardSelectOne(board_pk);
      
      model.addAttribute("board_pk", board_pk);
      model.addAttribute("bv", bv);
      
      return "WEB-INF/freeBoard/freeBoardModify";
   }
   
   @RequestMapping(value = "freeBoardModifyAction.aws", method = RequestMethod.POST)
   public String freeBoardModifyAction(
         BoardVo bv,
         @RequestParam("attachfile") MultipartFile attachfile,
         RedirectAttributes rttr,
         HttpServletRequest request
         ) throws IOException, Exception { 
      
      MultipartFile file = attachfile;
      String uploadedFileName = "";
      
      if (! file.getOriginalFilename().equals("")) {   // 파일업로드
         uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());         
      }
      
      int user_pk = Integer.parseInt(request.getSession().getAttribute("user_pk").toString());
      String ip = userIp.getUserIp(request);
      
      bv.setUploadedFileName(uploadedFileName);
      bv.setUser_pk(user_pk);
      bv.setIp(ip);
      
      int value = freeBoardService.freeBoardUpdate(bv);
      
      if (value == 1) {
         rttr.addFlashAttribute("msg", "글이 등록되었습니다.");
         path = "redirect:/freeBoard/freeBoardList.aws";         
      } else {         
         rttr.addFlashAttribute("msg", "입력이 잘못되었습니다.");
         path = "redirect:/freeBoard/freeBoardModify.aws";
      }
      
      return path;
   }
   
   @RequestMapping(value="freeBoardContents.aws", method=RequestMethod.GET)
   public String freeBoardContents(
         @RequestParam("board_pk") int board_pk,
         Model model
         ) {

      int value = freeBoardService.freeBoardUpdateViewcnt(board_pk);
      BoardVo bv = freeBoardService.freeBoardSelectOne(board_pk);
      
      model.addAttribute("board_pk", board_pk);
      model.addAttribute("bv", bv);
      
      return "WEB-INF/freeBoard/freeBoardContents"; 
   }
   
   @ResponseBody
   @RequestMapping(value="freeBoardRecom.aws", method=RequestMethod.GET)
   public JSONObject freeBoardRecom(
         @RequestParam("board_pk") int board_pk
         ) {

      int value = freeBoardService.freeBoardUpdateRecom(board_pk);
      
      JSONObject js = new JSONObject();
      js.put("recom", value);
      
      return js; 
   }

   @RequestMapping(value = "freeBoardDeleteAction.aws", method = RequestMethod.POST)
   public String freeBoardDeleteAction(
         @RequestParam("board_pk") int board_pk,
         RedirectAttributes rttr
         ) { 
      
      int value = freeBoardService.freeBoardDelete(board_pk);
      
      if (value == 1) {
         rttr.addFlashAttribute("msg", "글이 삭제되었습니다.");
         path = "redirect:/freeBoard/freeBoardList.aws";         
      } else {
         rttr.addFlashAttribute("msg", "오류가 생겼습니다.");
         path = "redirect:/freeBoard/freeBoardContents.aws";
      }
      
      return path;
   }
   
   @RequestMapping(value = "displayFile.aws", method = RequestMethod.GET)
   public ResponseEntity<byte[]> displayFile(
         @RequestParam("fileName") String fileName,
         @RequestParam(value = "down", defaultValue = "0") int down
         ) {
      
      ResponseEntity<byte[]> entity = null;   // byte타입 객체를 담는거
      InputStream in = null;   // 데이터를 처음에 읽어주는 역할
      
      try{
         String formatName = fileName.substring(fileName.lastIndexOf(".")+1);   // 확장자이름 추출
         MediaType mType = MediaUtils.getMediaType(formatName);   // 확장자 타입 추출
         
         HttpHeaders headers = new HttpHeaders();      
          
         in = new FileInputStream(uploadPath+fileName);   // 파일경로 읽어드리면서 객체 생성
         
         if(mType != null){ // 지정된 타입을 다운 받을것인지 표시할것인지 선택
            
            if (down==1) {
               fileName = fileName.substring(fileName.indexOf("_")+1);
               headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
               headers.add("Content-Disposition", "attachment; filename=\""+
                     new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");   
               
            }else {
               headers.setContentType(mType);   // 헤더에 이미지를 담고 화면에 띄우기
            }
            
         }else{   // 지정된 타입이 아닐때 다운
            
            fileName = fileName.substring(fileName.indexOf("_")+1);
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.add("Content-Disposition", "attachment; filename=\""+
                  new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");            
         }
         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
               headers,
               HttpStatus.CREATED);   // 상태들을 담기
         
      }catch(Exception e){
         e.printStackTrace();
         entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);   // 오류라고 리턴
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
   
   @ResponseBody
   @RequestMapping(value = "commentWriteAction.aws", method = RequestMethod.POST)
   public JSONObject commentWriteAction(
         CommentVo cv, 
         HttpServletRequest request
         ) throws Exception {
      JSONObject js = new JSONObject();
      
      String ip = userIp.getUserIp(request);
      cv.setIp(ip);
      
      int value = freeBoardService.commentInsert(cv);
      
      js.put("value", value);
      
      return js;
   }
} 

