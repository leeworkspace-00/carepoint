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
   
   <a href="/KIS/freeBoardContents.aws">자유게시판 상세보기</a>
   <a href="/KIS/noticeBoardContents.aws">공지사항 상세보기</a>
   <a href="/KIS/qnaBoardContents.aws">Q&A상세보기</a>
   <a href="/KIS/todoList.aws">오늘의 할일</a>
   <div style="height:500px;">
   </div>  
   
   <!-- footer -->
   <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>