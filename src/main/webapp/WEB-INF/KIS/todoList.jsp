<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoList</title>
<link href="<%= request.getContextPath() %>/resources/css/todo/todo.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Patrick+Hand&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const calendarEl = document.getElementById('calendar');
        const modalDate = document.getElementById('modal-date'); // 모달 제목
        const modalEvents = document.getElementById('modal-events'); // 모달 이벤트 목록
        const modalBg = document.getElementById('modal-bg'); // 모달 배경
        const addEventForm = document.getElementById('add-event-form'); // 일정 추가 폼
        const eventForm = document.getElementById('event-form'); // 폼 요소
        const eventTitleInput = document.getElementById('event-title'); // 일정 제목 입력 필드
        const eventDateInput = document.getElementById('event-date'); // 일정 날짜 입력 필드

        const calendar = new FullCalendar.Calendar(calendarEl, {
            dayMaxEventRows: true, // 한 칸에서 최대 이벤트 줄 수 제한
            eventMaxStack: true, // 일별 최대 스택 이벤트 수
            selectable: true,
            headerToolbar: {
                left: 'prev addEventButton',
                center: 'title',
                right: 'today next'
            },
            customButtons: {
                addEventButton: {
                    text: "일정 추가",
                    click: function() {
                    	 // 일정 추가 폼 표시
                        addEventForm.style.display = 'block';
                    }
                }
            },
            views: {
                dayGridMonth: {
                    titleFormat: {
                        year: 'numeric',
                        month: 'short'
                    }
                }
            },
            events: [
                { title: '운동가기', start: '2024-12-27'},
                { title: '병원갔다 오기', start: '2024-12-27'},
                { title: '약먹기', start: '2024-12-27'},
                { title: '장보기', start: '2024-12-27'},
                { title: '집안일 하기', start: '2024-12-27'},
                { title: '과제하기', start: '2024-12-27'},
                { title: '친구들이랑 약속', start: '2024-12-28'}
            ],
            dateClick: function(info) {
                const clickedDate = info.dateStr;

                // 해당 날짜의 이벤트 필터링
                const events = calendar.getEvents().filter(event => event.startStr === clickedDate);

                // 모달에 데이터 추가
                modalDate.textContent = clickedDate;
                modalEvents.innerHTML = events.length
                ? events.map(function(event) {
                	return '<li><input type="checkbox" />' + event.title + '</li>';
                }).join('')
                : '<li>일정이 없습니다.</li>';


                // 모달 표시
                modalBg.style.display = 'block';

            }
        });

        calendar.render();
        
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') { // ESC 키 감지
                closeModal();
            }
        });

        // 모달 닫기 함수
        window.closeModal = function() {
            modalBg.style.display = 'none';
        };
        
        // 일정 추가 폼 제출 이벤트 처리
        eventForm.addEventListener('submit', function (event) {
            event.preventDefault(); // 기본 폼 제출 방지

            const title = eventTitleInput.value; // 입력된 일정 제목
            const date = eventDateInput.value; // 입력된 날짜

            if (title && date) {
                // FullCalendar에 일정 추가
                calendar.addEvent({
                    title: title,
                    start: date
                });

                // 입력 필드 초기화
                eventTitleInput.value = '';
                eventDateInput.value = '';

                // 일정 추가 폼 숨기기
                addEventForm.style.display = 'none';
            }
        });
    });
</script>
</head>
<body>
    <!-- header -->
    <jsp:include page="/WEB-INF/header_footer/header_format.jsp" />

    <div id="calendar"></div>

    <div class="modal-bg" id="modal-bg">
        <div class="modal">
            <button onclick="closeModal()">x</button>
            <h3 id="modal-date"></h3>
            <ul id="modal-events"></ul>
        </div>
    </div>
    
    <div id="add-event-form" style="display: none; margin-top: 20px;">
	    <h3>일정 추가</h3>
	    <form id="event-form">
	        <label for="event-title">일정 제목:</label>
	        <input type="text" id="event-title" placeholder="일정 제목 입력" required />
	        <label for="event-date">날짜:</label>
	        <input type="date" id="event-date" required />
	        <button type="submit">추가</button>
	    </form>
	</div>

    <!-- footer -->
    <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />
</body>
</html>