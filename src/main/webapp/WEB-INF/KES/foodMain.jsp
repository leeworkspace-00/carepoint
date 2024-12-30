<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href= "/resources/css/food/foodMain.css" type="text/css" rel="stylesheet">
</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/header_footer/header_format.jsp" />


<form class="search" name="frm" action="/LIA/freeBoardList.aws" method="get">
      <div class="search-container">
         <input type="text" name="keyword" onkeyup="showDropdown(this.value)" autocomplete="off" placeholder="칼로리가 궁금한 음식을 입력해보세요">
         <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
         <button type="button" class="btn">
            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
            </svg>
         </button>
      </div>
   </form>

<div class="results">
  <table>
    <thead>
      <tr>
        <th>음식명</th>
        <th>칼로리</th>
        <th>영양정보</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>쌀밥 100g</td>
        <td>143kcal</td>
        <td>지방: 0.48g | 탄수화물: 31.02g | 단백질: 2.72g</td>
      </tr>
    </tbody>
  </table>
</div>

<div class="diet-record">
  <h1>식단기록</h1>
  <button id="toggleButton">
    <img src="/resources/image/플러스.png" alt="식단 기록 열기/닫기" />
  </button>
</div>



  <!-- 기록하기 숨겨진 박스 -->
<div class="parent-container">  
  <form name="meal-frm" id="hiddenBox">
  	<div class="date-container">
  <input type="date" id="dateInput" class="hidden-date-picker" style="display: none;" />
	<button type="button" id="dateButton" class="image-button">
		<img src="/resources/image/클릭.png" alt="달력 버튼" />
    </button>
    </div>
    
    
<!-- 여기에 두 번째 이미지의 콘텐츠를 추가 -->
<div class="meal-container">
  <!-- 아침 식단 -->
  <div class="meal">
    <img src="/resources/image/아침.png" alt="아침 식단 아이콘" class="meal-icon">
    <div class="meal-content">
      <p>아침식단</p>
      <div class="input-group">
      <input type="text" placeholder="음식과 명칭 입력" class="meal-input">
      <input type="text" placeholder="칼로리 입력" class="calorie-input">
      </div>
    </div>  	    	
    <button type="button" class="add-button">
      <img src="/resources/image/플러스.png" alt="추가 버튼">
    </button>
  </div>  

  <!-- 점심 식단 -->
  <div class="meal">
    <img src="/resources/image/점심.png" alt="점심 식단 아이콘" class="meal-icon">
    <div class="meal-content">
      <p>점심식단</p>
      <div class="input-group">
      <input type="text" placeholder="음식과 명칭 입력" class="meal-input">
      <input type="text" placeholder="칼로리 입력" class="calorie-input">
      </div>
    </div>  	    	
    <button type="button" class="add-button">
      <img src="/resources/image/플러스.png" alt="추가 버튼">
    </button>  
  </div>

  <!-- 저녁 식단 -->
  <div class="meal">
    <img src="/resources/image/저녁.png" alt="저녁 식단 아이콘" class="meal-icon">
    <div class="meal-content">
      <p>저녁식단</p>
      <div class="input-group">
      <input type="text" placeholder="음식과 명칭 입력" class="meal-input">
      <input type="text" placeholder="칼로리 입력" class="calorie-input">
      </div> 
    </div>     	
    <button type="button" class="add-button">
      <img src="/resources/image/플러스.png" alt="추가 버튼">
    </button>
  </div>  
  
  <!-- 기록하기 버튼 -->
    <div class="record-button-container">
        <button type="submit" class="record-button">기록하기</button>
    </div>

    </div>
  </form>
</div>

<hr>

<!-- 식단 기록표 -->
<div class="diet-record-table">
  <h2>식단기록표</h2>
  <table>
    <thead>
      <tr>
        <th>날짜</th>
        <th>아침</th>
        <th>점심</th>
        <th>저녁</th>
      </tr>
    </thead>
    <tbody>
      <!-- 예시 데이터 -->
      <tr>
        <td>2023-12-05</td>
        <td><img src="/resources/image/긍정.png"></td>
        <td><img src="/resources/image/부정.png"></td>
        <td><img src="/resources/image/부정.png"></td>
      </tr>
      <tr>
        <td>2023-12-04</td>
        <td><img src="/resources/image/부정.png"></td>
        <td><img src="/resources/image/긍정.png"></td>
        <td><img src="/resources/image/부정.png"></td>
      </tr>
      <tr>
        <td>2023-12-03</td>
        <td><img src="/resources/image/미기록.png"></td>
        <td><img src="/resources/image/기록.png"></td>
        <td><img src="/resources/image/미기록.png"></td>
      </tr>
      <tr>
        <td>2023-12-02</td>
        <td><img src="/resources/image/부정.png"></td>
        <td><img src="/resources/image/긍정.png"></td>
        <td><img src="/resources/image/부정.png"></td>
      </tr>
      <tr>
        <td>2023-12-01</td>
        <td><img src="/resources/image/미기록.png"></td>
        <td><img src="/resources/image/기록.png"></td>
        <td><img src="/resources/image/미기록.png"></td>
      </tr>                  
    </tbody>
  </table>

  <!-- 페이지 네비게이션 -->
  <div class="pagination">
    <a href="#">&lt;</a>
    <a href="#">1</a>
    <a href="#">2</a>
    <a href="#">3</a>
    <a href="#">4</a>
    <a href="#">5</a>
    <a href="#">6</a>
    <a href="#">7</a>
    <a href="#">8</a>
    <a href="#">9</a>
    <a href="#">10</a>
    <a href="#">&gt;</a>
  </div>
</div>


<!-- footer -->
<jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />


<script>

  //검색창 숨겼다가 나타나는 스크립트 코드  
  const searchButton = document.querySelector('.search-container button');
  const resultsDiv = document.querySelector('.results');

  searchButton.addEventListener('click', () => {
    // 검색 버튼 클릭 시 결과 표시
    resultsDiv.style.display = 'block';
  });
  
  
  
  //식단 기록하기 스크립트 코드 
  const toggleButton = document.getElementById('toggleButton');
  const hiddenBox = document.getElementById('hiddenBox');
  const toggleImage = toggleButton.querySelector('img'); // 버튼 안의 이미지 요소 가져오기

  // 버튼 클릭 이벤트 추가
  toggleButton.addEventListener('click', () => {
    if (hiddenBox.style.display === 'none' || hiddenBox.style.display === '') {
      hiddenBox.style.display = 'block'; // 박스를 표시
      toggleImage.src = '/resources/image/마이너스.png'; // 닫기 이미지를 표시
    } else {
      hiddenBox.style.display = 'none'; // 박스를 숨김
      toggleImage.src = '/resources/image/플러스.png'; // 플러스 이미지를 표시
    }
  });
  
  
  // 달력숨겼다가 나타내기 스크립트 
  document.getElementById('dateButton').addEventListener('click', function () {
	    const dateInput = document.getElementById('dateInput');
	    
	    // 달력 입력 필드의 display 상태를 토글
	    if (dateInput.style.display === 'none') {
	        dateInput.style.display = 'block'; // 보이게 설정
	    } else {
	        dateInput.style.display = 'none'; // 숨기기 설정
	    }
	});
  
  
  
//플러스 버튼 클릭 이벤트 추가
  document.querySelectorAll('.add-button').forEach((button) => {
    button.addEventListener('click', function () {
      // 현재 버튼의 부모 요소에서 meal-content를 찾음
      const mealContent = this.previousElementSibling;

      // 현재 input-group의 개수를 확인
      const inputGroups = mealContent.querySelectorAll('.input-group');
      if (inputGroups.length >= 5) {
        alert('최대 5개의 항목만 추가할 수 있습니다.');
        return; // 더 이상 추가하지 않음
      }

      // 새로운 input-group 생성
      const newInputGroup = document.createElement('div');
      newInputGroup.classList.add('input-group'); // 클래스 추가

      // 음식명 입력 필드 생성
      const newMealInput = document.createElement('input');
      newMealInput.type = 'text';
      newMealInput.placeholder = '음식과 명칭 입력';
      newMealInput.classList.add('meal-input'); // 클래스 추가

      // 칼로리 입력 필드 생성
      const newCalorieInput = document.createElement('input');
      newCalorieInput.type = 'text';
      newCalorieInput.placeholder = '칼로리 입력';
      newCalorieInput.classList.add('calorie-input'); // 클래스 추가

      // 새로운 input-group에 추가
      newInputGroup.appendChild(newMealInput);
      newInputGroup.appendChild(newCalorieInput);

      // meal-content에 새로운 input-group 추가
      mealContent.appendChild(newInputGroup);
      
      // 새롭게 추가된 input-group에도 CSS 적용 확인 (디버깅용)
      console.log(newInputGroup);
    });
  });

  
</script>

</body>

</html>