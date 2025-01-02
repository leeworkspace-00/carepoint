<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판 목록 페이지</title>
<link href="/resources/css/board/boardList.css" rel="stylesheet">
</head>
<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/header_footer/header_format.jsp" />
	
	<div class="noticeListDiv">
		<table class="listTable">
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 15</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 14</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 13</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 12</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 11</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 10</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
	
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 9</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 8</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 7</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 6</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 5</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 4</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 3</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 2</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td class="noticeNo">공지</td>
				<td class="subject"><a>공지사항 1</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr class="write-tr">
				<td class="write-td" colspan="4"><button onclick="location.href='/KES/noticeBoardWrite.aws';">글 작성</button></td>
			</tr>
			
		</table>
	</div>
	
	<div class="page">
		<ul>
			<li><a href="#" class="prev">◀</a></li>
	        <li><a href="#">1</a></li>
	        <li><a href="#">2</a></li>
	        <li><a href="#">3</a></li>
	        <li><a href="#">4</a></li>
	        <li><a href="#">5</a></li>
	        <li><a href="#">6</a></li>
	        <li><a href="#">7</a></li>
	        <li><a href="#">8</a></li>
	        <li><a href="#">9</a></li>
	        <li><a href="#">10</a></li>
	        <li><a href="#" class="next">▶</a></li>
		</ul>	
	</div>
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>