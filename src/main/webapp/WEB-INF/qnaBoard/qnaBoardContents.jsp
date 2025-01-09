<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>
<link href="/resources/css/board/boardContents.css" rel="stylesheet">
</head>
<body>

<script> 

function deleteCheck() {
	  
	  let fm = document.deletefrm;
	
	  let ans = confirm("삭제하시겠습니까?");
	  
	  if (ans == true) {
		  fm.action="${pageContext.request.contextPath}/qnaBoard/qnaBoardDeleteAction.aws?board_pk=${bv.board_pk}";
		  fm.method="post";
		  fm.submit();
	  }	  
	  
	  return;
}

</script>

	<!-- header -->
	<jsp:include page="/WEB-INF/include/header_format.jsp" />

	<div class="container">
	    <div class="title">${bv.subject}</div>
	    <div class="info-bar">
	        <div class="info-left">
	            <span>${bv.usernick} |</span>
	            <span>${bv.writedate}</span>
	        </div>
	    </div>
	    <div class="content">
	        ${bv.content}
	    </div>
	    <div class="actions">
	   		<!-- 목록으로 버튼 -->
		    <a class="btn btn-left" href="${pageContext.request.contextPath}/qnaBoard/qnaBoardList.aws" >목록</a>
		    <!-- 수정 및 삭제 버튼 -->
		    <div class="btn-group">
		    	<a class="btn" href="${pageContext.request.contextPath}/qnaBoard/qnaBoardReply.aws?board_pk=${bv.board_pk}">답변</a>
		        <a class="btn" href="${pageContext.request.contextPath}/qnaBoard/qnaBoardModify.aws?board_pk=${bv.board_pk}">수정</a>
		        <form name="deletefrm">
		        	<button type="button" class="btn" onclick="deleteCheck();">삭제</button>
		        </form>
		    </div>
	    </div>
	</div>
	
	<!-- 여백 -->
	<div style="height: 200px;"></div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/include/footer_format.jsp" />
</body>
</html>