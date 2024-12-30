<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      alert(`수정된 전화번호: ${phone}, 이메일: ${email}`);
      
      closeEditModal(); // 모달 닫기
  });

</script>
</head>
<body>

  <!-- Header -->
  <jsp:include page="/WEB-INF/header_footer/header_format.jsp" />

  <div class="main-container">
    <!-- 상단 섹션 -->
<div class="top-section">
  <ul class="profile-card">
    <li class="profile-photo">
      <img src="/resources/image/profile.png" alt="프로필 사진">
    </li>
    
    <li class="profile-contents">
      <p><strong>닉네임: </strong>hong</p>
      <p><strong>운동레벨:</strong> 1kg</p>
      <p><strong>질병:</strong> 비만</p>
      <p><strong>생년월일:</strong> 1990-01-01</p>
      <p><strong>가입일:</strong> 2022-01-01</p>
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
      <p><strong>전화번호:</strong> 010-1234-5678</p>
      <p><strong>이메일:</strong> example@example.com</p>
      <p><strong>키:</strong> 175cm</p>
      <p><strong>몸무게:</strong> 70kg</p>
      <p><strong>흡연/음주:</strong> 음주</p>
    </div>
    
     <!-- 수정 모달 -->
  <div id="editModal" class="modal">
    <div class="modal-content">
      <span class="close" onclick="closeEditModal()">&times;</span>
      <h3>추가 정보 수정</h3>
      <form id="editForm">
        <label for="phone">전화번호:</label>
        <input type="text" id="phone" name="phone" value="010-1234-5678">

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" value="example@example.com">

        <label for="height">키:</label>
        <input type="text" id="height" name="height" value="175cm">

        <label for="weight">몸무게:</label>
        <input type="text" id="weight" name="weight" value="70kg">

        <label for="habits">흡연/음주 여부:</label>
	        <input type="checkbox" name="smoking" value="흡연"> 흡연
	        <input type="checkbox" name="drinking" value="음주"> 음주
 		
      </form>
      <!-- 저장하기 버튼 -->
        <button type="submit" class = "save-button">저장하기</button>
    </div>
  </div>

    <!-- 게시글 목록 -->
    <div class="post-container">
      <!-- Q&A 목록 -->
      <div class="post-list">
        <h3 style="color: #6495ED;">내가 작성한 Q&A</h3>
        <ul>
          <li><a href="#">제목1 - 작성일: 2024-12-12</a></li>
          <li><a href="#">제목2 - 작성일: 2024-12-11</a></li>
          <li><a href="#">제목3 - 작성일: 2024-12-10</a></li>
          <li><a href="#">제목4 - 작성일: 2024-12-09</a></li>
          <li><a href="#">제목5 - 작성일: 2024-12-08</a></li>
        </ul>
      </div>

      <!-- 자유게시판 글 목록 -->
      <div class="post-list">
        <h3 style="color: #6495ED;">내가 작성한 자유게시판 글</h3>
        <ul>
          <li><a href="#">제목1 - 작성일: 2024-12-12</a></li>
          <li><a href="#">제목2 - 작성일: 2024-12-11</a></li>
          <li><a href="#">제목3 - 작성일: 2024-12-10</a></li>
          <li><a href="#">제목4 - 작성일: 2024-12-09</a></li>
          <li><a href="#">제목5 - 작성일: 2024-12-08</a></li>
        </ul>
      </div>
    </div>

  </div>

  <!-- Footer -->
  <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

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
