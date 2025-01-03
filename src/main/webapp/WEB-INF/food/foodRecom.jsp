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

document.addEventListener("DOMContentLoaded", function () {
	  // 상위 카테고리 버튼 (고혈압, 당뇨, 비만)
	  const categoryButtons = document.querySelectorAll(".category-button");
	  const categoryContents = document.querySelectorAll(".category-content");

	  // 상위 카테고리 버튼 클릭 이벤트
	  categoryButtons.forEach((button) => {
	    button.addEventListener("click", function () {
	      // 모든 카테고리 버튼과 콘텐츠에서 'active' 클래스 제거
	      categoryButtons.forEach((btn) => btn.classList.remove("active"));
	      categoryContents.forEach((content) => content.classList.remove("active"));

	      // 클릭한 버튼과 해당 콘텐츠에 'active' 클래스 추가
	      this.classList.add("active");
	      const selectedCategory = this.getAttribute("data-category");
	      document.getElementById(selectedCategory).classList.add("active");

	      // 하위 탭(식단1)을 기본 활성화 상태로 설정
	      const defaultTab = document
	        .getElementById(selectedCategory)
	        .querySelector(".tab-button");
	      defaultTab.click();
	    });
	  });

	  // 하위 탭 버튼 (식단1, 식단2, 식단3)
	  const tabButtons = document.querySelectorAll(".tab-button");
	  const tabContents = document.querySelectorAll(".tab-content");

	  // 하위 탭 버튼 클릭 이벤트
	  tabButtons.forEach((button) => {
	    button.addEventListener("click", function () {
	      // 현재 활성화된 카테고리 내에서만 동작
	      const parentCategory = this.closest(".category-content");

	      // 해당 카테고리의 모든 탭 버튼과 콘텐츠에서 'active' 클래스 제거
	      parentCategory.querySelectorAll(".tab-button").forEach((btn) =>
	        btn.classList.remove("active")
	      );
	      parentCategory.querySelectorAll(".tab-content").forEach((content) =>
	        content.classList.remove("active")
	      );

	      // 클릭한 탭 버튼과 해당 콘텐츠에 'active' 클래스 추가
	      this.classList.add("active");
	      const selectedTab = this.getAttribute("data-tab");
	      document.getElementById(selectedTab).classList.add("active");
	    });
	  });
	});

</script>

<body>

<!-- header -->
<jsp:include page="/WEB-INF/include/header_format.jsp" />

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
      <button class="tab-button active" data-tab="hb-tab1">식단 1 🍴</button>
      <button class="tab-button" data-tab="hb-tab2">식단 2 🍴</button>
      <button class="tab-button" data-tab="hb-tab3">식단 3 🍴</button>
    </div>
    
  <!-- 식단 내용1 -->
  <div class="tab-content active" id="hb-tab1">
  <table class="meal-table">
    <!-- 제목 행 -->
    <thead>
      <tr>
        <th>메뉴</th>
        <th>영양 정보</th>
      </tr>
    </thead>
    <!-- 내용 행 -->
    <tbody>
      <!-- 아침 식단 -->
      <tr>
        <td>
          <strong>아침 식단 🌞</strong><br>
          <br>
          흑미밥<br>재첩 맑은국<br>꽈리고추찜<br>아삭이 고추무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>재첩 70g 무 70g<br>꽈리고추 70g 밀가루 10g<br>아삭이고추 70g 양파 35g<br>배추김치 50g
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          흑미밥<br>된장국<br>나물무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>된장국(무) 70g<br>나물무침(고사리) 50g<br>배추김치 50g
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          흑미밥<br>미역국<br>나물비빔밥
        </td>
        <td>
          쌀 60g 흑미 20g<br>미역국(미역) 70g<br>나물비빔밥(시금치) 50g
        </td>
      </tr>
    </tbody>
  </table>
</div>


  <!-- 식단 내용2 -->
  <div class="tab-content" id="hb-tab2">
  <table class="meal-table">
    <!-- 제목 행 -->
    <thead>
      <tr>
        <th>메뉴</th>
        <th>영양 정보</th>
      </tr>
    </thead>
    <!-- 내용 행 -->
    <tbody>
      <!-- 아침 식단 -->
      <tr>
        <td>
          <strong>아침 식단 🌞</strong><br>
          <br>
          흑미밥<br>재첩 맑은국<br>꽈리고추찜<br>아삭이 고추무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>재첩 70g 무 70g<br>꽈리고추 70g 밀가루 10g<br>아삭이고추 70g 양파 35g<br>배추김치 50g
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          흑미밥<br>된장국<br>나물무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>된장국(무) 70g<br>나물무침(고사리) 50g<br>배추김치 50g
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          흑미밥<br>미역국<br>나물비빔밥
        </td>
        <td>
          쌀 60g 흑미 20g<br>미역국(미역) 70g<br>나물비빔밥(시금치) 50g
        </td>
      </tr>
    </tbody>
  </table>
</div>


  <!-- 식단 내용3 -->
  <div class="tab-content" id="hb-tab3">
  <table class="meal-table">
    <!-- 제목 행 -->
    <thead>
      <tr>
        <th>메뉴</th>
        <th>영양 정보</th>
      </tr>
    </thead>
    <!-- 내용 행 -->
    <tbody>
      <!-- 아침 식단 -->
      <tr>
        <td>
          <strong>아침 식단 🌞</strong><br>
          <br>
          흑미밥<br>재첩 맑은국<br>꽈리고추찜<br>아삭이 고추무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>재첩 70g 무 70g<br>꽈리고추 70g 밀가루 10g<br>아삭이고추 70g 양파 35g<br>배추김치 50g
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          흑미밥<br>된장국<br>나물무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>된장국(무) 70g<br>나물무침(고사리) 50g<br>배추김치 50g
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          흑미밥<br>미역국<br>나물비빔밥
        </td>
        <td>
          쌀 60g 흑미 20g<br>미역국(미역) 70g<br>나물비빔밥(시금치) 50g
        </td>
      </tr>
    </tbody>
  </table>
</div>
</div>



  <!-- 당뇨 콘텐츠 -->
  <div class="category-content" id="diabetes">
    <!-- 당뇨 식단 버튼 -->
    <div class="sub-buttons">
      <button class="tab-button active" data-tab="db-tab1">식단 1 🍴</button>
      <button class="tab-button" data-tab="db-tab2">식단 2 🍴</button>
      <button class="tab-button" data-tab="db-tab3">식단 3 🍴</button>
    </div>
    
    <!-- 당뇨 식단 내용1 -->
    <div class="tab-content active" id="db-tab1">
  <table class="meal-table">
    <!-- 제목 행 -->
    <thead>
      <tr>
        <th>메뉴</th>
        <th>영양 정보</th>
      </tr>
    </thead>
    <!-- 내용 행 -->
    <tbody>
      <!-- 아침 식단 -->
      <tr>
        <td>
          <strong>아침 식단 🌞</strong><br>
          <br>
          찹쌀밥<br>재첩 맑은국<br>꽈리고추찜<br>아삭이 고추무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>재첩 70g 무 70g<br>꽈리고추 70g 밀가루 10g<br>아삭이고추 70g 양파 35g<br>배추김치 50g
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          박밥<br>된장국<br>나물무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>된장국(무) 70g<br>나물무침(고사리) 50g<br>배추김치 50g
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          밥밥<br>미역국<br>나물비빔밥
        </td>
        <td>
          쌀 60g 흑미 20g<br>미역국(미역) 70g<br>나물비빔밥(시금치) 50g
        </td>
      </tr>
    </tbody>
  </table>
</div>

    <!-- 당뇨 식단 내용2 -->
    <div class="tab-content" id="db-tab2">
  <table class="meal-table">
    <!-- 제목 행 -->
    <thead>
      <tr>
        <th>메뉴</th>
        <th>영양 정보</th>
      </tr>
    </thead>
    <!-- 내용 행 -->
    <tbody>
      <!-- 아침 식단 -->
      <tr>
        <td>
          <strong>아침 식단 🌞</strong><br>
          <br>
          흑흑밥<br>재첩 맑은국<br>꽈리고추찜<br>아삭이 고추무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>재첩 70g 무 70g<br>꽈리고추 70g 밀가루 10g<br>아삭이고추 70g 양파 35g<br>배추김치 50g
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          흑미밥<br>된장국<br>나물무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>된장국(무) 70g<br>나물무침(고사리) 50g<br>배추김치 50g
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          흑미밥<br>미역국<br>나물비빔밥
        </td>
        <td>
          쌀 60g 흑미 20g<br>미역국(미역) 70g<br>나물비빔밥(시금치) 50g
        </td>
      </tr>
    </tbody>
  </table>
</div>

    <!-- 당뇨 식단 내용3 -->
    <div class="tab-content" id="db-tab3">
  <table class="meal-table">
    <!-- 제목 행 -->
    <thead>
      <tr>
        <th>메뉴</th>
        <th>영양 정보</th>
      </tr>
    </thead>
    <!-- 내용 행 -->
    <tbody>
      <!-- 아침 식단 -->
      <tr>
        <td>
          <strong>아침 식단 🌞</strong><br>
          <br>
          맛없밥<br>재첩 맑은국<br>꽈리고추찜<br>아삭이 고추무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>재첩 70g 무 70g<br>꽈리고추 70g 밀가루 10g<br>아삭이고추 70g 양파 35g<br>배추김치 50g
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          흑미밥<br>된장국<br>나물무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>된장국(무) 70g<br>나물무침(고사리) 50g<br>배추김치 50g
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          흑미밥<br>미역국<br>나물비빔밥
        </td>
        <td>
          쌀 60g 흑미 20g<br>미역국(미역) 70g<br>나물비빔밥(시금치) 50g
        </td>
      </tr>
    </tbody>
  </table>
</div>
</div>



  <!-- 비만 콘텐츠 -->
  <div class="category-content" id="obesity">
    <!-- 비만 식단 버튼 -->
    <div class="sub-buttons">
      <button class="tab-button active" data-tab="ob-tab1">식단 1 🍴</button>
      <button class="tab-button" data-tab="ob-tab2">식단 2 🍴</button>
      <button class="tab-button" data-tab="ob-tab3">식단 3 🍴</button>
    </div>
    
  <!-- 식단 내용1 -->
  <div class="tab-content active" id="ob-tab1">
  <table class="meal-table">
    <!-- 제목 행 -->
    <thead>
      <tr>
        <th>메뉴</th>
        <th>영양 정보</th>
      </tr>
    </thead>
    <!-- 내용 행 -->
    <tbody>
      <!-- 아침 식단 -->
      <tr>
        <td>
          <strong>아침 식단 🌞</strong><br>
          <br>
          인아~<br>재첩 맑은국<br>꽈리고추찜<br>아삭이 고추무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>재첩 70g 무 70g<br>꽈리고추 70g 밀가루 10g<br>아삭이고추 70g 양파 35g<br>배추김치 50g
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          흑미밥<br>된장국<br>나물무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>된장국(무) 70g<br>나물무침(고사리) 50g<br>배추김치 50g
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          흑미밥<br>미역국<br>나물비빔밥
        </td>
        <td>
          쌀 60g 흑미 20g<br>미역국(미역) 70g<br>나물비빔밥(시금치) 50g
        </td>
      </tr>
    </tbody>
  </table>
</div>


  <!-- 식단 내용2 -->
  <div class="tab-content" id="ob-tab2">
  <table class="meal-table">
    <!-- 제목 행 -->
    <thead>
      <tr>
        <th>메뉴</th>
        <th>영양 정보</th>
      </tr>
    </thead>
    <!-- 내용 행 -->
    <tbody>
      <!-- 아침 식단 -->
      <tr>
        <td>
          <strong>아침 식단 🌞</strong><br>
          <br>
          짜장밥<br>재첩 맑은국<br>꽈리고추찜<br>아삭이 고추무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>재첩 70g 무 70g<br>꽈리고추 70g 밀가루 10g<br>아삭이고추 70g 양파 35g<br>배추김치 50g
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          흑미밥<br>된장국<br>나물무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>된장국(무) 70g<br>나물무침(고사리) 50g<br>배추김치 50g
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          흑미밥<br>미역국<br>나물비빔밥
        </td>
        <td>
          쌀 60g 흑미 20g<br>미역국(미역) 70g<br>나물비빔밥(시금치) 50g
        </td>
      </tr>
    </tbody>
  </table>
</div>


  <!-- 식단 내용3 -->
  <div class="tab-content" id="ob-tab3">
  <table class="meal-table">
    <!-- 제목 행 -->
    <thead>
      <tr>
        <th>메뉴</th>
        <th>영양 정보</th>
      </tr>
    </thead>
    <!-- 내용 행 -->
    <tbody>
      <!-- 아침 식단 -->
      <tr>
        <td>
          <strong>아침 식단 🌞</strong><br>
          <br>
          잡채밥<br>재첩 맑은국<br>꽈리고추찜<br>아삭이 고추무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>재첩 70g 무 70g<br>꽈리고추 70g 밀가루 10g<br>아삭이고추 70g 양파 35g<br>배추김치 50g
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          흑미밥<br>된장국<br>나물무침<br>배추김치
        </td>
        <td>
          쌀 60g 흑미 20g<br>된장국(무) 70g<br>나물무침(고사리) 50g<br>배추김치 50g
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          흑미밥<br>미역국<br>나물비빔밥
        </td>
        <td>
          쌀 60g 흑미 20g<br>미역국(미역) 70g<br>나물비빔밥(시금치) 50g
        </td>
      </tr>
    </tbody>
  </table>
</div>
</div>

  </div> 


<!-- footer -->
<jsp:include page="/WEB-INF/include/footer_format.jsp" />

</body>
</html>