<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 메세지 출력 -->
<c:set var="msg" value="${requestScope.msg}" />
<c:if test="${!empty msg}">
    <script>alert('${msg}');</script>
</c:if> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href= "${pageContext.request.contextPath}/resources/css/food/foodMain.css" type="text/css" rel="stylesheet">
</head>
<body>


<!-- header -->
<jsp:include page="/WEB-INF/include/header_format.jsp" />


<form class="search" id="searchForm" >
      <div class="search-container">
         <input type="text" name="foodName" id="foodNameInput" autocomplete="off" placeholder="칼로리가 궁금한 음식을 입력해보세요">
         <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
         <button type="button" id="searchButton" class="btn">
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
        <tbody id="resultsTableBody">

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
  <form name="meal-frm" id="hiddenBox" action="/food/foodWriteAction.aws" method="post">
  
  
  	<div class="date-container">
  <input type="date" id="dateInput" name="selectdate" class="hidden-date-picker" style="display: none;" />
	<button type="button" id="dateButton" class="image-button">
		<img src="/resources/image/클릭.png" alt="달력 버튼" />
    </button>
    </div>
    
    
<!-- 식단 입력 영역 -->
<div class="meal-container">

  <!-- 아침 식단 -->
  <div class="meal">
    <img src="/resources/image/아침.png" alt="아침 식단 아이콘" class="meal-icon">
    <div class="meal-content">
      <p>아침식단</p>
      <div class="input-group">
	      <input type="hidden" name="foodtype" value="B"> <!-- 아침 식단 -->
	      <input type="text" name="menu_B[]" placeholder="음식과 명칭 입력" class="meal-input"><!-- 메뉴를 배열로 저장 -->
	      <input type="number" name="kcal_B[]" placeholder="칼로리 입력" class="calorie-input"> <!-- 칼로리를 배열로 저장 -->
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
	      <input type="hidden" name="foodtype" value="L"> <!-- 점심 식단 -->
	      <input type="text" name="menu_L[]" placeholder="음식과 명칭 입력" class="meal-input">
	      <input type="number" name="kcal_L[]" placeholder="칼로리 입력" class="calorie-input">
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
	      <input type="hidden" name="foodtype" value="D"> <!-- 저녁 식단 -->
	      <input type="text" name="menu_D[]" placeholder="음식과 명칭 입력" class="meal-input">
	      <input type="number" name="kcal_D[]" placeholder="칼로리 입력" class="calorie-input">
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
    <colgroup>
      <col width="25%">
      <col width="25%">
      <col width="25%">
      <col width="25%">  <!-- 칸 크기 정하는거 -->
    </colgroup>
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
        <td><a href="<%=request.getContextPath()%>/KES/foodDetail.aws" id="modal"><img src="/resources/image/긍정.png"></a></td>
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
<jsp:include page="/WEB-INF/include/footer_format.jsp" />

<script>

//'searchButton' 요소에 'click' 이벤트 리스너를 추가
document.getElementById('searchButton').addEventListener('click', function () {
    // 사용자가 입력한 음식 이름을 가져와 공백을 제거한 값을 변수에 저장
    const foodName = document.getElementById('foodNameInput').value.trim();

    // 음식 이름이 비어 있으면 경고 메시지를 표시하고 함수 종료
    if (!foodName) {
        alert("음식 이름을 입력하세요!");
        return;
    }

    // 음식 이름을 URL에 사용할 수 있도록 인코딩
    const encodedFoodName = encodeURIComponent(foodName);
    
    // 서버에 GET 요청을 보내 음식 정보를 검색
    fetch('/food/foodMainAction.aws?foodName=' + encodedFoodName)
        .then(response => {
            // 서버 응답이 성공적인지 확인 (HTTP 상태 코드 확인)
            if (!response.ok) {
                // 응답이 실패하면 에러를 던짐
                throw new Error("네트워크 응답에 문제가 있습니다.");
            }
            // 응답 데이터를 JSON 형식으로 변환하여 반환
            return response.json();
        })
        .then(data => {
            // 검색 결과를 표시할 테이블의 tbody 요소를 가져옴
            const resultsTableBody = document.getElementById('resultsTableBody');
            
            // 기존 검색 결과를 초기화 (테이블 내용을 비움)
            resultsTableBody.innerHTML = "";

            // 서버에서 받은 데이터가 존재하고, 데이터 길이가 0보다 큰 경우
            if (data && data.length > 0) {
                // 데이터 배열을 반복하면서 각 항목을 테이블 행으로 추가
                data.forEach(item => {
                    const row = document.createElement('tr'); // 새로운 행 생성
					
					// 행의 HTML 내용을 설정 (음식 이름, 칼로리, 영양 성분 정보 포함)
                    row.innerHTML = 
                        "<td>" + item.menuName + "</td>" + // 음식 이름
                        "<td>" + item.calorie + "kcal" + "</td>" + // 칼로리
                        "<td>단백질: " + item.protein + "g, " + // 단백질
                        "지방: " + item.fat + "g, " + // 지방
                        "탄수화물: " + item.carb + "g" + "</td>"; // 탄수화물
                    
                    // 완성된 행을 테이블 tbody에 추가
                    resultsTableBody.appendChild(row);
                });
            } else {
                // 데이터가 없으면 검색 결과가 없다는 알림을 표시
                alert("검색 결과가 없습니다.");
            }
        })
        .catch(error => {
            // 네트워크 요청 중 에러가 발생한 경우 콘솔에 에러 메시지 출력
            console.error("에러 발생:", error);
        });
});






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



document.querySelectorAll('.add-button').forEach((button) => {
	  button.addEventListener('click', function () {
	    // 현재 버튼의 부모 요소에서 meal-content를 찾음
	    const mealContent = this.previousElementSibling;

	    // 현재 식단 유형(B, L, D)을 가져옴
	    const foodType = mealContent.querySelector('input[name="foodtype"]').value;

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
	    newMealInput.name = 'menu_' + foodType + '[]'; // 식단 유형에 따라 name 설정 (menu_B[], menu_L[], menu_D[])
	    newMealInput.placeholder = '음식과 명칭 입력';
	    newMealInput.classList.add('meal-input'); // 클래스 추가

	    // 칼로리 입력 필드 생성
	    const newCalorieInput = document.createElement('input');
	    newCalorieInput.type = 'number';
	    newCalorieInput.name = 'kcal_' + foodType + '[]'; // 식단 유형에 따라 name 설정 (kcal_B[], kcal_L[], kcal_D[])
	    newCalorieInput.placeholder = '칼로리 입력';
	    newCalorieInput.classList.add('calorie-input'); // 클래스 추가

	    // 새로운 input-group에 추가
	    newInputGroup.appendChild(newMealInput);
	    newInputGroup.appendChild(newCalorieInput);

	    // meal-content에 새로운 input-group 추가
	    mealContent.appendChild(newInputGroup);

	    // 디버깅용 콘솔 출력
	    console.log(`새로운 입력 그룹 추가됨: ${newMealInput.name}, ${newCalorieInput.name}`);
	  });
	});

</script>

<!-- 부트스트랩 모달 코드 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous">

  document.getElementById('modal').addEventListener('click', function() {
      fetch('/food/foodDetail.aws')
          .then(response => response.text())
          .then(data => {
              document.querySelector('#dietModal .modal-content').innerHTML = data;
              var loginModal = new bootstrap.Modal(document.getElementById('modal'), {
                  backdrop: 'static',
                  keyboard: false
              });
              loginModal.show();
          })
          .catch(error => console.error(error));
  });

</script>





</body>
</html>