<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 페이지</title>
<link href="/resources/css/exercise/exercise.css" rel="stylesheet">
</head>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            events: '/getExerciseRecords', // 서버에서 운동 기록 가져오기
            eventClick: function(info) {
                alert('운동 시간: ' + info.event.title);
            }
        });
        calendar.render();
    });
</script>


<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/header_footer/header_format.jsp" />
	
	<div class="top-service">
		<div class="left-service">
			<ul>
				<li class="profile-li-1">
			    	<img src="/resources/image/profile.png" alt="프로필 사진">
			    </li>
			    <li class="profile-li-2">
				    <p><span class="output-type">닉네임: </span><span>22na</span></p>
				    <p><span class="output-type">운동 레벨: </span><span>1kg 💪</span></p>
			    </li>
		    </ul>
		</div>
		
		<div class="right-service">
			<div class="mission">
				<h3>오늘의 미션!</h3>
				<p>산책 1시간 하기<button>success</button></p>
			</div>
			<div class="graph">
				<h3>오늘의 수치 기록하기</h3>
				<p>
					혈당 <input type="text" id="blood-sugar" name="blood-sugar" required> mg/dL
					<br>
					혈압 <input type="text" id="blood-press" name="blood-press" required> mmHg
					<br>
					몸무게 <input type="text" id="weight" name="weight" class="weight" required> kg
					<button>저장</button></p>
			</div>
		</div>
	</div>
	
	
	<div class="exercise-entry">
	    <form action="/saveExercise" method="POST">
	        <label for="exercise-time">총 운동 시간:</label>
	        <input type="time" id="exercise-time" name="exerciseTime" required>
	        <button type="submit">저장</button>
	    </form>
	</div>
	
	<!-- <div class="calendar">
	    <h2>오늘의 운동 시간</h2>
	    <div id="calendar"></div>
	</div> -->
	
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>