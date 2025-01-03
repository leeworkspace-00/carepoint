<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href= "<%=request.getContextPath()%>/resources/css/format.css" type="text/css" rel="stylesheet">
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
      	<img src="<%=request.getContextPath()%>/resources/image/logo.jpg" alt="로고" class="logo">
      </a>
    </div>
    <ul class="menu">
        <li><a>회원가입</a></li>
        <li><a>로그인</a></li>
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
        <li><a href="/qnaBoard/qnaBoardList.aws">Q&A</a></li>
        <li><a href="/noticeBoard/noticeBoardList.aws">공지사항</a></li>
    </ul>
    <!-- Bottom Links for Login/Signup or My Page/Logout -->
    <div class="bottom-links">
        <a href="#">로그인</a>
        <span>/</span>
        <a href="#">회원가입</a>  
    </div>
</div>

<!-- 배경 오버레이 (투명도 효과) -->
<div class="overlay" id="overlay"></div>

</body>
</html>