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
<title>공지사항 수정</title>
<link href= "${pageContext.request.contextPath}/resources/css/board/boardWrite.css" type="text/css" rel="stylesheet">
</head>


<script>

function modifyCheck() {
	
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
	var ans = confirm("수정하시겠습니까?");
	
	if(ans == true) {	// 업데이트하고 처리를 하겠다. 
		fm.action="${pageContext.request.contextPath}/noticeBoard/noticeBoardModifyAction.aws";
		fm.method="post";
		fm.enctype="multipart/form-data";   //파일을 올리기 위해서 지정해야한다. 
		fm.submit(); //파일 업로드를 포함한 폼 데이터를 전송할 때 필요한 인코딩 방식을 지정
	}
		return; 
}	

</script>

<body>

<!-- header -->
<jsp:include page="/WEB-INF/include/header_format.jsp" />

<h2>수정하기</h2>
<div class="edit-container">
  <form name="frm">
  <input type="hidden" name="board_pk" value="${bv.board_pk}"> 
  <input type="hidden" name="user_pk" value="${bv.user_pk}">
  
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" id="subject" name="subject" value="${bv.subject}">
    </div>
    
    <div class="form-group">
      <label for="content">내용</label>
      <textarea id="content" name="content">${bv.content}</textarea>
    </div>
    
    <div class="form-group">
      <label for="file-upload">📁첨부파일</label>
      <input type="file" id="attachfile" name="attachfile">
    </div>
    
    <div class="form-actions">
      <button type="button" class="save-button" onclick="modifyCheck();">저장</button>
      <button type="button" class="cancle-button" onclick="history.back();">취소</button>
    </div>
  </form>
</div>

<!-- footer -->
<jsp:include page="/WEB-INF/include/footer_format.jsp" />

</body>
</html>