<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="java.util.*" %>   
	<%@ page import="com.aws.team.domain.*" %>  
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
  <title>마이페이지</title>
  <link href="<%=request.getContextPath()%>/resources/css/user/mypage.css" type="text/css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>


//모달 열기
  function openEditModal() {
      document.getElementById('editModal').style.display = 'block';
  }

  // 모달 닫기
  function closeEditModal() {
      document.getElementById('editModal').style.display = 'none';
  }

  // 폼 제출 처리 (예시)
  document.getElementById('editForm').addEventListener('submit', function(event) {
      event.preventDefault(); // 기본 동작 막기

      // 입력된 값 가져오기
      const phone = document.getElementById('phone').value;
      const email = document.getElementById('email').value;

      // 추가 로직 (서버로 전송하거나 화면 업데이트)
      alert(`수정된 전화번호: ${userphone}, 이메일: ${useremail}`);
      
      closeEditModal(); // 모달 닫기
  });

</script>
</head>
<body>

  <!-- Header -->
  <jsp:include page="/WEB-INF/include/header_format.jsp" />

  <div class="main-container">
    <!-- 상단 섹션 -->
	<div class="top-section">
	  <ul class="profile-card">
	    <li class="profile-photo">
	      <img src="/resources/image/도경수.jpg" alt="프로필 사진">
	    </li>
	    
	    <li class="profile-contents">
	      <p>닉네임: ${usernick}</p>
	      <p>운동레벨: ${u_dv.e_level}</p>
	      <p>질병: ${u_dv.sicktype}</p>
	      <p>생년월일: ${u_dv.userbirth}</p>
	      <p>가입일: ${joindate}</p>
	    </li>
	  </ul>
	
	      <!-- 그래프 섹션 -->
	      <div class="graph-section">
	        <canvas id="progressChart"></canvas>
	      </div>
	 </div>   

    <!-- 추가 정보 섹션 -->
    <div class="additional-info">
     <!-- 수정하기 버튼 -->
  	  <button class="edit-button" onclick="openEditModal()">수정하기</button>
      <p>전화번호:${userphone}</p>
      <p>이메일: ${useremail}</p>
      <p>키: ${u_dv.height}cm</p>
      <p>몸무게:${u_dv.weight}kg</p>
      <p>흡연/음주: ${u_dv.smoke} / ${u_dv.drink}</p>
    </div>
    
     <!-- 수정 모달 -->
  <div id="editModal" class="modal">
    <div class="modal-content">
      <span class="close" onclick="closeEditModal()">&times;</span>
      <h3>추가 정보 수정</h3>
      <form id="editForm">
        <label for="phone">전화번호:</label>
        <input type="text" id="userphone" name="userphone" value="${userphone}">

        <label for="email">이메일:</label>
        <input type="email" id="useremail" name="useremail" value="${useremail}">

        <label for="height">키:</label>
        <input type="text" id="height" name="height" value="${u_dv.height}cm">

        <label for="weight">몸무게:</label>
        <input type="text" id="weight" name="weight" value="${u_dv.weight}kg">

        <label for="habits">흡연/음주 여부:</label>
	        <input type="checkbox" name="smoking" value="흡연"> 흡연
	        <input type="checkbox" name="drinking" value="음주"> 음주
 		
      </form>
      <!-- 저장하기 버튼 -->
        <button type="submit" class = "save-button">저장하기</button>
         <button type="submit" class = "delete-button">회원탈퇴하기</button>
    </div>
  </div>

    <!-- 게시글 목록 -->
    <div class="post-container">
      <!-- Q&A 목록 -->
      <div class="post-list">
        <h3><a href= "${pageContext.request.contextPath}/qnaBoard/qnaBoardList.aws" style="color: #6495ED;">내가 작성한 Q&A</a></h3>
        <ul>
        <c:forEach var="qna" items = "${mypageQnaList}">
          <li><a href="#">${qna.subject}	작성일 : ${qna.writedate}</a></li>
        </c:forEach>
        </ul>
      </div>

      <!-- 자유게시판 글 목록 -->
      <div class="post-list">
        <h3><a href= "${pageContext.request.contextPath}/freeBoard/freeBoardList.aws" style="color: #6495ED;">내가 작성한 자유게시판 글</a></h3>
        <ul>
        <c:forEach var="free" items = "${mypageFreeList}">
          <li><a href="#">${free.subject}  작성일:${free.writedate}</a></li>
        </c:forEach>
        </ul>
      </div>
    </div>

  </div>

  <!-- Footer -->
  <jsp:include page="/WEB-INF/include/footer_format.jsp" />

  <!-- 그래프 스크립트 -->
  <script>
    const ctx = document.getElementById('progressChart').getContext('2d');
    const progressChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: ['12월 14일', '12월 21일', '12월 28일', '12월 31일'], // X축 레이블
        datasets: [{
          label: '몸무게,혈당,혈압 등',
          data: [80, 79, 78, 76], // 데이터 값
          borderColor: '#6495ED', // 선 색상
          backgroundColor: 'rgba(100,149,237,0.2)', // 배경색
          tension: 0.1, // 곡선 정도
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: { display: true },
          tooltip: { enabled: true }
        },
        scales: {
          x: { title: { display: true, text: '날짜' } },
          y: { title: { display: true, text: '수치' }, min: 0, max: 300 }
        }
      }
    });
  </script>

</body>
</html>
