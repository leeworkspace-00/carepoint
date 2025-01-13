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
        const tlist = JSON.parse('${tlist}');

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
                    	 
                    	// 폼으로 스크롤 이동
                        addEventForm.scrollIntoView({
                            behavior: 'smooth', // 부드럽게 이동
                            block: 'start' // 폼의 시작 부분을 화면 상단에 맞춤
                        });
                    }
                }
            },
            views: {
                dayGridMonth: {
                    titleFormat: {
                        year: 'numeric',
                        month: '2-digit'
                    }
                }
            },
            datesSet: function(info) {
                setTimeout(() => {
                    var titleEl = document.querySelector('.fc-toolbar-title');
                    if (titleEl) {
                        // 기존 내용을 완전히 초기화
                        titleEl.innerHTML = ''; 

                        // 현재 달력 중앙 날짜 가져오기
                        var currentDate = calendar.getDate(); // 현재 날짜 객체 반환
                        var year = currentDate.getFullYear(); // 현재 연도
                        var month = String(currentDate.getMonth() + 1).padStart(2, '0'); // 현재 월 (2자리)

                        // 새로운 연도와 월로 요소 생성
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
                        titleEl.appendChild(calendarTitle);
                    }
                }, 0);
            },
            events: tlist.map(todo => ({
                id: todo.num,
                title: todo.content,
                start: todo.selectdate
            })),
            dateClick: function(info) {
                const clickedDate = info.dateStr;

                // 해당 날짜의 이벤트 필터링
                const events = calendar.getEvents().filter(event => event.startStr === clickedDate);

                // 모달에 데이터 추가
                modalDate.textContent = clickedDate;
                modalEvents.innerHTML = events.length
                ? events.map(function(event) {
                    return '<li><input type="checkbox" />' + event.title + 
                           '<button class="delete-event" data-event-id="' + event.id + '" data-selectdate="' + event.start + '">x</button></li>';
                }).join('')
                : '<li>일정이 없습니다.</li>';
                console.log('모달 리스트 완료:', modalEvents.innerHTML);

                // 모달 표시
                modalBg.style.display = 'block';
				
            	// 삭제 버튼 이벤트 처리
                document.querySelectorAll('.delete-event').forEach(function(button) {
                    button.addEventListener('click', function(event) {
                        const eventId = this.getAttribute('data-event-id');
                        const rawDate = this.getAttribute('data-selectdate'); // "Wed Jan 15 2025 00:00:00 GMT+0900" 형식
                        const date = new Date(rawDate);

                        // 시간대를 보정하여 UTC 오차를 제거
                        date.setMinutes(date.getMinutes() - date.getTimezoneOffset());

                        // 로컬 시간 기준으로 YYYY-MM-DD 형식 생성
                        const year = date.getFullYear();
                        const month = String(date.getMonth() + 1).padStart(2, '0');
                        const day = String(date.getDate()).padStart(2, '0');
                        const selectdate = year + "-" + month + "-" + day;
                        
                        // AJAX 요청으로 서버에 삭제 요청
                        fetch(`/todo/todoDeleteAction.aws`, {
                            method: 'DELETE',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({ 
                            	num: eventId,
                            	selectdate: selectdate
                            })
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.status === 'success') {
                                const calendarEvent = calendar.getEventById(eventId);
                                console.log('삭제 전 캘린더 이벤트:', calendarEvent);
                                console.log('event.startStr:', event.startStr);
                                console.log('modalDate.textContent:', modalDate.textContent);
                                
                                if (calendarEvent) {
                                    calendarEvent.remove(); // 캘린더에서 삭제
                                }
                                console.log('삭제 후 캘린더 이벤트 목록:', calendar.getEvents());
                                alert("일정이 삭제되었습니다.");
                                
                                // 모달 업데이트
                                const updatedEvents = calendar.getEvents().filter(event => event.startStr === modalDate.textContent);
                                
                                console.log('모달 업데이트용 이벤트 목록:', updatedEvents);
                                console.log('모달 내용 업데이트 중...');
                                modalEvents.innerHTML = updatedEvents.length
                                    ? updatedEvents.map(function(event) {
                                    	return '<li><input type="checkbox" />' + event.title + 
											   '<button class="delete-event" data-event-id="' + event.id + '" data-selectdate="' + event.start + '">x</button></li>';
		                             }).join('')
		                             : '<li>일정이 없습니다.</li>';
		                             
		                        console.log('모달 업데이트 완료:', modalEvents.innerHTML);
                            } else {
                                alert('삭제 실패: ' + data.message);
                            }
                        })
                        .catch(error => console.error('Error:', error));
                    });
                });
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

            const selectdate = eventDateInput.value; // 입력된 날짜
            const content = eventTitleInput.value; // 입력된 일정 제목

            if (!content || !selectdate) {
                alert("내용과 날짜를 입력해주세요.");
                return;
            }
            
       		// 해당 날짜의 기존 이벤트 확인
            const existingEvents = calendar.getEvents().filter(event => event.startStr === selectdate);
       		
            if (existingEvents.length >= 6) {
                alert('한 날짜에 최대 6개의 일정만 추가할 수 있습니다.');
                
            	 // 입력 필드 초기화
                eventTitleInput.value = '';
                eventDateInput.value = '';
                return;
            }
			
         	// 서버로 데이터 전송
            fetch('/todo/todoWriteAction.aws', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    selectdate: selectdate,
                    content: content,
                    user_pk: '${user_pk}'
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === "success") {
                    alert("일정이 추가되었습니다.");
                    calendar.addEvent({
                        title: content,
                        start: selectdate
                    });

                    // 입력 필드 초기화
                    eventTitleInput.value = '';
                    eventDateInput.value = '';
                    
               		// 일정 추가 폼 숨기기
                    addEventForm.style.display = 'none';
                } else {
                    alert("일정 추가 중 오류가 발생했습니다.");
                }
            })
            .catch(error => console.error("Error:", error));
        });
    });
</script>
</head>
<body>
    <!-- header -->
    <jsp:include page="/WEB-INF/include/header_format.jsp" />

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
	        <label for="event-title">일정 제목 :</label>
	        <input type="text" id="event-title" placeholder="일정 제목 입력"/>
	        <label for="event-date">날짜 :</label>
	        <input type="date" id="event-date"/>
	        <button type="submit">추가</button>
	    </form>
	</div>

    <!-- footer -->
    <jsp:include page="/WEB-INF/include/footer_format.jsp" />
</body>
</html>
