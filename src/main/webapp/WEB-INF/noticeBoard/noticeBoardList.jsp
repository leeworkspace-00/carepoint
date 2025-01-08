<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.aws.team.domain.*"%>
<%
String msg = "";  
if (request.getAttribute("msg") != null) {
	msg = (String)request.getAttribute("msg");
}

if (msg != "") {
	out.println("<script>alert('" + msg + "');</script>");	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판 목록 페이지</title>
<link href="/resources/css/board/boardList.css" rel="stylesheet">
</head>
<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/include/header_format.jsp" />
	
	<div class="noticeListDiv">
		<table class="listTable">
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			<c:forEach items = "${blist}" var = "bv" varStatus="status">
			<tr>
				<td class="noticeNo">${pm.totalCount - (status.index + (pm.scri.page-1) * pm.scri.perPageNum)}</td>
				<td class="subject"><a href="${pageContext.request.contextPath}/noticeBoard/noticeBoardContents.aws?board_pk=${bv.board_pk}">${bv.subject }</a></td>
				<td class="writer">[관리자]</td>
				<td class="writeday">${bv.writedate.substring(0,10)}</td>
			</tr>
			</c:forEach>
			<tr class="write-tr">
				<td class="write-td" colspan="4"><button onclick="location.href='/noticeBoaerd/noticeBoardWrite.aws';">글 작성</button></td>
			</tr>
			
		</table>
	</div>
	
	<div class="page">
		<ul>
			<c:if test="${pm.prev == true}">
				<li><a class="prev" href = "${pageContext.request.contextPath}/noticeBoard/noticeBoardList.aws?page=${pm.startPage - 1}&${queryParam}">◀</a></li>
			</c:if>		
			<c:forEach var = "i" begin = "${pm.startPage}" end = "${pm.endPage}" step = "1">
				<li <c:if test="${i == pm.scri.page}"> class = 'on'</c:if>>
					<a href = "${pageContext.request.contextPath}/noticeBoard/noticeBoardList.aws?page=${i}&${queryParam}">
					${i}</a>
				</li>
			</c:forEach>
			<c:if test="${pm.next && pm.endPage > 0 }">
				<li><a class="next" href = "${pageContext.request.contextPath}/noticeBoard/noticeBoardList.aws?page=${pm.endPage + 1}&${queryParam}">▶</a></li>
			</c:if>
		</ul>	
	</div>
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/include/footer_format.jsp" />

</body>
</html>