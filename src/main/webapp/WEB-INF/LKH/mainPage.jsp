<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>메인 페이지</title>
<link href="<%=request.getContextPath()%>/resources/css/user/main.css" type="text/css" rel="stylesheet">

</head>
<body>
	<!-- header -->
   <jsp:include page="/WEB-INF/header_footer/header_format.jsp" />

  <main>
    <!-- 이미지 슬라이더 -->
    <section class="slider">
     <button class="arrow left-arrow">&lt;</button>
      <div class="slides">
        <img src="/resources/image/도경수.jpg" alt="슬라이드 이미지 1">
        <img src="/resources/image/필릭스.jpg" alt="슬라이드 이미지 2">
        <img src="/resources/image/현진.jpg" alt="슬라이드 이미지 3">
      </div>
      <button class="arrow right-arrow">&gt;</button>
      <div class="navigation-dots"></div>
    </section>
  <!-- 통계 및 기사/인터뷰 섹션 -->
  <section class="main-content">
    <!-- 통계 사진 -->
    <div class="statistics">
      <h2>통계 사진</h2>
      <img src="/resources/image/고혈압환자수_그래프.jpg" alt="통계 그래프">
      <img src="/resources/image/당뇨유병률_그래프.png" alt="통계 그래프">
      <img src="/resources/image/비만 그래프.jpg" alt="통계 그래프">
    </div>

    <!-- 기사 및 인터뷰 -->
    <div class="content">
      <div class="articles">
        <h2>기사</h2>
        <ul>
          <li><a href="https://www.whosaeng.com/140683">
“20~30대 MZ세대 ‘고혈압’ 증가 추세”</a></li>
          <li><a href="https://www.doctorsnews.co.kr/news/articleView.html?idxno=157213">"고혈압 관리 세계 최고"…변화 없는 유병률·환자 수 증가 '숙제'</a></li>
          <li><a href="https://www.skkuw.com/news/articleView.html?idxno=31542">소리 없이 다가오는 위험, 고혈압</a></li>
        </ul>
      </div>

      <div class="interviews">
        <h2>인터뷰</h2>
        <ul>
          <li><a href="https://www.youtube.com/watch?v=hAcvQOkLznU">고혈압 관리가 중요한 이유</a></li>
          <li><a href="https://www.youtube.com/watch?v=RirBMrI8V1U">소아와 성인 고혈압의 차이점과 연관성은? ...</a></li>
          <li><a href="https://www.youtube.com/watch?v=JlMSJAcbH44">소아청소년 고혈압. 지금 어떻게 하느냐가 중요합니다!ㅣ대한신장학회</a></li>
        </ul>
      </div>
    </div>
  </section>
  </main>

   
   <!-- footer -->
   <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />
   
   
   <script>
   const slides = document.querySelectorAll('.slides img');
   const dots = document.querySelector('.navigation-dots');
   const leftArrow = document.querySelector('.left-arrow');
   const rightArrow = document.querySelector('.right-arrow');
   let currentIndex = 0;

   // 슬라이더 초기화
   slides.forEach((_, index) => {
       const dot = document.createElement('span');
       dot.addEventListener('click', () => showSlide(index));
       dots.appendChild(dot);
   });
   dots.children[0].classList.add('active');

   // 슬라이드 전환 함수
   function showSlide(index) {
       slides[currentIndex].style.display = 'none';
       dots.children[currentIndex].classList.remove('active');

       currentIndex = index;

       slides[currentIndex].style.display = 'block';
       dots.children[currentIndex].classList.add('active');
   }

   // 화살표 클릭 이벤트
   leftArrow.addEventListener('click', () => {
       const nextIndex = (currentIndex - 1 + slides.length) % slides.length; // 이전 슬라이드
       showSlide(nextIndex);
   });

   rightArrow.addEventListener('click', () => {
       const nextIndex = (currentIndex + 1) % slides.length; // 다음 슬라이드
       showSlide(nextIndex);
   });

   // 자동 슬라이드 (3초 간격)
   setInterval(() => {
       const nextIndex = (currentIndex + 1) % slides.length; // 다음 슬라이드
       showSlide(nextIndex);
   }, 3000);
   
   

</script>

  <script src="script.js"></script>
</body>
</html>
