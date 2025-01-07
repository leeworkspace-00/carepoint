<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QnA 문의하기</title>
<link href= "<%=request.getContextPath()%>/resources/css/board/boardWrite.css" type="text/css" rel="stylesheet">
</head>
<body>

<script>
	function savecheck() {
		  
		  // 유효성 검사하기
		  let fm = document.frm; // 문서 객체 안에 폼 객체
		  
		  if (fm.subject.value == "") {
			  alert("제목을 입력해주세요");
			  fm.subject.focus();
			  return;
		  } else if (fm.content.value == "") {
			  alert("내용을 입력해주세요");
			  fm.content.focus();
			  return;
		  }
		  
		  let ans = confirm("저장하시겠습니까?"); // 함수의 값을 참과 거짓 true false로 나눈다
		  
		  if (ans == true) {
			  fm.action = "${pageContext.request.contextPath}/qnaBoard/qnaBoardWriteAction.aws";
			  fm.method="post";
			  fm.enctype="multipart/form-data";
			  fm.submit();
		  }	  
		  
		  return;
	}
</script>

	<!-- header -->
	<jsp:include page="/WEB-INF/include/header_format.jsp" />
	
	<h2 class="main-title">Q&A</h2>
	<p class="sub-title">궁금한 점을 물어보세요!</p>
	<div class="edit-container">
	  <form name="frm">
	  
	    <div class="form-group">
	      <label for="subject">제목</label>
	      <input type="text" id="subject" name="subject" placeholder="제목을 입력해주세요" >
	    </div>
	    
	    <div class="form-group">
	      <label for="content">내용</label>
	      <textarea id="content" name="content" placeholder="문의할 내용을 입력해주세요"></textarea>
	    </div>
	    
	    <div class="form-group">
	      <label for="file-upload">📁첨부파일</label>
	      <input type="file" id="attachfile" name="attachfile">
	    </div>
	    
	    <div class="form-actions">
	      <button type="button" class="save-button" onclick="savecheck();">저장</button>
	      <button type="button" class="cancle-button" onclick="history.back();">취소</button>
	    </div>
	  </form>
	</div>
	
	<!-- 여백 -->
	<div style="height: 200px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/include/footer_format.jsp" />

</body>
</html>