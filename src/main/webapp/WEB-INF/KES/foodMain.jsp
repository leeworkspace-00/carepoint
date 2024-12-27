<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href= "<%=request.getContextPath()%>/resources/css/food/foodMain.css" type="text/css" rel="stylesheet">
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



  <!-- 숨겨진 박스 -->
  <div id="hiddenBox">
    <h2>식단 기록 입력</h2>
    <p>아침, 점심, 저녁 식단을 기록하세요.</p>
    <!-- 여기에 두 번째 이미지의 콘텐츠를 추가 -->
    <div>
      <p>아침 식단</p>
      <input type="text" placeholder="음식명 입력">
    </div>
    <div>
      <p>점심 식단</p>
      <input type="text" placeholder="음식명 입력">
    </div>
    <div>
      <p>저녁 식단</p>
      <input type="text" placeholder="음식명 입력">
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

  
</script>

</body>
</html>