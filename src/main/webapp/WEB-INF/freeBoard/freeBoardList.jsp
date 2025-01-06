<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.aws.team.domain.*"%>
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
	
	<form class="search" name="frm" action="/LIA/freeBoardList.aws" method="get">
		<div class="searchDiv">
			<input type="text" name="keyword" onkeyup="showDropdown(this.value)" autocomplete="off">
			<div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
			<button type="submit" class="btn">
				<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	  				<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
				</svg>
			</button>
		</div>
	</form>
	
	<div class="total-div">
		<div class="listDiv">
			<table class="listTable">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach items = "${blist}" var = "bv" varStatus="status"> 
				<tr>
					<td class="No">${pm.totalCount - (status.index + (pm.scri.page-1) * pm.scri.perPageNum) }</td>
					<td class="subject"><a>${bv.subject }</a></td>
					<td class="writer">${bv.usernick }</td>
					<td class="writeday">${bv.writedate }</td>
				</tr>
				</c:forEach>
			</table>
		</div>		
	</div>
	
	<div class="page">
		<ul>
			<c:if test="${pm.prev == true}">
				<li><a class="prev" href = "${pageContext.request.contextPath}/freeBoard/freeBoardList.aws?page=${pm.startPage - 1}&${queryParam}">◀</a></li>
			</c:if>		
			<c:forEach var = "i" begin = "${pm.startPage}" end = "${pm.endPage}" step = "1">
				<li <c:if test="${i == pm.scri.page}"> class = 'on'</c:if>>
					<a href = "${pageContext.request.contextPath}/freeBoard/freeBoardList.aws?page=${i}&${queryParam}">
					${i}</a>
				</li>
			</c:forEach>
			<c:if test="${pm.next && pm.endPage > 0 }">
				<li><a class="next" href = "${pageContext.request.contextPath}/freeBoard/freeBoardList.aws?page=${pm.endPage + 1}&${queryParam}">▶</a></li>
			</c:if>
		</ul>	
	</div>
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/include/footer_format.jsp" />

</body>
</html>