<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.aws.team.domain.BoardVo" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 내용</title>
<link href="/resources/css/board/boardContents.css" rel="stylesheet">
</head>
<!-- 제이쿼리 cdn 주소 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script>


//삭제 바로 해버리기
function Delete(board_pk) {

	if (confirm("정말 삭제하시겠습니까?")) {
		// 삭제 요청 URL로 이동
		location.href = '${pageContext.request.contextPath}/noticeBoard/noticeBoardDelete.aws?board_pk=' + board_pk;
		}
	}
</script>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/include/header_format.jsp" />

	<div class="container">
	    <div class="title">${bv.subject}</div>
	    <div class="info-bar">
	        <div class="info-left">
	            <span>[관리자]</span>
	            <span>${bv.writedate}</span>
	        </div>
	    </div>
		<div class="content">
           ${bv.content }
       </div>
       <c:if test="${bv.filename != null && !bv.filename.isEmpty()}">
         <div class="content-file">
             <img src="${pageContext.request.contextPath}/noticeBoard/displayFile.aws?fileName=${bv.filename}" alt="첨부파일 이미지" class="file-image">
         </div>
      </c:if>
		
	    <div class="actions">
	   		<!-- 목록으로 버튼 -->
		    <a href="${pageContext.request.contextPath}/noticeBoard/noticeBoardList.aws" class="btn btn-left">목록</a>

			<!-- 수정, 삭제 링크 (관리자만 보이게) -->
			<c:if test="${sessionScope.grade == 'A'}">
    			<div class="btn-group">
					<a href="${pageContext.request.contextPath}/noticeBoard/noticeBoardModify.aws?board_pk=${bv.board_pk}" class="btn">수정</a>
        			<a href="#" onclick="Delete(${bv.board_pk}); return false;" class="btn">삭제</a>
    			</div>
			</c:if>
	    </div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/include/footer_format.jsp" />
</body>
</html>