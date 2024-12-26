<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href= "<%=request.getContextPath()%>/resources/css/user/login.css" type="text/css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/header_footer/header_format.jsp" />

  <main>
    <div class="login-container">
      <h1>로그인</h1>
      <form action="#" method="post" class="login-form">
        <label for="user-id">아이디</label>
        <input type="text" id="user-id" name="user-id" placeholder="아이디를 입력하세요" required>

        <label for="password">비밀번호</label>
        <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>

        <button type="submit" class="login-btn">로그인하기</button>

        <div class="options">
          <a href="#" class="find-id">비밀번호 찾기</a>
          <a href="#" class="register">회원가입</a>
        </div>
      </form>
    </div>
  </main>

<jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />
   
</body>
</html>