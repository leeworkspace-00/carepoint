<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판 수정하기</title>
<link href= "<%=request.getContextPath()%>/resources/css/board/boardModify.css" type="text/css" rel="stylesheet">
</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/header_footer/header_format.jsp" />

<h2>수정하기</h2>
<div class="edit-container">
  <form name="frm">
  
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" id="subject" name="subject">
    </div>
    
    <div class="form-group">
      <label for="content">내용</label>
      <textarea id="content" name="content"></textarea>
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
<jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>