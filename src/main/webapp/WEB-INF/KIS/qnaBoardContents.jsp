<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자유게시판 상세보기</title>
<link href="/resources/css/board/boardContents.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/header_footer/header_format.jsp" />

	<div class="container">
	    <div class="title">운동 레벨은 어케 올리나여??</div>
	    <div class="info-bar">
	        <div class="info-left">
	            <span>22na |</span>
	            <span>2024-12-26 18:10:48</span>
	        </div>
	    </div>
	    <div class="content">
	        제가 비만이 있어서 운동 페이지를 잘 활용하고 있는데 운동 레벨은 어케 올리는거에여??
			넘 어렵 ㅠㅠ
	    </div>
	    <div class="actions">
	   		<!-- 목록으로 버튼 -->
		    <a href="#" class="btn btn-left">목록</a>
		    <!-- 수정 및 삭제 버튼 -->
		    <div class="btn-group">
		    	<a href="#" class="btn">답변</a>
		        <a href="#" class="btn">수정</a>
		        <a href="#" class="btn">삭제</a>
		    </div>
	    </div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />
</body>
</html>