<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>
<link href="/resources/css/board/boardContents.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/include/header_format.jsp" />

	<div class="container">
	    <div class="title">오늘 서버 점검 있습니다.</div>
	    <div class="info-bar">
	        <div class="info-left">
	            <span>22na |</span>
	            <span>2024-12-26 18:10:48</span>
	        </div>
	    </div>
	    <div class="content">
	        오류로 인한 문제로 잠시 새벽동안 점검이 있을테니 다들 필요하신 정보나 체크 확인하시길 바랍니다.
	    </div>
	    <div class="actions">
	   		<!-- 목록으로 버튼 -->
		    <a href="#" class="btn btn-left">목록</a>
		    <!-- 수정 및 삭제 버튼 -->
		    <div class="btn-group">
		        <a href="#" class="btn">수정</a>
		        <a href="#" class="btn">삭제</a>
		    </div>
	    </div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/include/footer_format.jsp" />
</body>
</html>