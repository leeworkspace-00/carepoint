<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<link href="/resources/css/exercise/exercise.css" rel="stylesheet">
</head>
<script>
	
document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');
    var exerciseForm = document.querySelector('.exercise-entry'); // 운동 시간 입력 폼
    var selectedDateInput = document.getElementById('selected-date'); // 선택한 날짜 input
    var hourInput = document.getElementById('hour'); // 운동 시간 input
    var minuteInput = document.getElementById('minute'); // 운동 분 input

    // FullCalendar 설정
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            left: 'prev',
            center: 'title', // 제목 설정
            right: 'next'
        },
        views: {
            dayGridMonth: {
                titleFormat: { year: 'numeric', month: '2-digit' } // 객체 형태로 전달
            }
        },
        /* events: '/getExerciseRecords', // 서버에서 운동 기록 가져오기 */
        dateClick: function(info) {
            // 날짜 클릭 이벤트
            exerciseForm.style.display = 'block';
            selectedDateInput.value = info.dateStr;
            
         	// 강제로 포커스 설정
            hourInput.blur(); // 포커스 해제
            setTimeout(() => {
                hourInput.focus(); // 강제로 다시 포커스 설정
            }, 0);
        },
        datesSet: function(info) {
            setTimeout(() => {
                var titleEl = document.querySelector('.fc-toolbar-title');
                if (titleEl) {
                    var existingTitle = titleEl.querySelector('.calendar-title');
                    if (existingTitle) {
                        existingTitle.remove(); // 기존 요소 제거
                    }

                    var parts = titleEl.innerText.split('/');
                    var month = parts[0] ? parts[0].trim() : 'Unknown Month';
                    var year = parts[1] ? parts[1].trim() : 'Unknown Year';

                    var calendarTitle = document.createElement('div');
                    calendarTitle.className = 'calendar-title';

                    var calendarYear = document.createElement('div');
                    calendarYear.className = 'calendar-year';
                    calendarYear.textContent = year; // 연도 삽입

                    var calendarMonth = document.createElement('div');
                    calendarMonth.className = 'calendar-month';
                    calendarMonth.textContent = month; // 월 삽입

                    calendarTitle.appendChild(calendarYear);
                    calendarTitle.appendChild(calendarMonth);
                    titleEl.innerHTML = ''; // 기존 텍스트 삭제
                    titleEl.appendChild(calendarTitle);
                }
            }, 0);
        }
    });

    // 캘린더 렌더링
    calendar.render();

    // 운동 시간 폼 제출 이벤트
    exerciseForm.addEventListener('submit', function (event) {
        event.preventDefault(); // 기본 폼 제출 방지

        // 입력된 값 가져오기
        var selectedDate = selectedDateInput.value;
        var hour = hourInput.value;
        var minute = minuteInput.value;

        // 서버로 운동 기록 저장 요청
        fetch('/saveExercise', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                date: selectedDate,
                hour: hour,
                minute: minute,
            }),
        })
            .then((response) => response.json())
            .then((data) => {
                if (data.success) {
                    // 저장된 운동 시간을 캘린더에 표시
                    calendar.addEvent({
                        title: `${hour}시간 ${minute}분 운동`,
                        start: selectedDate,
                    });
                    exerciseForm.style.display = 'none'; // 폼 숨기기
                } else {
                    alert('운동 기록 저장 실패!');
                }
            })
            .catch((error) => {
                console.error('Error:', error);
                alert('운동 기록 저장 중 오류 발생!');
            });
    });
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
	
	<div class="exercise-entry" style="display: none; margin-top: 20px;">
	    <form>
	        <input type="hidden" id="selected-date" name="selected-date">
	        <label for="exercise-time">총 운동 시간 :</label>
	        <select id="hour" name="hour">
	            <option value="00" selected>0시간</option>
	            <option value="01">1시간</option>
	            <option value="02">2시간</option>
	            <option value="03">3시간</option>
	            <option value="04">4시간</option>
	            <option value="05">5시간</option>
	        </select> :
	        <select id="minute" name="minute">
	            <option value="00" selected>0분</option>
	            <option value="15">15분</option>
	            <option value="30">30분</option>
	            <option value="45">45분</option>
	        </select>
	        <button type="submit">저장</button>
	    </form>
	</div>
	
	<div class="calendar" id="calendar"></div>
	
	
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>