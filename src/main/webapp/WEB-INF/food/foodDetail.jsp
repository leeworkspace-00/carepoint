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
      <button type="button" class="close" onclick="history.back();">&times;</button>
      <h2>12월 19일 식단 기록표</h2>
      <div class="meal-section">
		<div class="meal-time">
		  <div class="morning-img">
		  	<img src="/resources/image/아침.png" alt="아침" class="icon">
		  </div>
		  <div class="meal-content">
		    <ul class="morning">
		    	<li><h3>아침식단</h3></li>
			    <li class="morning-menu">빵<span>250kcal</span></li>
			    
			    <li class="morning-menu">우유<span>185kcal</span></li>
			    
			    <li class="morning-menu">참치<span>15kcal</span></li>
			    
			    <li class="morning-menu">인아<span>255kcal</span></li>
			    
			    <li class="morning-menu">치명적<span>985kcal</span></li>
		    </ul>		    
		  </div>
		    <!-- 삭제 버튼 추가 -->
		    <div class="delete-btn">
  				<a href="#" class="delete-button" onclick="deleteMeal();">X</a>
			</div>
		</div>
        
        <div class="meal-time">
		  <div class="morning-img">
		  	<img src="/resources/image/점심.png" alt="점심" class="icon">
		  </div>
		  <div class="meal-content">
		    <ul class="morning">
		    	<li><h3>아침식단</h3></li>
			    <li class="morning-menu">빵<span>250kcal</span></li>
			    
			    <li class="morning-menu">우유<span>185kcal</span></li>
			    
			    <li class="morning-menu">참치<span>15kcal</span></li>
			    
			    <li class="morning-menu">인아<span>255kcal</span></li>
			    
			    <li class="morning-menu">치명적<span>985kcal</span></li>
		    </ul>		    
		  </div>
		    <!-- 삭제 버튼 추가 -->
		    <div class="delete-btn">
  				<a href="#" class="delete-button" onclick="deleteMeal();">X</a>
			</div>
		</div>
		
		<div class="meal-time">
		  <div class="morning-img">
		  	<img src="/resources/image/저녁.png" alt="저녁" class="icon">
		  </div>
		  <div class="meal-content">
		    <ul class="morning">
		    	<li><h3>아침식단</h3></li>
			    <li class="morning-menu">빵<span>250kcal</span></li>
			    
			    <li class="morning-menu">우유<span>185kcal</span></li>
			    
			    <li class="morning-menu">참치<span>15kcal</span></li>
			    
			    <li class="morning-menu">인아<span>255kcal</span></li>
			    
			    <li class="morning-menu">치명적<span>985kcal</span></li>
		    </ul>		    
		  </div>
		    <!-- 삭제 버튼 추가 -->
		    <div class="delete-btn">
  				<a href="#" class="delete-button" onclick="deleteMeal();">X</a>
			</div>
		</div>
        
      <p class="total-calories">이 날 먹은 총 칼로리는 __________kcal 입니다.</p>
    </div>
  </div>
</div>  

</body>

</html>