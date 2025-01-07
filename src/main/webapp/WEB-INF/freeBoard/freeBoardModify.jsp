<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판 수정하기</title>
<link href= "${pageContext.request.contextPath}/resources/css/board/boardWrite.css" type="text/css" rel="stylesheet">
<script>

function check() {
    const fm = document.frm;
	
    if (fm.subject.value === "") {
        alert("제목을 입력해주세요.");
        fm.subject.focus();
        return;
    }
    if (fm.content.value === "") {
        alert("내용을 입력해주세요.");
        fm.content.focus();
        return;
    }


    const ans = confirm("글을 등록하겠습니까?");
    if (ans) {
        fm.action = "${pageContext.request.contextPath}/freeBoard/freeBoardModifyAction.aws";
        fm.method = "post";
        fm.enctype = "multipart/form-data";
        fm.submit();
    }
}

</script>
</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/include/header_format.jsp" />

<h2>수정하기</h2>
<div class="edit-container">
  <form name="frm">
  <input type="hidden" name="board_pk" value="${board_pk }" >
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" id="subject" name="subject" value="${bv.subject }">
    </div>
    
    <div class="form-group">
      <label for="content">내용</label>
      <textarea id="content" name="content">${bv.content }</textarea>
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