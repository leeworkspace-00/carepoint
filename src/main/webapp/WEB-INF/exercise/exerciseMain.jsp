<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 페이지</title>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
<link href="/resources/css/exercise/exercise.css" rel="stylesheet">
<script>

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var today = new Date().toISOString().split('T')[0]; // 오늘 날짜
    var exerciseForm = document.querySelector('.exercise-entry'); // 운동 시간 입력 폼
    var selectedDateInput = document.getElementById('selected-date'); // 선택한 날짜 input
    var hourInput = document.getElementById('hour'); // 운동 시간 input
    var minuteInput = document.getElementById('minute'); // 운동 분 input
    var successBtn = document.getElementById('success-btn'); // 성공 버튼

    // 저장된 이벤트를 로컬스토리지에서 불러오기
    var storedEvents = JSON.parse(localStorage.getItem('calendarEvents')) || [];

    // 마지막 클릭 날짜 로드
    var lastClickDate = localStorage.getItem('lastClickDate');

    // 오늘 날짜와 마지막 클릭 날짜가 동일하면 버튼 비활성화
    if (lastClickDate === today) {
        successBtn.disabled = true; // 버튼 비활성화
    }

    // 자정 체크를 위한 타이머 설정
    setInterval(function() {
        var currentDate = new Date().toISOString().split('T')[0];
        if (currentDate !== today) {
            // 날짜가 변경되었을 경우 초기화
            today = currentDate; // 오늘 날짜 업데이트
            successBtn.disabled = false; // 버튼 활성화

            // 자동으로 새로운 이벤트 생성
            var newEvent = {
                id: new Date().getTime().toString(), // 새로운 이벤트 ID
                resourceId: 'a', // 리소스 ID
                title: '자동 생성 미션', // 이벤트 제목
                start: today, // 오늘 날짜
                eventContent: {
                    html: `<div><img src="/resources/image/fail.png" class="event-icon" /></div>`,
                },
            };

            // 캘린더에 이벤트 추가
            calendar.addEvent(newEvent);
            storedEvents.push(newEvent);
            localStorage.setItem('calendarEvents', JSON.stringify(storedEvents)); // 로컬 저장소에 저장

            // 마지막 클릭 날짜 업데이트
            localStorage.setItem('lastClickDate', today);
        }
    }, 1000 * 60); // 매 1분마다 실행
   
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        /* events: [], // 초기 이벤트는 빈 배열로 시작 */
        dayMaxEvents: true,
        resources: [
            {
                id: 'a',
                title: 'Room A'
            }
        ],
        headerToolbar: 
            {
                left: 'prev',
                center: 'title', // 제목 설정
                right: 'next'
            },
        views: 
            {
                dayGridMonth: {
                titleFormat: { year: 'numeric', month: '2-digit' } // 객체 형태로 전달
                }                 
            },
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
        events: storedEvents, // 로컬 저장소에서 가져온 이벤트 사용
        eventContent: {
            html: `<div><img src="/resources/image/success.png" class="event-icon" /></div>`,
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

                    // 새로운 제목 요소 생성
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

                    // 기존 제목 삭제 및 새 제목 삽입
                    titleEl.innerHTML = ''; // 기존 텍스트 삭제
                    titleEl.appendChild(calendarTitle);
                }
            }, 0);
        }
    });
   
    // 캘린더 렌더링
    calendar.render();
   
    // 성공 버튼 클릭 시 동적으로 이벤트 추가
    document.getElementById('success-btn').addEventListener('click', function() {
        // 현재 날짜에 이벤트 추가
        var currentDate = new Date().toISOString().split('T')[0]; // 오늘 날짜
        var newEvent = {
            id: new Date().getTime().toString(), // 새로운 이벤트 ID (타임스탬프 사용)
            resourceId: 'a', // 리소스 ID (Room A)
            title: '미션완료', // 이벤트 제목
            start: currentDate, // 오늘 날짜
            eventContent: {
                html: `<div><img src="/resources/image/success.png" class="event-icon" /></div>`,
            }
        };
   
        // 캘린더에 이벤트 추가
        calendar.addEvent(newEvent);
     
        // 캘린더 전체로 포커스 이동
        setTimeout(() => {
            var calendarEl = document.getElementById('calendar'); // 캘린더의 DOM 요소 가져오기
            if (calendarEl) {
                calendarEl.scrollIntoView({ behavior: 'smooth', block: 'center' }); // 스크롤 이동
                calendarEl.focus(); // 포커스 설정 (선택사항)
            }
        }, 300);
   
        // 로컬 저장소에 이벤트 추가
        storedEvents.push(newEvent);
        localStorage.setItem('calendarEvents', JSON.stringify(storedEvents)); // 로컬 저장소에 저장
   
        // 마지막 클릭 날짜를 저장
        localStorage.setItem('lastClickDate', currentDate);
     
        alert("미션 success!");
   
        // 버튼 비활성화
        document.getElementById('success-btn').disabled = true;
    });
   
    //운동 시간 폼 제출 이벤트
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

</head>
<body>
  <!-- header -->
  <jsp:include page="/WEB-INF/include/header_format.jsp" />
  
  <button id="clear-btn" class="clear-btn">Clear Data</button>
  <script>
    document.getElementById('clear-btn').addEventListener('click', function() {
      // 로컬 저장소에서 이벤트와 마지막 클릭 날짜 삭제
      localStorage.removeItem('calendarEvents');
      localStorage.removeItem('lastClickDate');
    
      // 캘린더 새로고침
      location.reload(); // 페이지 새로고침으로 데이터 초기화
    });
  </script>
  
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
            <form name="success-frm">
            <p>산책 1시간 하기<button id="success-btn" class="success-btn">success</button></p>
            </form>
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
  <jsp:include page="/WEB-INF/include/footer_format.jsp" />
</body>
</html>