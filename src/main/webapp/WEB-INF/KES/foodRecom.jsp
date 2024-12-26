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

document.addEventListener("DOMContentLoaded", () => {
	  const categoryButtons = document.querySelectorAll('.category-button');
	  const categoryContents = document.querySelectorAll('.category-content');

	  const activeTabs = {};

	  categoryButtons.forEach((button) => {
	    button.addEventListener('click', () => {
	      categoryButtons.forEach((btn) => btn.classList.remove('active'));
	      categoryContents.forEach((content) => content.classList.remove('active'));

	      button.classList.add('active');
	      const targetCategory = button.getAttribute('data-category');
	      const targetContent = document.getElementById(targetCategory);
	      targetContent.classList.add('active');

	      // 하위 탭 초기화
	      const defaultTab = targetContent.querySelector('.tab-button');
	      if (defaultTab) {
	        targetContent.querySelectorAll('.tab-button').forEach((btn) => btn.classList.remove('active'));
	        targetContent.querySelectorAll('.tab-content').forEach((content) => content.classList.remove('active'));

	        defaultTab.classList.add('active');
	        const defaultTabId = defaultTab.getAttribute('data-tab');
	        const defaultContent = targetContent.querySelector(`#${defaultTabId}`);
	        if (defaultContent) {
	          defaultContent.classList.add('active');
	        }
	        activeTabs[targetCategory] = defaultTabId;
	      }
	    });
	  });

	  categoryContents.forEach((categoryContent) => {
	    const tabButtons = categoryContent.querySelectorAll('.tab-button');
	    tabButtons.forEach((button) => {
	      button.addEventListener('click', () => {
	        const parentCategory = button.closest('.category-content');
	        parentCategory.querySelectorAll('.tab-button').forEach((btn) => btn.classList.remove('active'));
	        parentCategory.querySelectorAll('.tab-content').forEach((content) => content.classList.remove('active'));

	        button.classList.add('active');
	        const targetTab = button.getAttribute('data-tab');
	        const targetContent = parentCategory.querySelector(`#${targetTab}`);
	        if (targetContent) {
	          targetContent.classList.add('active');
	          const parentCategoryId = parentCategory.id;
	          activeTabs[parentCategoryId] = targetTab;
	        }
	      });
	    });
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
      <button class="tab-button active" data-tab="hb-tab1">식단1</button>
      <button class="tab-button" data-tab="hb-tab2">식단2</button>
      <button class="tab-button" data-tab="hb-tab3">식단3</button>
    </div>
    
  <!-- 식단 내용 -->
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