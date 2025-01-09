<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
String msg = "";  
if (request.getAttribute("msg") != null) {
   msg = (String)request.getAttribute("msg");
}

if (msg != null) {
   out.println("<script>alert('" + msg + "');</script>");   
}
//세션 또는 모델에서 user_pk 값 가져오기
Integer user_pk = (Integer) session.getAttribute("user_pk"); // 세션에서 가져오기
if (request.getAttribute("user_pk") != null) {               // 모델에서 가져오기
 user_pk = (Integer) request.getAttribute("user_pk");
}


%> 

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 상세정보 입력</title>
  <link href= "${pageContext.request.contextPath}/resources/css/user/detail.css" type="text/css" rel="stylesheet">
  <script>


document.addEventListener("DOMContentLoaded", () => {
    const buttons = document.querySelectorAll(".toggle-btn");

    buttons.forEach((button) => {
        button.addEventListener("click", () => {
            // 선택 상태를 토글
            button.classList.toggle("selected");
        });
    });
});
function save() {
    var fm = document.frm;
    
    if(fm.userbirth.value=="") {
    	alert("생년월일을 입력해주세요");
    	fm.userbirth.focus();
    	return;
    }else if (fm.weight.value=="") {
    	alert("체중을 입력해주세요");
    	fm.weight.focus();
    	return;
    }else if (fm.height.value=="") {
    	alert("신장을 입력해주세요");
    	fm.height.focus();
    	return;
    }else if (fm.sicktype.value=="") {
    	alert("관리하고싶은 질환을 입력해주세요");
    	fm.sicktype.focus();
    	return;
    }else if (fm.exercise_cnt.value=="") {
    	alert("운동빈도를 입력해주세요");
    	fm.exercise_cnt.focus();
    	return;
    }
    // 체크박스 값 설정
    fm.smoke.value = document.getElementById('smoke').checked ? "Y" : "N";
    fm.drink.value = document.getElementById('drink').checked ? "Y" : "N";

    var ans = confirm("상세정보를 저장하시겠습니까?");
    if (ans) {
        fm.action = "${pageContext.request.contextPath}/user/detail/userDetailAction.aws";
        fm.method = "post";
        fm.submit();
    }
}


	
	












</script>
</head>
<body>
<!-- header -->
   <jsp:include page="/WEB-INF/include/header_format.jsp" />
   <main>
  <div class="form-container">
    <h2>상세 정보 입력 페이지</h2>
    <form name = "frm">
    <input type="text" name="user_pk" id="user_pk" value="<%= user_pk != null ? user_pk : "" %>">
      <div class="form-group">
        <label for="birthdate">생년월일</label>
        <input type="date" id="userbirth" name="userbirth">
      </div>

      <div class="form-group">
        <label for="weight">체중</label>
        <input type="text" id="weight" name="weight" placeholder="kg 단위로 입력">
      </div>

      <div class="form-group">
        <label for="height">키</label>
        <input type="text" id="height" name="height" placeholder="cm 단위로 입력">
      </div>

      <div class="form-group">
        <label for="disease">질병</label>
        <select id="sicktype" name="sicktype">
          <option value="" class="select">선택하세요</option>
          <option value="당뇨">당뇨</option>
          <option value="고혈압">고혈압</option>
          <option value="비만">비만</option>
        </select>
      </div>

      <div class="form-group">
        <label for="exercise">운동 빈도</label>
        <select id="exercise_cnt" name="exercise_cnt">
          <option value="" class="select" selected>선택하세요</option>
          <option value="운동 안 함">운동 안 함</option>
          <option value="주 1~2회">주 1~2회</option>
          <option value="주 3~4회">주 3~4회</option>
          <option value="주 5회 이상">주 5회 이상</option>
        </select>
      </div>
      <div class="checkbox-main">흡연 음주 여부
      <div class="checkbox-group">
      <span>
      <input type="hidden" name="smoke" value="N">
      	<input type="checkbox" id="smoke" name="smoke_checkbox" value = "Y">흡연
      </span>
      <span>
      <input type="hidden" name="drink" value="N">
      	<input type="checkbox" id="drink" name="drink_checkbox" value = "Y">음주
      </span>
  	  </div>
      </div>
      <button type="button" onclick = "save();">저장하기</button>
    </form>
  </div>
</main>  
     <!-- footer -->
   <jsp:include page="/WEB-INF/include/footer_format.jsp" />
</body>
</html>
