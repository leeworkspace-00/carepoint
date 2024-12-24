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

	<style>
		.searchDiv {
			display: flex;
			padding: 15px 380px;
			justify-content: right; /* 수평 중앙 정렬 */
			align-items: right;    /* 수직 중앙 정렬 */
		}
		
		.searchDiv input {
			margin-right: 5px;
			border: 1px solid lightgray;
			border-radius: 4px;
		}
		
		.searchDiv button {
			padding-top: 3px;
			border: 1px solid lightgray;
			color: white;
		 	background-color: #87B9F8;
		 	border-radius: 4px;
		}
	</style>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/header_footer/header_format.jsp" />
	
	<form class="search" name="frm" action="/lia/freeBoardList.aws" method="get">
		<div class="searchDiv">
			<input type="text" name="keyword">
			<button type="submit" class="btn">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
				</svg>
			</button>
		</div>
	</form>
	
	<div class="listDiv">
		<table class="listTable">
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			<tr>
				<td>15</td>
				<td class="subject"><a>자유게시판 15</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>14</td>
				<td class="subject"><a>자유게시판 14</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>13</td>
				<td class="subject"><a>자유게시판 13</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>12</td>
				<td class="subject"><a>자유게시판 12</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>11</td>
				<td class="subject"><a>자유게시판 11</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>10</td>
				<td class="subject"><a>자유게시판 10</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
	
			<tr>
				<td>9</td>
				<td class="subject"><a>자유게시판 9</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>8</td>
				<td class="subject"><a>자유게시판 8</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>7</td>
				<td class="subject"><a>자유게시판 7</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>6</td>
				<td class="subject"><a>자유게시판 6</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>5</td>
				<td class="subject"><a>자유게시판 5</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>4</td>
				<td class="subject"><a>자유게시판 4</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>3</td>
				<td class="subject"><a>자유게시판 3</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>2</td>
				<td class="subject"><a>자유게시판 2</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
			
			<tr>
				<td>1</td>
				<td class="subject"><a>자유게시판 1</a></td>
				<td class="writer">22na</td>
				<td class="writeday">2024-12-24</td>
			</tr>
		</table>
	</div>
	
	
	
	
	
	
	
	
	
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />

</body>
</html>