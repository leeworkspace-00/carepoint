<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스 페이지</title>
</head>

<body>
	<!-- header -->
	
   <jsp:include page="/WEB-INF/header_footer/header_format.jsp" />
   <div style="height:500px;">
  	 <a href = "${pageContext.request.contextPath}/LKH/userJoin.aws">회원가입 페이지 가기</a>
  	 <a href = "${pageContext.request.contextPath}/LKH/userLogin.aws">로그인페이지 가기</a>
  	 <a href = "${pageContext.request.contextPath}/LKH/userLogin.aws">상세정보 입력페이지 가기</a>
  	 <a href = "${pageContext.request.contextPath}/LKH/userLogin.aws">마이페이지 가기</a>
  	 <a href = "${pageContext.request.contextPath}/LKH/userLogin.aws">메인페이지 가기</a>
   </div>
   

   
   
   
   <!-- footer -->
   <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>