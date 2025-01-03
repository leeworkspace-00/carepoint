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
          귀리밥<br>미역국<br>브로콜리 두부무침<br>나박김치<br>배추김치
        </td>
        <td>
          귀리 40g 쌀 40g<br>브로콜리 70g 두부 50g 참기름 5g<br>미역 10g 두부 30g 국간장(저염) 5ml<br>배추 50g 무 30g
          <br>
          <br>⭐ 귀리는 혈압을 낮추는 데 도움을 주는 베타글루칸이 풍부하며, 미역과 브로콜리는 칼륨과 마그네슘을 제공해 나트륨 배출을 돕습니다.
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          현미밥<br>된장찌개 (저염)<br>고등어구이<br>오이무침
        </td>
        <td>
          현미 80g<br>된장(저염) 10g 애호박 50g 두부 30g 표고버섯 20g<br>고등어 70g<br>오이 70g 고춧가루 2g 참기름 3g
        <br>
        <br>⭐ 된장은 칼륨 함량이 높아 나트륨 배출을 돕고, 고등어의 오메가-3 지방산은 심혈관 건강에 유익합니다. 
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          보리밥<br>가지볶음<br>닭가슴살 샐러드 (올리브오일 드레싱)
        </td>
        <td>
          보리쌀 80g 쌀 20g<br>가지 70g 올리브오일 5ml<br>닭가슴살 70g 로메인 50g 방울토마토 30g
          <br>
          <br>⭐ 보리는 섬유질과 칼륨 함량이 높아 혈압 안정에 도움을 주며, 저염식 가지볶음과 샐러드는 나트륨 섭취를 제한합니다.
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
          귀리죽<br>삶은 달걀과 토마토 샐러드<br>두부와 부추전<br>미역나물밥
        </td>
        <td>
          귀리 50g 우유 100ml<br>달걀 50g 토마토 100g 발사믹 드레싱 5ml<br>두부 70g 부추 50g 밀가루 10g<br>미역 30g 현미 50g 참기름 3ml
          <br>
          <br>⭐ 귀리와 미역은 칼륨이 풍부해 나트륨 배출을 돕고, 두부와 부추는 혈관 건강을 강화하며 혈압 완화에 도움을 줍니다.
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          오트밀 리조또<br>고등어구이와 쌈채소<br>감자조림과 콩나물국<br>영양밥과 나물무침
        </td>
        <td>
          오트밀 60g 닭가슴살 50g 버섯 30g<br>고등어 70g 상추 50g<br>감자 100g 간장 5ml 콩나물 80g<br>잡곡 50g 고사리 50g
          <br>
          <br>⭐ 오트밀과 잡곡밥은 섬유질이 풍부해 혈압을 안정시키고, 고등어의 오메가-3 지방산은 심혈관 건강을 개선합니다.
          
        
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          닭가슴살 샐러드와 호두 드레싱<br>단호박찜과 가지볶음<br>오이냉국과 두부구이<br>브로콜리 스프
        </td>
        <td>
         닭가슴살 60g 채소 100g 호두 10g<br>단호박 80g 가지 50g 마늘 2g<br>오이 50g 두부 80g 국간장 3ml<br>브로콜리 100g 우유 100ml
          <br>
          <br>⭐ 닭가슴살과 호두는 단백질과 건강한 지방을 제공하며, 가지와 브로콜리는 항산화 성분으로 혈압 조절에 효과적입니다.
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
          현미밥<br>들깨 미역국<br>오이무침<br>삶은 달걀과 아보카도 샐러드<br>토마토 오트밀죽
        </td>
        <td>
          현미 80g<br>들깨가루 10g 미역 5g 물 200ml<br>오이 50g 간장 3ml 참깨 2g<br>달걀 50g 아보카도 50g 레몬즙 5ml<br>오트밀 50g 토마토 100g
          <br>
          <br>⭐ 현미와 미역은 칼륨이 풍부해 나트륨 배출을 돕고, 들깨와 오트밀은 혈압을 낮추는 데 도움을 줍니다. 
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          보리밥<br>저염 된장국<br>나물 무침<br>훈제 고등어와 구운 채소<br>병아리콩 샐러드
        </td>
        <td>
          보리 50g 고사리 50g<br>된장 5g 두부 30g 애호박 50g<br>나물무침(고사리) 50g<br>고등어 70g 채소 100g<br>병아리콩 50g 채소 80g
          <br>
          <br>⭐ 보리와 병아리콩은 혈압 안정에 좋으며, 고등어의 오메가-3는 심혈관 건강을 지원합니다.
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          현미 야채볶음밥<br>닭가슴살과 브로콜리 스팀<br>토마토 가지구이<br>찐 단호박과 두부구이
        </td>
        <td>
          현미 80g 채소 100g<br>닭가슴살 80g 브로콜리 100g<br>토마토 100g 가지 70g<br>단호박 80g 두부 60g
          <br>
          <br>⭐ 브로콜리와 토마토는 항산화 효과가 있고, 단호박은 섬유질이 풍부해 혈압 조절에 도움을 줍니다.
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
          통밀 토스트와 아보카도<br>삶은 달걀과 아몬드<br>블루베리 요거트<br>현미죽<br>배추김치
        </td>
        <td>
          통밀빵 40g 아보카도 30g<br>달걀 50g 아몬드 10g<br>플레인 요거트 100g 블루베리 50g<br>현미 50g<br>배추김치 30g
          <br>
          <br>⭐ 통밀과 현미는 혈당 지수가 낮아 혈당 급등을 억제하며, 블루베리와 요거트의 항산화 성분은 대사 건강에 이롭습니다.
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          두부덮밥<br>훈제연어와 아스파라거스 볶음<br>병아리콩 카레와 고구마<br>배추김치
        </td>
        <td>
          현미밥 100g 두부 70g 채소 50g<br>연어 60g 아스파라거스 50g<br>병아리콩 50g 고구마 60g 카레가루 5g<br>배추김치 50g
          <br>
          <br>⭐ 두부와 병아리콩은 단백질과 섬유질을 제공해 혈당을 안정화하며, 연어는 오메가-3 지방산으로 염증을 완화합니다.
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          찜닭과 채소볶음<br>훈제 오리고기 샐러드<br>브로콜리 크림수프<br>채소구이와 스테이크
        </td>
        <td>
          닭 80g 감자 50g 채소 50g<br>오리고기 60g 채소 100g<br>브로콜리 100g 우유 100ml<br>채소 80g 소고기 70g
          <br>
          <br>⭐ 닭고기와 채소는 혈당 지수가 낮아 저녁 식사로 적합하며, 브로콜리와 감자는 비타민과 미네랄을 보충합니다.
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
          귀리죽과 견과류<br>삶은 계란과 아보카도 토스트<br>블루베리와 요거트 스무디<br>찐 고구마<br>배추김치
        </td>
        <td>
          귀리 50g 아몬드 10g<br>계란 50g 아보카도 30g 통밀빵 40g<br>블루베리 50g 플레인 요거트 100ml<br>고구마 80g<br>배추김치 30g
          <br>
          <br>⭐ 귀리와 통밀은 혈당 지수가 낮고, 블루베리는 항산화 효과로 대사 건강을 개선합니다. 
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          두부덮밥<br>현미 샐러드 볼<br>훈제연어와 아스파라거스 볶음<br>저염 치킨 스테이크
        </td>
        <td>
          두부 70g 현미 50g 채소 50g<br>현미 50g 채소 80g 병아리콩 30g<br>연어 70g 아스파라거스 50g<br>닭가슴살 80g 고구마 50g
          <br>
          <br>⭐ 연어와 두부는 단백질과 오메가-3를 공급해 혈당 조절에 유익합니다.
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          브로콜리 크림수프<br>토마토구이와 닭고기 조림<br>렌틸콩 스튜<br>훈제 오리고기 샐러드
        </td>
        <td>
          브로콜리 100g 우유 100ml<br>닭 80g 토마토 50g<br>렌틸콩 50g 채소 70g<br>오리고기 60g 채소 80g
          <br>
          <br>⭐ 렌틸콩과 브로콜리는 섬유질이 풍부하며, 닭고기와 오리고기는 저탄수화물 단백질을 제공합니다.
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
          현미밥<br>김구이<br>통밀 크래커와 연어 스프레드<br>삶은 달걀과 오이 슬라이스<br>치아씨드 푸딩
        </td>
        <td>
          현미 80g<br>김구이 10g<br>통밀 크래커 50g 훈제 연어 30g 크림치즈 10g<br>달걀 50g 오이 70g<br>치아씨드 30g 저지방 우유 100ml 블루베리 50g
          <br>
          <br>⭐ 치아씨드와 통밀은 혈당 지수가 낮아 혈당을 안정화하며, 블루베리와 연어는 항산화 및 오메가-3로 대사 건강을 지원합니다.
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          곤약밥과 닭가슴살 볶음<br>퀴노아 렌틸콩 샐러드<br>훈제 연어와 아스파라거스 볶음<br>병아리콩 카레
        </td>
        <td>
          곤약밥 50g 닭가슴살 70g 채소 80g<br>퀴노아 50g 렌틸콩 30g 채소 100g<br>연어 70g 아스파라거스 50g<br>병아리콩 50g 카레가루 5g 채소 100g
          <br>
          <br>⭐ 곤약밥과 병아리콩은 혈당 지수가 낮고 포만감을 제공하며, 렌틸콩과 아스파라거스는 섬유질과 미네랄로 혈당 조절을 돕습니다.
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          채소 수프와 닭가슴살구이<br>찐 단호박과 고등어구이<br>브로콜리와 렌틸콩 볶음<br>두부구이와 구운 토마토
        </td>
        <td>
          채소 100g 닭가슴살 80g<br>단호박 70g 고등어 60g<br>브로콜리 70g 렌틸콩 50g<br>두부 70g 토마토 50g
          <br>
          <br>⭐ 채소와 단호박은 저당질 식품이며, 고등어와 두부는 단백질과 오메가-3를 제공하여 저녁 혈당 관리에 유익합니다.
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
          퀴노아 샐러드<br>코티지 치즈와 사과<br>오트밀과 바나나 슬라이스<br>삶은 달걀과 그린 스무디
        </td>
        <td>
          퀴노아 50g 채소 80g 레몬즙 5ml<br>코티지 치즈 50g 사과 100g<br>오트밀 50g 바나나 50g<br>달걀 50g 시금치 50g 바나나 30g
          <br>
          <br>⭐ 퀴노아와 코티지 치즈는 저지방 고단백으로 포만감을 제공하며, 오트밀은 섬유질이 많아 체중 조절에 유익합니다.
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          곤약국수와 닭가슴살<br>단호박 샐러드와 구운 고구마<br>그릴드 연어와 채소구이
        </td>
        <td>
          곤약 50g 닭가슴살 70g<br>단호박 50g 고구마 60g<br>연어 70g 채소 80g
          <br>
          <br>⭐ 곤약과 단호박은 칼로리가 낮고 포만감을 줘 체중 감량에 도움을 주며, 연어는 건강한 지방과 단백질을 제공합니다.
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          두부 스테이크와 가지볶음<br>훈제 치킨과 브로콜리 스팀<br>렌틸콩 샐러드와 올리브
        </td>
        <td>
          두부 80g 가지 50g<br>치킨 70g 브로콜리 50g<br>렌틸콩 50g 올리브 10g
          <br>
          <br>⭐ 두부와 브로콜리는 저칼로리 고영양 식품이며, 렌틸콩과 고구마는 에너지를 보충하면서도 지방 축적을 억제합니다.
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
          고구마와 삶은 달걀<br>오트밀과 블루베리<br>그릭 요거트와 견과류<br>토마토와 아보카도 샐러드
        </td>
        <td>
          고구마 70g 삶은 달걀 50g<br>오트밀 50g 블루베리 30g<br>그릭 요거트 100g 아몬드 10g<br>토마토 80g 아보카도 50g
          <br>
          <br>⭐ 삶은 달걀은 단백질을 제공해 근육 유지와 포만감을 돕고, 오트밀은 섬유질이 풍부해 소화를 촉진합니다. 아보카도는 건강한 지방으로 체지방 감량에 유익합니다.
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          현미밥<br>닭가슴살 샐러드<br>퀴노아와 연어구이
        </td>
        <td>
          현미밥 100g<br>닭가슴살 70g 채소류<br>퀴노아 50g 연어구이 70g
          <br>
          <br>⭐ 닭가슴살과 연어는 고단백 식품으로 근육 유지와 체중 감량에 도움을 주며, 퀴노아는 완전 단백질로 필수 아미노산을 제공합니다.
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          두부 샐러드<br>훈제 치킨과 브로콜리 찜<br>렌틸콩과 고구마 찜
        </td>
        <td>
          두부 80g 채소류<br>훈제 치킨 70g 브로콜리 80g<br>렌틸콩 50g 고구마 80g
          <br>
          <br>⭐ 두부와 렌틸콩은 식물성 단백질의 훌륭한 공급원이며, 브로콜리는 섬유질과 항산화 성분이 풍부합니다.
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
          바나나 오트밀 죽<br>삶은 계란과 당근 스틱<br>통곡물 빵과 코티지 치즈<br>사과와 땅콩버터 디핑
        </td>
        <td>
          오트밀 50g 바나나 슬라이스 50g<br>삶은 계란 50g 당근 스틱 50g<br>통곡물 빵 40g 코티지 치즈 50g<br>사과 슬라이스 100g 땅콩버터 10g
          <br>
          <br>⭐ 삶은 계란과 코티지 치즈는 단백질을 제공하며, 오트밀은 복합 탄수화물로 에너지를 오래 유지시킵니다. 땅콩버터는 건강한 지방을 포함해 포만감을 높여줍니다.
        </td>
      </tr>

      <!-- 점심 식단 -->
      <tr>
        <td>
          <strong>점심 식단 🌤️</strong><br>
          <br>
          현미밥<br>생선구이<br>찐 감자와 닭가슴살 스테이크<br>단호박 샐러드와 삶은 달걀
        </td>
        <td>
          현미밥(100g)<br>생선구이(70g)<br>찐 감자(80g) 닭가슴살 스테이크(70g)<br>단호박(80g) 삶은 달걀(50g)
          <br>
          <br>⭐ 생선구이는 오메가-3 지방산과 단백질을 제공하며 닭가슴살은 고단백 저지방 식품입니다. 단호박은 비타민 A를 포함해 균형 잡힌 영양소를 제공합니다.
        </td>
      </tr>

      <!-- 저녁 식단 -->
      <tr>
        <td>
          <strong>저녁 식단 🌙</strong><br>
          <br>
          두부 가지볶음<br>코티지 치즈와 구운 채소 플래터<br>렌틸콩 샐러드와 방울토마토<br>통곡물 크래커와 무가당 요거트 딥
        </td>
        <td>
          두부 80g 가지 50g<br>코티지 치즈 70g 구운 채소류<br>렌틸콩 60g 방울토마토 40g<br>통곡물 크래커 30g 무가당 요거트 딥 50ml
          <br>
          <br>⭐ 두부와 렌틸콩은 소화를 돕는 식물성 단백질을 포함하며, 코티지 치즈는 저녁에도 부담 없는 단백질 공급원입니다. 방울토마토는 항산화 성분으로 건강에 도움을 줍니다.
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