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
   
    <a href="/lia/freeBoardList.aws">회원가입 페이지</a>
   <br>
	<a href="/KES/boardWrite.aws">자유게시판 글쓰기</a>
   <br>
   	<a href="/KES/boardModify.aws">자유게시판 글수정</a>
   <br>
   <a href="/KES/qnaBoardWrite.aws">QnA 문의하기</a>
   <br>
	<a href="/KES/qnaBoardModify.aws">QnA 수정하기</a>
   <br>
	<a href="/KES/qnaBoardReply.aws">QnA 답변하기</a>
   <br>   
	<a href="/KES/noticeBoardWrite.aws">공지사항 작성하기</a>
   <br>   
	<a href="/KES/noticeBoardModify.aws">공지사항 수정하기</a>
   <br>    
	<a href="/KES/foodRecom.aws">식단추천</a>
   <br>
   	<a href="/KES/foodDetail.aws">식단기록표 상세내용</a>
   <br>
	<a href="/KES/foodMain.aws">식단 메인 페이지</a>
   <br>


   
   <div style="height:500px;">
   </div>  
   
   <!-- footer -->
   <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>