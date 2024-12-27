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
   

   <a href="/LKH/userJoin.aws">회원가입 페이지</a>
   <br>
   <a href="/LKH/userLogin.aws">로그인 페이지</a>
   <br>
   <a href="/LKH/userDetail.aws">회원 상세정보 입력페이지</a>
   <br>
   <a href="/LKH/myPage.aws">회원 마이페이지</a>
   <br>
   <a href="/LKH/mainPage.aws">메인페이지</a>
   <br>
   <a href="/LIA/freeBoardList.aws">자유게시판 페이지</a>
   <br>
   <a href="/LIA/exerciseMain.aws">운동 페이지</a>
   <br> 
   <a href="/KES/boardWrite.aws">게시판 글쓰기 페이지</a>
   <br>
   <a href="/KES/foodRecom.aws">식단추천 페이지</a> 
   <br>
	<a href="/KES/boardWrite.aws">게시판 글쓰기</a>
   <br>
	<a href="/KES/foodRecom.aws">식단추천</a>
   <br>
   <a href="/KIS/freeBoardContents.aws">게시판 상세내용</a>

   

   
   <div style="height:500px;">
   </div>  
   
   <!-- footer -->
   <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>