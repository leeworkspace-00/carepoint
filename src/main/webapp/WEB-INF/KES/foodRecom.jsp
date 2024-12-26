<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>식단기록 내용</title>
<link href= "<%=request.getContextPath()%>/resources/css/food/foodRecom.css" type="text/css" rel="stylesheet">
</head>

<script>

//DOMContentLoaded 이벤트로 DOM이 완전히 로드된 후 실행
document.addEventListener("DOMContentLoaded", () => {
  // 모든 카테고리 버튼과 콘텐츠 영역 가져오기
  const categoryButtons = document.querySelectorAll('.category-button');
  const categoryContents = document.querySelectorAll('.category-content');

  // 카테고리 버튼 클릭 이벤트 추가
  categoryButtons.forEach((button) => {
    button.addEventListener('click', () => {
      // 모든 버튼과 콘텐츠에서 active 클래스 제거
      categoryButtons.forEach((btn) => btn.classList.remove('active'));
      categoryContents.forEach((content) => content.classList.remove('active'));

      // 클릭한 버튼에 active 클래스 추가
      button.classList.add('active');

      // 클릭한 버튼과 연결된 콘텐츠 표시
      const targetCategory = button.getAttribute('data-category');
      document.getElementById(targetCategory).classList.add('active');

      // 하위 탭 초기화 (첫 번째 탭 활성화)
      const firstTabButton = document.querySelector(`#${targetCategory} .tab-button`);
      const firstTabContent = document.querySelector(`#${targetCategory} .tab-content`);
      
      if (firstTabButton && firstTabContent) {
        document.querySelectorAll(`#${targetCategory} .tab-button`).forEach((btn) => btn.classList.remove('active'));
        document.querySelectorAll(`#${targetCategory} .tab-content`).forEach((content) => content.classList.remove('active'));
        firstTabButton.classList.add('active');
        firstTabContent.classList.add('active');
      }
    });
  });

  // 하위 탭(식단1, 식단2, 식단3) 버튼 클릭 이벤트 추가
  document.addEventListener("click", (e) => {
    if (e.target.classList.contains("tab-button")) {
      const parentCategory = e.target.closest('.category-content');
      
      // 해당 카테고리 내에서만 처리
      parentCategory.querySelectorAll('.tab-button').forEach((btn) => btn.classList.remove('active'));
      parentCategory.querySelectorAll('.tab-content').forEach((content) => content.classList.remove('active'));

      // 클릭한 탭 활성화
      e.target.classList.add('active');
      const targetTab = e.target.getAttribute('data-tab');
      parentCategory.querySelector(`#${targetTab}`).classList.add('active');
    }
  });
});



</script>

<body>

<!-- header -->
<jsp:include page="/WEB-INF/header_footer/header_format.jsp" />

<div class="recommendation-page">
  <h1>식단 추천</h1>
  
  <!-- 상단 버튼 -->
  <div class="buttons">
    <button class="category-button active" data-category="high-blood-pressure">고혈압</button>
    <button class="category-button" data-category="diabetes">당뇨</button>
    <button class="category-button" data-category="obesity">비만</button>
  </div>

  <!-- 고혈압 콘텐츠 -->
  <div class="category-content active" id="high-blood-pressure">
    <!-- 식단 버튼 -->
    <div class="sub-buttons">
      <button class="tab-button active" data-tab="hb-tab1">식단 1️⃣</button>
      <button class="tab-button" data-tab="hb-tab2">식단 2️⃣</button>
      <button class="tab-button" data-tab="hb-tab3">식단 3️⃣</button>
    </div>
    <!-- 식단 내용 -->
    <div class="tab-content active" id="hb-tab1">
      <h3>고혈압 - 식단 1️⃣</h3>
      <p>아침: 흑미밥, 재첩 맑은국<br>점심: 흑미밥, 된장국<br>저녁: 흑미밥, 미역국</p>
    </div>
    <div class="tab-content" id="hb-tab2">
      <h3>고혈압 - 식단 2️⃣</h3>
      <p>아침: 현미밥, 북엇국<br>점심: 현미밥, 김치찌개<br>저녁: 현미밥, 콩나물국</p>
    </div>
    <div class="tab-content" id="hb-tab3">
      <h3>고혈압 - 식단 3️⃣</h3>
      <p>아침: 보리밥, 소고기무국<br>점심: 보리밥, 된장찌개<br>저녁: 보리밥, 나물비빔밥</p>
    </div>
  </div>

  <!-- 당뇨 콘텐츠 -->
  <div class="category-content" id="diabetes">
    <!-- 당뇨 식단 버튼 -->
    <div class="sub-buttons">
      <button class="tab-button active" data-tab="db-tab1">식단 1️⃣</button>
      <button class="tab-button" data-tab="db-tab2">식단 2️⃣</button>
      <button class="tab-button" data-tab="db-tab3">식단 3️⃣</button>
    </div>
    <!-- 당뇨 식단 내용 -->
    <div class="tab-content active" id="db-tab1">
      <h3>당뇨 - 식단 1️⃣</h3>
      <p>아침: 귀리밥, 미역국<br>점심: 귀리밥, 닭가슴살 샐러드<br>저녁: 귀리밥, 채소볶음</p>
    </div>
    <!-- 나머지 탭 콘텐츠 추가 -->
  </div>

  <!-- 비만 콘텐츠 -->
  <div class="category-content" id="obesity">
    <!-- 비만 식단 버튼 -->
    <div class="sub-buttons">
      <button class="tab-button active" data-tab="ob-tab1">식단 1️⃣</button>
      <button class="tab-button" data-tab="ob-tab2">식단 2️⃣</button>
      <button class="tab-button" data-tab="ob-tab3">식단 3️⃣</button>
    </div>
    <!-- 비만 식단 내용 -->
    <!-- 나머지 탭 콘텐츠 추가 -->
  </div>

</div>



<!-- footer -->
<jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>