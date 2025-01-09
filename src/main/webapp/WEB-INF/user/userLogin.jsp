<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%
String msg = "";  
if (request.getAttribute("msg") != null) {
   msg = (String)request.getAttribute("msg");
}

if (msg != "") {
   out.println("<script>alert('" + msg + "');</script>");   
}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href= "${pageContext.request.contextPath}/resources/css/user/login.css" type="text/css" rel="stylesheet">
<script>

//아이디 비밀번호 유효성 검사
	function check() {
	
	var fm = document.frm;
	
	if(fm.userid.value=="") {
		alert("아이디를 입력해주세요");
		fm.userid.focus();
		return;
	}else if(fm.userpwd.value=="") {
		alert("비밀번호를 입력해주세요")
		fm.userpwd.focus();
		return;
	}
		fm.action = "${pageContext.request.contextPath}/user/userLoginAction.aws"; 
		fm.method = "post";
		fm.submit();
	return;
}

</script>

</head>
<body>
<jsp:include page="/WEB-INF/include/header_format.jsp" />
  <main>
    <div class="login-container">
      <h1>로그인</h1>
      <form name="frm" class="login-form">
        <label for="user-id">아이디</label>
        <input type="text" id="userid" name="userid" placeholder="아이디를 입력하세요" required>

        <label for="password">비밀번호</label>
        <input type="password" id="userpwd" name="userpwd" placeholder="비밀번호를 입력하세요" required>

        <button type="submit" class="login-btn" onclick="check();">로그인하기</button>

        <div class="options">
          <a href="${pageContext.request.contextPath}/user/findId.aws" class="find-id">비밀번호 찾기</a>
          <a href="${pageContext.request.contextPath}/user/userJoin.aws" class="register">회원가입</a>
        </div>
      </form>
    </div>
  </main>

<jsp:include page="/WEB-INF/include/footer_format.jsp" />
   
</body>
</html>