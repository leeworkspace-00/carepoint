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
				
				<tr>
					<td class="No">15</td>
					<td class="subject"><a>자유게시판 15</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">14</td>
					<td class="subject"><a>자유게시판 14</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">13</td>
					<td class="subject"><a>자유게시판 13</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">12</td>
					<td class="subject"><a>자유게시판 12</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">11</td>
					<td class="subject"><a>자유게시판 11</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">10</td>
					<td class="subject"><a>자유게시판 10</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
		
				<tr>
					<td class="No">9</td>
					<td class="subject"><a>자유게시판 9</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">8</td>
					<td class="subject"><a>자유게시판 8</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">7</td>
					<td class="subject"><a>자유게시판 7</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">6</td>
					<td class="subject"><a>자유게시판 6</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">5</td>
					<td class="subject"><a>자유게시판 5</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">4</td>
					<td class="subject"><a>자유게시판 4</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">3</td>
					<td class="subject"><a>자유게시판 3</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">2</td>
					<td class="subject"><a>자유게시판 2</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr>
					<td class="No">1</td>
					<td class="subject"><a>자유게시판 1</a></td>
					<td class="writer">22na</td>
					<td class="writeday">2024-12-24</td>
				</tr>
				
				<tr class="write-tr">
					<td class="write-td" colspan="4"><button onclick="location.href='/KES/freeBoardWrite.aws';">글 작성</button></td>
				</tr>
				
			</table>
		</div>		
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
	<jsp:include page="/WEB-INF/include/footer_format.jsp" />

</body>
</html>