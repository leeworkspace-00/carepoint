<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 메세지 출력 -->
<c:set var="msg" value="${requestScope.msg}" />
<c:if test="${!empty msg}">
    <script>alert('${msg}');</script>
</c:if>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link href= "${pageContext.request.contextPath}/resources/css/board/boardWrite.css" type="text/css" rel="stylesheet">
</head>
<body>

<script>
function check() {
	
	//유효성 검사하기
	var fm = document.frm;
	
	if(fm.subject.value == "") {
		alert("제목을 입력해주세요");
		fm.subject.focus();  // 커서가 입력안한 해당 자리로 갈수 있도록 
		return;
	} else if(fm.content.value =="") {
		alert("내용을 입력해주세요");
		fm.content.focus(); 
		return;
	}
	
	var ans = confirm("저장하시겠습니까?");  // 함수의 값은 참과 거짓 true false로 나눈다. 
	
	if(ans == true) {	
		fm.action="${pageContext.request.contextPath}/noticeBoard/noticeBoardWriteAction.aws"; 
		fm.method="post";
		fm.enctype="multipart/form-data";   //파일을 올리기 위해서 지정해야한다. 
		fm.submit();	//파일 업로드를 포함한 폼 데이터를 전송할 때 필요한 인코딩 방식을 지정
	}
		return; 
}
</script>



<!-- header -->
<jsp:include page="/WEB-INF/include/header_format.jsp" />

<h2>공지사항 작성</h2>
<div class="edit-container">
  <form name="frm">
    <input type="hidden" name = "board_type" value = "N">
  
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" id="subject" name="subject" placeholder="제목을 입력해주세요" >
    </div>
    
    <div class="form-group">
      <label for="content">내용</label>
      <textarea id="content" name="content" placeholder="내용을 입력해주세요"></textarea>
    </div>
    
    <div class="form-group">
      <label for="file-upload">📁첨부파일</label>
      <input type="file" id="attachfile" name="attachfile">
    </div>
    
    <div class="form-actions">
      <button type="button" class="save-button" onclick="check();">저장</button>
      <button type="button" class="cancle-button" onclick="history.back();">취소</button>
    </div>
  </form>
</div>

<!-- footer -->
<jsp:include page="/WEB-INF/include/footer_format.jsp" />

</body>
</html>