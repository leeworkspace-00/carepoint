<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%
boolean isLoggedIn = false;

if (session.getAttribute("user_pk") == null) { 
    isLoggedIn = false;
} else {
    isLoggedIn = true;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href= "${pageContext.request.contextPath}/resources/css/format.css" type="text/css" rel="stylesheet">
</head>

  <script>
    function toggleChapters() {
      const chapterList = document.getElementById('chapterList');
      const overlay = document.getElementById('overlay');
      
      if (chapterList.classList.contains('open')) {
        chapterList.classList.remove('open');
        overlay.style.display = 'none';
        document.body.style.overflow = 'auto';
      } else {
        chapterList.classList.add('open');
        overlay.style.display = 'block';
        document.body.style.overflow = 'hidden';
      }
    }

    document.addEventListener('click', function(event) {
      const chapterList = document.getElementById('chapterList');
      const overlay = document.getElementById('overlay');
      
      if (!chapterList.contains(event.target) && !event.target.matches('.category-btn')) {
        chapterList.classList.remove('open');
        overlay.style.display = 'none';
        document.body.style.overflow = 'auto';
      }
    });
  </script>

<body>

  <!-- 헤더 -->
  <header>
    <div class="header-container">
      <!-- 로고 -->
      <a href="/index.jsp">
      	<img src="${pageContext.request.contextPath}/resources/image/logo.jpg" alt="로고" class="logo">
      </a>
    </div>
    <ul class="menu">
    <% if (session.getAttribute("user_pk") == null) {%>
    	<!-- 로그인 안한 경우 -->
    	<li><a href="/user/userJoin.aws">회원가입</a></li>
        <li><a href="/user/userLogin.aws">로그인</a></li>
    <% } else { %>
		<!-- 로그인한 경우 -->
        <li><a href = "/user/myPage.aws">마이페이지</a></li>
        <li><a href = "/user/userLogout.aws">로그아웃</a></li>
    <% } %>
        <li>         
         <button class="category-btn" onclick="toggleChapters()">≡</button>
        </li>
    </ul>
  </header>
  
<div class="chapter-list" id="chapterList">
    <div><h3>CHAPTER</h3></div>

    <ul>
        <li><a href="/exercise/exerciseMain.aws">운동</a></li>
        <li><a href="#">식단</a></li>
        <li><a href="#">TodoList</a></li>
        <li><a href="/exercise/bmi.aws">BMI계산기</a></li>
        <li><a href="/freeBoard/freeBoardList.aws">자유게시판</a></li>
        <li><a href="${pageContext.request.contextPath}/qnaBoard/qnaBoardList.aws">Q&A</a></li>
        <li><a href="/noticeBoard/noticeBoardList.aws">공지사항</a></li>
    </ul>
    <!-- Bottom Links for Login/Signup or My Page/Logout -->
    <div class="bottom-links">
    <% if (session.getAttribute("user_pk") == null){ %>	<!-- 로그인 안된경우 -->
        <a href="/user/userLogin.aws">로그인</a>
        <span>/</span>
        <a href="/user/userJoin.aws">회원가입</a>  
        <%} else { %>
        <a href="/user/myPage.aws">마이페이지</a> <!-- 로그인 된 경우 -->
        <span>/</span>
        <a href="/user/userLogout.aws">로그아웃</a>  
        <%} %>
    </div>
</div>

<!-- 배경 오버레이 (투명도 효과) -->
<div class="overlay" id="overlay"></div>

</body>
</html>