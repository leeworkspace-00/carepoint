<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<link href= "<%=request.getContextPath()%>/resources/css/user/join.css" type="text/css" rel="stylesheet">
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<body>
	<!-- header -->
   <jsp:include page="/WEB-INF/include/header_format.jsp" />

   <main>
    <section class="registration-form">
      <h1>회원가입</h1>
      <form action="#" method="post">
        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
        </div>
        <div class="form-group">
          <label for="nickname">닉네임</label>
          <div class="input-wrapper">
          <input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
          	<button type="button" class="check-btn" onclick="checkNickname()">중복확인</button>
        </div>
        </div>
        <div class="form-group">
          <label for="id">아이디</label>
           <div class="input-wrapper">
          <input type="text" id="id" name="id" placeholder="아이디를 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
          	<button type="button" class="check-btn" onclick="checkUserId()">중복확인</button>
        </div>
        </div>
        <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
        </div>
        <div class="form-group">
          <label for="confirm-password">비밀번호 확인</label>
          <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호를 확인해주세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
        </div>
        <div class="form-group">
          <label for="phone">전화번호</label>
          <input type="tel" id="phone" name="phone" placeholder="전화번호를 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
        </div>
        <div class="form-group">
          <label for="email">이메일</label>
          <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
        </div>
        <button type="submit">회원가입하기</button>
      </form>
    </section>
  </main>
   <!-- footer -->

   <jsp:include page="/WEB-INF/include/footer_format.jsp" />


</body>
</html>