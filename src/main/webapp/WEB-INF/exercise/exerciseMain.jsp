<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 메세지 출력 -->
<c:set var="msg" value="${msg}" />
<c:if test="${!empty msg}">
    <script>alert('${msg}');</script>
</c:if>

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
    var isSuccessPressed = false; // success 버튼이 눌렸는지 여부를 나타내는 플래그
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
        isSuccessPressed = true; // 이미 눌렸다고 설정
    }

    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        height: '1250px', // 컨텐츠 크기에 따라 높이 자동 조정
        resources: [
            {
                id: 'a',
                title: 'Room A'
            }
        ],
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
        events: function(fetchInfo, successCallback, failureCallback) {
            // 서버에서 이벤트를 가져오기
            fetch('/exercise/calendar-events.aws', {
                method: 'GET'
            })
                .then(response => response.json())
                .then(serverEvents => {
                    // 서버 이벤트와 로컬 이벤트 병합
                    var mergedEvents = serverEvents.concat(storedEvents);
                    successCallback(mergedEvents); // 병합된 이벤트 전달
                })
                .catch(error => {
                    console.error('Error fetching events:', error);
                    failureCallback();
                });
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
        },
        eventContent: function(arg) {
        	console.log('Event Title:', arg.event.title); // title 확인
            console.log('Extended Props:', arg.event.extendedProps); // eventType 확인
        	// 이벤트에 따라 이미지를 다르게 표시
            if (arg.event.extendedProps.eventType === 'success') {
                return { html: `<div><img src="/resources/image/success.png" class="event-icon" /></div>` };
            } else if (arg.event.extendedProps.eventType === 'fail') {
                return { html: `<div><img src="/resources/image/fail.png" class="event-icon" /></div>` };
            } else if (arg.event.extendedProps.eventType === 'exercise') {
            	const safeTitle = arg.event.title.replace(/</g, '&lt;').replace(/>/g, '&gt;');
                return { html: "<div class='exercise-event'>" + safeTitle + "</div>" };
            }
        },
        
        dayMaxEvents: true
    });

    // 캘린더 렌더링
    calendar.render();
    
    // 자정 체크를 위한 타이머 설정
    setInterval(function() {
        var currentDate = new Date().toISOString().split('T')[0];
        if (currentDate !== today) {
            // 자정이 지났을 때
            if (!isSuccessPressed) {
                // success 버튼이 눌리지 않았다면 fail 이벤트 추가
                var failEvent = {
                    id: new Date().getTime().toString(), // 새로운 이벤트 ID
                    resourceId: 'a', // 리소스 ID
                    title: '미션 실패',
                    start: today,
                    extendedProps: {
                        eventType: 'fail' // 추가 속성으로 구분 가능
                    }
                };

                // 캘린더에 fail 이벤트 추가
                calendar.addEvent(failEvent);
                storedEvents.push(failEvent);
                localStorage.setItem('calendarEvents', JSON.stringify(storedEvents));
            }

            // 날짜 업데이트 및 버튼 활성화
            today = currentDate;
            successBtn.disabled = false;
            isSuccessPressed = false; // 플래그 초기화
        }
    }, 1000 * 60); // 매 1분마다 실행
   
    // 성공 버튼 클릭 시 동적으로 이벤트 추가
    document.getElementById('success-btn').addEventListener('click', function() {
    	// 현재 날짜에 이벤트 추가
        var currentDate = new Date().toISOString().split('T')[0];
        var successEvent = {
            id: new Date().getTime().toString(),
            resourceId: 'a',
            title: '미션 성공',
            start: currentDate,
            extendedProps: {
                eventType: 'success' // 추가 속성으로 구분 가능
            }
        };
   
        // 캘린더에 이벤트 추가
        calendar.addEvent(successEvent);
     
        // 캘린더 전체로 포커스 이동
        setTimeout(() => {
            var calendarEl = document.getElementById('calendar'); // 캘린더의 DOM 요소 가져오기
            if (calendarEl) {
                calendarEl.scrollIntoView({ behavior: 'smooth', block: 'center' }); // 스크롤 이동
                calendarEl.focus(); // 포커스 설정 (선택사항)
            }
        }, 300);
   
     	// 로컬 저장소에 이벤트 추가
        storedEvents.push(successEvent);
        localStorage.setItem('calendarEvents', JSON.stringify(storedEvents));
   
        // 마지막 클릭 날짜를 저장
        localStorage.setItem('lastClickDate', currentDate);
   
     	// 플래그 업데이트 및 버튼 비활성화
        isSuccessPressed = true;
        successBtn.disabled = true;
        
        alert("미션 success!");
    });
   
    exerciseForm.addEventListener('submit', function (event) {
        event.preventDefault(); // 기본 폼 제출 방지

        // 'select' 태그에서 값 가져오기
        var hour = hourInput.value;  // 선택된 시간
        var minute = minuteInput.value; // 선택된 분
        
        // 선택된 날짜 값 가져오기
        var selectedDateInput = document.getElementById('selected-date');
        var selectedDateValue = selectedDateInput.value; // 문자열 값
        console.log('Selected Date Value:', selectedDateValue);

        // 유효성 검사
        if (!hour || !minute) {
            alert('운동 시간을 올바르게 선택하세요.');
            return;
        }

        // 문자열을 Date 객체로 변환
        var selectedDate = new Date(selectedDateValue);

        // Date 객체에서 ISO 형식 문자열로 변환
        var isoDate = selectedDate.toISOString().split('T')[0]; // "2025-01-01"
        console.log('ISO Date:', isoDate);

        // 중복 이벤트 확인
        var existingEvents = calendar.getEvents();
        var isDuplicate = existingEvents.some((event) => 
            event.startStr === isoDate && event.extendedProps.eventType === 'exercise'
        );

        if (isDuplicate) {
            alert('이미 해당 날짜에 운동 이벤트가 추가되었습니다.');
            return;
        }

        // 서버로 운동 기록 저장 요청
        fetch('/exercise/saveExercise.aws', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                selectdate: isoDate,
                hour: hour,
                minute: minute,
            }),
        })
            .then((response) => response.json())
            .then((data) => {
                if (data.success) {
                    alert('운동 기록이 저장되었습니다!');

                    // 최신 이벤트 데이터 가져오기
                    fetch('/exercise/calendar-events.aws')
                        .then((response) => response.json())
                        .then((events) => {
                        	
                        	// 기존의 exercise 이벤트만 제거
                            calendar.getEvents().forEach(event => {
                                if (event.extendedProps?.eventType === 'exercise') {
                                    event.remove();
                                }
                            });
                        	
                         	// 새로운 이벤트 추가
                            events.forEach((event) => {
                                const isAlreadyAdded = calendar.getEvents().some((existingEvent) => 
                                    existingEvent.start === event.start && 
                                    existingEvent.title === event.title
                                );
                                if (!isAlreadyAdded) {
                                    calendar.addEvent(event); // 중복이 아닌 경우만 추가
                                }
                            });
                         	
                         	// 캘린더 전체로 포커스 이동
                            setTimeout(() => {
                                var calendarEl = document.getElementById('calendar'); // 캘린더의 DOM 요소 가져오기
                                if (calendarEl) {
                                    calendarEl.scrollIntoView({ behavior: 'smooth', block: 'center' }); // 스크롤 이동
                                    calendarEl.focus(); // 포커스 설정 (선택사항)
                                }
                            }, 300);
                         
                            calendar.render(); // 강제 렌더링
                        });
                } else {
                    alert('운동 기록 저장 실패!');
                }
            })
            .catch((error) => {
                console.error('운동 기록 저장 오류:', error);
            });
    });
});

</script>

<script>

function saveCheck() {

	// 유효성 검사하기
    let fm = document.forms["graph-frm"]; // 올바른 방식으로 폼 객체 가져오기

    // 입력 값 가져오기
    let bloodSugar = document.getElementById("blood_sugar").value;
    let bloodPress = document.getElementById("blood_press").value;
    let weight = document.getElementById("weight").value;
	
 	// 유효성 검사: 하나라도 입력되었는지 확인
    if (bloodSugar === "" && bloodPress === "" && weight === "") {
        alert("수치를 하나 이상 입력해주세요");
        document.getElementById("blood_sugar").focus(); // 첫 번째 입력 필드에 포커스
        return;
    }

    let ans = confirm("저장하시겠습니까?");

    if (ans === true) {
        let fm = document.forms["graph-frm"]; // 폼 객체 가져오기
        fm.action = "${pageContext.request.contextPath}/exercise/graphInsert.aws";
        fm.method = "post";
        fm.submit();
    }	  
	
	return;
}

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
            <p>관절 가동성을 높이기 위해 손목과 발목을 부드럽게 돌리기<button id="success-btn" class="success-btn">success</button></p>
            </form>
         </div>         
         <div class="graph">
         	<form name="graph-frm">
	            <h3>오늘의 수치 기록하기</h3>
	            <p>
	               혈당 <input type="text" id="blood_sugar" name="blood_sugar" required> mg/dL
	               <br>
	               혈압 <input type="text" id="blood_press" name="blood_press" required> mmHg
	               <br>
	               몸무게 <input type="text" id="weight" name="weight" class="weight" required> kg
	               <button type="button" class="save-button" onclick="saveCheck();">저장</button>
	            </p>
            </form>
         </div>
      </div>
   </div>
   <div class="exercise-entry" style="display: none; margin-top: 20px;">
       <form>
           <input type="hidden" id="selected-date" name="selectdate">
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