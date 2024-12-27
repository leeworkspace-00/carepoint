<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>식단기록표 상세내용</title>
<link href= "<%=request.getContextPath()%>/resources/css/food/foodDetail.css" type="text/css" rel="stylesheet">
</head>
<body>
  <!-- 모달 -->
  <div id="dietModal" class="modal">
    <div class="modal-content">
      <span class="close">&times;</span>
      <h2>12월 19일 식단 기록표</h2>
      
      <div class="meal-section">
		<div class="meal-time">
		  <img src="/resources/image/아침.png" alt="아침" class="icon">
		  <div class="meal-content">
		    <h3>아침식단</h3>
		    <p>
		    <span>빵</span>
		    <span>250kcal</span>
		    </p>
		    <hr>
		   
		    <p>
		    <span>우유</span>
		    <span>185kcal</span>
		    </p>
		    <hr>

		    <p>
		    <span>참치</span>
		    <span>15kcal</span>
		    </p>
		    <hr>		    

		    <p>
		    <span>인아</span>
		    <span>255kcal</span>
		    </p>
		    <hr>		    

		    <p>
		    <span>치명적</span>
		    <span>985kcal</span>
		    </p>
		    <hr>		    
		  </div>
		</div>
        
        <div class="meal-time">
          <img src="/resources/image/점심.png" alt="점심" class="icon">
 		  <div class="meal-content">
		    <h3>점심식단</h3>
		    <p>
		    <span>찹쌀밥</span>
		    <span>350kcal</span>
		    </p>
		    <hr>
		   
		    <p>
		    <span>미역국</span>
		    <span>185kcal</span>
		    </p>
		    <hr>

		    <p>
		    <span>오이무침</span>
		    <span>150kcal</span>
		    </p>
		    <hr>		    

		    <p>
		    <span>인아</span>
		    <span>255kcal</span>
		    </p>
		    <hr>		    

		    <p>
		    <span>치명적</span>
		    <span>985kcal</span>
		    </p>
		    <hr>		    
		  </div>
		</div>
        
        <div class="meal-time">
          <img src="/resources/image/저녁.png" alt="저녁" class="icon">
		  <div class="meal-content">
		    <h3>저녁식단</h3>
		    <p>
		    <span>샐러드</span>
		    <span>270kcal</span>
		    </p>
		    <hr>
		   
		    <p>
		    <span>귀리우유</span>
		    <span>100kcal</span>
		    </p>
		    <hr>

		    <p>
		    <span></span>
		    <span></span>
		    </p>
		    <hr>		    

		    <p>
		    <span></span>
		    <span></span>
		    </p>
		    <hr>		    

		    <p>
		    <span></span>
		    <span></span>
		    </p>
		    <hr>		    
		  </div>
		</div>
      
      <p class="total-calories">이 날 먹은 총 칼로리는 __________kcal 입니다.</p>
    </div>
  </div>
</div>  

</body>
</html>