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

        const calendar = new FullCalendar.Calendar(calendarEl, {
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
                        alert("일정 추가 버튼 클릭!");
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

        // 모달 닫기 함수
        window.closeModal = function() {
            modalBg.style.display = 'none';
        };
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

    <!-- footer -->
    <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />
</body>
</html>
