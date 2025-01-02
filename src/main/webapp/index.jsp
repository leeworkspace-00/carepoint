<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스 페이지</title>
</head>

<body>
	<!-- header -->
   <jsp:include page="/WEB-INF/header_footer/header_format.jsp" />


   <br>인아[qna목록, 공지 목록, bmi계산기]
    <a href="/LIA/freeBoardList.aws">자유게시판 페이지(인아)</a>
   <br>
    <a href="/LIA/exerciseMain.aws">운동 페이지(인아)</a> 

   <br>경현
    <a href="/LKH/userJoin.aws">회원가입 페이지(경현)</a>
   <br>
    <a href="/LKH/userLogin.aws">로그인 페이지(경현)</a>
   <br>
    <a href="/LKH/userDetail.aws">회원 상세정보 입력페이지(경현)</a>
   <br>
    <a href="/LKH/myPage.aws">회원 마이페이지(경현)</a>
   <br>
    <a href="/LKH/mainPage.aws">메인페이지(경현)</a>
    
    
   <br>이슬
    <a href="/KES/boardWrite.aws">게시판 글쓰기 페이지(이슬)</a>
   <br>
    <a href="/KES/foodRecom.aws">식단추천 페이지(이슬)</a> 
   <br>
	<a href="/KES/boardWrite.aws">자유게시판 글쓰기(이슬)</a>
   <br>
   	<a href="/KES/boardModify.aws">자유게시판 글수정(이슬)</a>
   <br>
   <a href="/KES/qnaBoardWrite.aws">QnA 문의하기(이슬)</a>
   <br>
	<a href="/KES/qnaBoardModify.aws">QnA 수정하기(이슬)</a>
   <br>
	<a href="/KES/qnaBoardReply.aws">QnA 답변하기(이슬)</a>
   <br>   
	<a href="/KES/noticeBoardWrite.aws">공지사항 작성하기(이슬)</a>
   <br>   
	<a href="/KES/noticeBoardModify.aws">공지사항 수정하기(이슬)</a>
   <br>    
	<a href="/KES/foodRecom.aws">식단추천(이슬)</a>
   <br>
    <a href="/KES/foodDetail.aws">식단기록표 상세내용(이슬)</a>
   <br>
	<a href="/KES/foodMain.aws">식단 메인 페이지(이슬)</a>

   <br>인서
    <a href="/KIS/freeBoardContents.aws">자유게시판 상세내용(인서)</a>
   <br>
    <a href="/KIS/noticeBoardContents.aws">공지사항 상세보기</a>
   <br>
    <a href="/KIS/qnaBoardContents.aws">Q&A상세보기</a>
   <br>
    <a href="/KIS/todoList.aws">오늘의 할일</a>

   <div style="height:500px;">
   </div>  
   
   <!-- footer -->
   <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>