<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>자유게시판 상세보기</title>
<link href="/resources/css/board/boardContents.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {

   $.boardCommentList();
  
   $("#recommend-btn").click(function() {
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/freeBoard/freeBoardRecom.aws?board_pk=${bv.board_pk}", // 요청 URL
            dataType: "json", // JSON 응답 기대
            success: function(result) {
                // 추천 수 업데이트
                const str = "추천수: " + result.recom;
                $("#recommend-count").text(str); // 추천 수 영역 업데이트
            },
            error: function() {
                alert("추천 실패");
            }
        });
    });
   
   $("#cmtbtn").click(function(event) {
      
      event.preventDefault();
         
      let loginCheck = "${user_pk}";
      if (loginCheck == "" || loginCheck == "null" || loginCheck == null || loginCheck == 0) {
         alert("로그인을 해주세요.");
         return;
      }
         
      let content = $("#content").val();
         
      if (content == "") {
            
         alert("댓글을 입력해주세요.");
            
         setTimeout(function() {
            $("#content").focus();
         }, 100);
            
         return;
      }
      
      $.ajax({
         type : "post",
         url : "${pageContext.request.contextPath}/freeBoard/commentWriteAction.aws",
         data : {"content" : content, 
               "board_pk" : "${board_pk}", 
               "user_pk" : "${user_pk}"
               },
         dataType : "json",      
         success : function(result) {
             alert("댓글이 등록되었습니다.");
             if(result.value == 1) {
                $("#content").val("");
                $("#block").val(1);
             }
			
             $.boardCommentList();
             
         },
         error : function() {
            alert("전송실패");
         }         
      });      
   });
   
   $("#more").click(function() {
		$.boardCommentList(); 
   });
   
});

function deletecheck() {
    const fm = document.frm;

    const ans = confirm("글을 삭제하겠습니까?");
    if (ans) {
        fm.action = "${pageContext.request.contextPath}/freeBoard/freeBoardDeleteAction.aws";
        fm.method = "post";
        fm.submit();
    }
}

$.boardCommentList = function(){
	
	let block = $("#block").val();
	
	$.ajax({
		type : "get",	
		url : "${pageContext.request.contextPath}/freeBoard/${bv.board_pk}/"+ block +"/commentList.aws",
		dataType : "json",		
		success : function(result) {	
			// alert("전송성공");
			
			var strTr = "";
			$(result.clist).each(function(){
			
				var btn = "";
				if (this.user_pk == "${user_pk}"){		
					if (this.delyn == 'N') {
						btn = "<button class = 'comment-delete' type = 'button' onclick = 'commentDel(" + this.comment_pk + ")'>×</button>";					
					}				
				}
			
				strTr = strTr 
				+ "<div class='comment-item'>"
				+ "<div class='comment-left'>"
				+ "<div class='comment-author'>" + this.usernick + "</div>"
				+ "<div class='comment-text'>" + this.content + "</div>"
				+ "</div>"
				+ "<div class='comment-right'>"
				+ "<div class='comment-date'>" + this.writedate.substring(0,10) + "</div>"
				+ btn 
				+ "</div>"
				+ "</div>"
			
			});
			
			$("#commentListView").html(strTr);
	
			if (result.moreView == "N") {
				$("#morebtn").css("display", "none");	// 감춘다.
			} else {
				$("#morebtn").css("display", "block");	// 보여준다.
			}
			
			$("#block").val(result.nextBlock);	
		
		},
		error : function() {		
			// alert("전송실패");
		}			
	});		
	
}

function commentDel(comment_pk) {
	
	let ans = confirm("삭제하시겠습니까?");
	
	if (ans == true) {
		
		$.ajax({
			type : "get",	
			url : "${pageContext.request.contextPath}/freeBoard/"+ comment_pk +"/commentDeleteAction.aws",
			dataType : "json",		
			success : function(result) {	
				$.boardCommentList();
			},
			error : function(xhr, status, errorThrown) {
				alert("전송실패");
			}			
		});
	}
	
	return;
}

</script>
</head>
<body>
   <!-- header -->
   <jsp:include page="/WEB-INF/include/header_format.jsp" />

   <div class="container">
       <div class="title">${bv.subject }</div>
       <div class="info-bar">
           <div class="info-left">
               <span>${bv.usernick } |</span>
               <span>${bv.writedate }</span>
           </div>
           <div class="info-right">
               <span id="recommend-count">추천수: ${bv.recom }</span>
               <span>조회수: ${bv.viewcnt }</span>
           </div>
       </div>
       <div class="content">
           ${bv.content }
       </div>
       <c:if test="${bv.filename != null && !bv.filename.isEmpty()}">
         <div class="content-file">
             <img src="${pageContext.request.contextPath}/freeBoard/displayFile.aws?fileName=${bv.filename}" alt="첨부파일 이미지" class="file-image">
         </div>
      </c:if>
       <div class="recommend-button">
          <button class="thumb-btn" id="recommend-btn">
              <img style = "color:white; " src="/resources/image/thumb.png" alt="추천" class="thumb-icon">
          </button>
      </div>
       <div class="actions">
          <!-- 목록으로 버튼 -->
         <a href="${pageContext.request.contextPath}/freeBoard/freeBoardList.aws" class="btn btn-left">목록</a>
          <form name="frm">
             <input type="hidden" name="board_pk" value="${board_pk}">
             <!-- 수정 및 삭제 버튼 -->
             <div class="btn-group">
                <c:if test="${sessionScope.grade == 'A' || sessionScope.user_pk == bv.user_pk}">
                   <a href="${pageContext.request.contextPath}/freeBoard/freeBoardModify.aws?board_pk=${board_pk}" class="btn">수정</a>
                   <button class="btn" type="button" onclick = "deletecheck();">삭제</button>
                </c:if>
             </div>
         </form>
       </div>
       <form name="commentfrm">
          <div class="comment-box">
              <input type="text" class="comment-input" id="content" name="content" placeholder="댓글을 입력하세요">
              <button class="comment-submit" id="cmtbtn">등록</button>
          </div>
          <div class="comment-list" id = "commentListView">
          </div>
          <div id = "morebtn" style = "text-align:center; line-height:50px">
			 <button type = "button" id = "more" >더보기</button>
			 <input type = "hidden" id = "block" value = "1">
		  </div>
      </form>
   </div>

   <!-- footer -->
   <jsp:include page="/WEB-INF/include/footer_format.jsp" />
</body>
</html>