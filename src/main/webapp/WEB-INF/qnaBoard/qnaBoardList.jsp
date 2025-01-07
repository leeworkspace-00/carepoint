<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판 목록 페이지</title>
<link href="/resources/css/board/boardList.css" rel="stylesheet">
</head>
<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/include/header_format.jsp" />
	
	<div class="qnaListDiv">
		<table class="listTable">
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			<c:forEach items="${blist}" var="bv" varStatus="status">
				<tr>
					<td class="No">${pm.totalCount-(status.index+(pm.scri.page-1)*pm.scri.perPageNum)}</td>
					<td class="subject">
						<c:forEach var="i" begin="1" end="${bv.level_}" step="1">
							&nbsp;&nbsp;
							<c:if test="${i==bv.level_}">
								ㄴ <a href="${pageContext.request.contextPath}/qnaBoard/qnaContent.aws?board_pk=${bv.board_pk}">A. 답변입니다.</a>
							</c:if>
						</c:forEach>
						<c:if test="${0==bv.level_}">
							<a href="${pageContext.request.contextPath}/qnaBoard/qnaContent.aws?board_pk=${bv.board_pk}">Q. 질문입니다.</a>
						</c:if>
					</td>
					<td class="writer">${bv.usernick}</td>
					<td class="writeday">${bv.writedate.substring(0, 10)}</td>
				</tr>
			</c:forEach>
			
			<tr class="write-tr">
				<td class="write-td" colspan="4"><button onclick="location.href='/qnaBoard/qnaBoardWrite.aws';">글 작성</button></td>
			</tr>
		</table>
	</div>
	
	
	<div class="page">
		<ul>
			<c:set var="queryParam" value="keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}"></c:set>
			<c:if test="${pm.prev==true}">
				<li>
					<a class="prev" href="${pageContext.request.contextPath}/qnaBoard/qnaBoardList.aws?page=${pm.startPage-1}&${queryParam}">◀</a>
				</li>
			</c:if>
			
			<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
				<li <c:if test="${i == pm.scri.page}">class='on'</c:if> >
					<a href="${pageContext.request.contextPath}/qnaBoard/qnaBoardList.aws?page=${i}&${queryParam}">${i}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pm.next&&pm.endPage>0}">
				<li>
					<a class="next" href="${pageContext.request.contextPath}/qnaBoard/qnaBoardList.aws?page=${pm.endPage+1}&${queryParam}">▶</a>
				</li>
			</c:if>
		</ul>	
	</div>
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/include/footer_format.jsp" />
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>