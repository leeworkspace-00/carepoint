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
<title>비밀번호 찾기</title>
<link href= "${pageContext.request.contextPath}/resources/css/user/login.css" type="text/css" rel="stylesheet">
<script>


	function find() {
		
		var fm = document.frm;
		
		if(fm.username.value=="") {
			alert("이름을 입력해주세요");
			fm.username.focus();
			return;
		}else if(fm.userid.value=="") {
			alert("아이디를 입력해주세요")
			fm.userid.focus();
			return;
		}else if(fm.useremail.value=="") {
			alert("이메일을 입력해주세요");
			fm.useremail.focus();
			return;
		}
		fm.action = "${pageContext.request.contextPath}/user/password/findPwdAction.aws"; 
		fm.method = "post";
		fm.submit();
	return;
		
	}

</script>






</head>






<body>
<!-- header -->
   <jsp:include page="/WEB-INF/include/header_format.jsp" />
	<main>
	    <div class="login-container">
	      <h1>비밀번호 찾기</h1>
	      <form name="frm" class="login-form">
	        <label for="username1">이름</label>
	        <input type="text" id="username" name="username" placeholder="이름을 입력해주세요" required>
	
	        <label for="userid">아이디</label>
	        <input type="text" id="userid" name="userid" placeholder="아이디를 입력해주세요" required>
	
			<label for="useremail">이메일</label>
	        <input type="text" id="useremail" name="useremail" placeholder="가입시 등록하셨던 이메일을 입력해주세요" required>
			
	        <button type="submit" class="login-btn" onclick="find();">비밀번호 찾기</button>

	      </form>
	    </div>
	    

	  </main>
     <!-- footer -->
   <jsp:include page="/WEB-INF/include/footer_format.jsp" />
</body>
</html>