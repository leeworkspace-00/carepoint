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
   
   <a href="/LIA/freeBoardList.aws">자유게시판 페이지</a>
   <a href="/LIA/exerciseMain.aws">운동 페이지</a> 
   <a href="/KES/boardWrite.aws">게시판 글쓰기 페이지</a>
   <a href="/KES/foodRecom.aws">식단추천 페이지</a> 
   <a href="/LIA/calendar.aws">캘린더 테스트</a> 

   <div style="height:500px;">
   </div>  
   
   <!-- footer -->
   <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>