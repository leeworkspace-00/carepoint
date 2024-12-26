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
	    <div class="title">다들 건강 관리 잘 하고 계신가요?</div>
	    <div class="info-bar">
	        <div class="info-left">
	            <span>22na |</span>
	            <span>2024-12-26 18:10:48</span>
	        </div>
	        <div class="info-right">
	            <span>추천수: 15</span>
	            <span>조회수: 123</span>
	        </div>
	    </div>
	    <div class="content">
	        저는 23살인데 벌써부터 당뇨가 와서 케어 포인트 페이지에서 관리 중이에요 ㅠ.ㅠ 
			어떻게 관리 해야하나 막막했는데 이 페이지를 알게되고 나서 관리 하기 편해서 넘넘 좋아용 ㅎㅎ 
			운동 레벨도 벌써 3렙 찍었습니다!!!!
			다들 열심히 관리 해보아용 ㅎㅎ
	    </div>
	    <div class="recommend-button">
		    <button class="thumb-btn">
		        <img src="/resources/image/thumb.png" alt="추천" class="thumb-icon">
		    </button>
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
	    <div class="comment-box">
	        <input type="text" class="comment-input" placeholder="댓글을 입력하세요">
	        <button class="comment-submit">등록</button>
	    </div>
	    <div class="comment-list">
		    <div class="comment-item">
		        <!-- 왼쪽: 작성자와 내용 -->
		        <div class="comment-left">
		            <div class="comment-author">유진</div>
		            <div class="comment-text">저도 건강 챙기면서 ...</div>
		        </div>
		        <!-- 오른쪽: 작성일과 삭제 버튼 -->
		        <div class="comment-right">
		            <div class="comment-date">2024-12-26</div>
		            <button class="comment-delete">×</button>
		        </div>
		    </div>
		    <div class="comment-item">
		        <!-- 왼쪽: 작성자와 내용 -->
		        <div class="comment-left">
		            <div class="comment-author">아영</div>
		            <div class="comment-text">화이팅입니다!</div>
		        </div>
		        <!-- 오른쪽: 작성일과 삭제 버튼 -->
		        <div class="comment-right">
		            <div class="comment-date">2024-12-26</div>
		            <button class="comment-delete">×</button>
		        </div>
		    </div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />
</body>
</html>