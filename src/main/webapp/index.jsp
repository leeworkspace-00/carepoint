<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스 페이지</title>
</head>

<body>
	<!-- header -->
   <jsp:include page="/WEB-INF/include/header_format.jsp" />

   <br>인아[qna목록, 공지 목록, bmi계산기]
    <a href="/freeBoard/freeBoardList.aws">자유게시판 페이지(인아)</a>
   <br>
    <a href="/exercise/exerciseMain.aws">운동 페이지(인아)</a> 
    <br>
    <a href="/exercise/calendarTest.aws">캘린더 테스트 페이지(인아)</a> 

   <br>경현
   <br>
    <a href="/user/userDetail.aws">회원 상세정보 입력페이지(경현)</a>
   <br>
    <a href="/user/myPage.aws">회원 마이페이지(경현)</a>
   <br>
    <a href="/user/userJoin.aws">회원가입 페이지(경현)</a>
   <br>
    <a href="/user/userLogin.aws">로그인 페이지(경현)</a>
   <br>
    <a href="/user/userDetail.aws">회원 상세정보 입력페이지(경현)</a>
   <br>
    <a href="/user/myPage.aws">회원 마이페이지(경현)</a>
   <br>
    <a href="/user/mainPage.aws">메인페이지(경현)</a>
    
   <br>이슬
    <a href="/freeBoard/freeBoardWrite.aws">게시판 글쓰기 페이지(이슬)</a>
   <br>
    <a href="/food/foodRecom.aws">식단추천 페이지(이슬)</a> 
   <br>
	<a href="/freeBoard/freeBoardWrite.aws">자유게시판 글쓰기(이슬)</a>
   <br>
   	<a href="/freeBoard/freeBoardModify.aws">자유게시판 글수정(이슬)</a>
   <br>
   <a href="/qnaBoard/qnaBoardWrite.aws">QnA 문의하기(이슬)</a>
   <br>
	<a href="/qnaBoard/qnaBoardModify.aws">QnA 수정하기(이슬)</a>
   <br>
	<a href="/qnaBoard/qnaBoardReply.aws">QnA 답변하기(이슬)</a>
   <br>   
	<a href="/noticeBoard/noticeBoardWrite.aws">공지사항 작성하기(이슬)</a>
   <br>   
	<a href="/noticeBoard/noticeBoardModify.aws">공지사항 수정하기(이슬)</a>
   <br>    
	<a href="/food/foodRecom.aws">식단추천(이슬)</a>
   <br>
    <a href="/food/foodDetail.aws">식단기록표 상세내용(이슬)</a>
   <br>
	<a href="/food/foodMain.aws">식단 메인 페이지(이슬)</a>

   <br>인서
    <a href="/freeBoard/freeBoardContents.aws">자유게시판 상세내용(인서)</a>
   <br>
    <a href="/noticeBoard/noticeBoardContents.aws">공지사항 상세보기</a>
   <br>
    <a href="/qnaBoard/qnaBoardContents.aws">Q&A상세보기</a>
   <br>
    <a href="/todo/todoList.aws">오늘의 할일</a>

   <div style="height:500px;"></div>  
   
   <!-- footer -->
   <jsp:include page="/WEB-INF/include/footer_format.jsp" />

</body>
</html>