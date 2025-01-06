<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<link href= "<%=request.getContextPath()%>/resources/css/user/join.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script> <!-- mvc jquery-CDN주소 추가  -->
<script>

const email = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;

function check(){ 
//	alert("test");
	
	//유효성 검사하기	
	var fm = document.frm;	
	
	if(fm.username.value=="") {
		alert("이름을 입력해주세요");
		fm.username.focus();
		return;
	}else if(fm.usernick.value=="") {
		alert("닉네임을 입력해주세요");
		fm.usernick.focus();
		return;
	}else if(fm.userid.value=="") {
		alert("아이디를 입력해주세요");
		fm.userid.focus();
		return;
	}else if (fm.userpwd.value==""){
		alert("비밀번호를 입력해주세요");
		fm.userpwd.focus();
		return;
	}else if(fm.userpwd2.value=="") {
		alert("비밀번호를 확인해주세요");
		fm.userpwd2.focus();
		return;
	}else if(fm.userpwd.value != fm.userpwd2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		fm.userpwd2.value="";	// 값 초기화
		fm.userpwd2.focus();	// 포커스
		return;	
	}else if(fm.userphone.value=="") {
		alert("전화번호를 입력해주세요");
		fm.userphone.focus();
		return;
	}else if(fm.useremail.value=="") {
		alert("이메일을 입력해주세요");
		fm.useremail.focus();
		return;
	}
	
	

// check 함수 끝	
	
	var ans = confirm("저장하시겠습니까?");
	
	if (ans == true){						
		fm.action="<%=request.getContextPath()%>/user/userJoinAction.aws"; 
		fm.method="post"; 
		fm.submit();
	}
	return;
}


 function checkUserId() {
    let userid = $("#userid").val();
    if (userid == "") {
        alert("아이디를 입력해주세요");
        return;
    }

    $.ajax({
        type: "post",
        url: "<%=request.getContextPath()%>/user/userIdCheck.aws",
        dataType: "json",
        data: {"userid": userid},
        success: function(result) {
            if (result.cnt == 0) {
                alert("사용할 수 있는 아이디입니다.");
                $("#idcheck-btn").val("Y");
            } else {
                alert("사용할 수 없는 아이디입니다.");
                $("#userid").val(""); // 입력한 아이디 지우기
            }
        },
        error: function() {
            alert("전송 실패");
        }
    });
} 
//아이디 중복체크 완료

 function checkNickname() {
    let usernick = $("#usernick").val();
    if (usernick == "") {
        alert("닉네임을 입력해주세요");
        return;
    }

    $.ajax({
        type: "post",
        url: "<%=request.getContextPath()%>/user/userNickCheck.aws",
        dataType: "json",
        data: {"usernick": usernick},
        success: function(result) {
            if (result.cnt == 0) {
                alert("사용할 수 있는 닉네임입니다.");
                $("#nickcheck-btn").val("Y");
            } else {
                alert("사용할 수 없는 닉네임입니다.");
                $("#usernick").val(""); // 입력한 아이디 지우기
            }
        },
        error: function() {
            alert("전송 실패");
        }
    });
}
			

</script>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<body>
	<!-- header -->
   <jsp:include page="/WEB-INF/include/header_format.jsp" />

   <main>
    <section class="registration-form">
      <h1>회원가입</h1>
      <form name="frm" action="<%=request.getContextPath()%>/user/userJoinAction.aws" method="post" onsubmit="return validateForm();">
       <input type="hidden" id="grade" name="grade" value="U">
        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" id="username" name="username" placeholder="이름을 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
        </div>
        <div class="form-group">
          <label for="nickname">닉네임</label>
          <div class="input-wrapper">
          <input type="text" id="usernick" name="usernick" placeholder="닉네임을 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
          	<button type="button" id="nickcheck-btn" class="nickcheck-btn" onclick="checkNickname()">중복확인</button>
          	
        </div>
        </div>
        <div class="form-group">
          <label for="id">아이디</label>
           <div class="input-wrapper">
          <input type="text" id="userid" name="userid" placeholder="아이디를 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
          	<button type="button" id="idcheck-btn" class="idcheck-btn" onclick="checkUserId()">중복확인</button>
        </div>
        </div>
        <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" id="userpwd" name="userpwd" placeholder="비밀번호를 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
        </div>
        <div class="form-group">
          <label for="confirm-password">비밀번호 확인</label>
          <input type="password" id="userpwd2" name="userpwd2" placeholder="비밀번호를 확인해주세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
        </div>
        <div class="form-group">
          <label for="phone">전화번호</label>
          <input type="tel" id="userphone" name="userphone" placeholder="전화번호를 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
        </div>
        <div class="form-group">
          <label for="email">이메일</label>
          <input type="email" id="useremail" name="useremail" placeholder="이메일을 입력하세요" required>
          <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
        </div>
        <button type="button" onclick = "check();">회원가입하기</button>
      </form>
    </section>
  </main>
   <!-- footer -->

   <jsp:include page="/WEB-INF/include/footer_format.jsp" />


</body>
</html>