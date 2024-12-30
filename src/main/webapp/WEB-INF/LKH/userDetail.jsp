<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 상세정보 입력</title>
  <link href= "<%=request.getContextPath()%>/resources/css/user/detail.css" type="text/css" rel="stylesheet">
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
</script>
</head>
<body>
<!-- header -->
   <jsp:include page="/WEB-INF/header_footer/header_format.jsp" />
  <div class="form-container">
    <h2>상세 정보 입력 페이지</h2>
    <form>
      <div class="form-group">
        <label for="birthdate">생년월일</label>
        <input type="date" id="birthdate" name="birthdate">
      </div>

      <div class="form-group">
        <label for="weight">체중</label>
        <input type="text" id="weight" name="weight" placeholder="kg 단위로 입력">
        <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
      </div>

      <div class="form-group">
        <label for="height">키</label>
        <input type="text" id="height" name="height" placeholder="cm 단위로 입력">
        <div class="search-dropdown" id="searchDropdown" style="display: none;"></div>
      </div>

      <div class="form-group">
        <label for="disease">질병</label>
        <select id="disease" name="disease">
          <option value="">선택하세요</option>
          <option value="당뇨">당뇨</option>
          <option value="고혈압">고혈압</option>
          <option value="비만">비만</option>
        </select>
      </div>

      <div class="form-group">
        <label for="exercise">운동 빈도</label>
        <select id="exercise" name="exercise">
          <option value="">선택하세요</option>
          <option value="운동 안 함">운동 안 함</option>
          <option value="주 1~2회">주 1~2회</option>
          <option value="주 3~4회">주 3~4회</option>
          <option value="주 5회 이상">주 5회 이상</option>
        </select>
      </div>
      <div>흡연 음주 여부
      <div class="checkbox-group">
      <span>
      	<input type="checkbox" id="smoking" name="smoking">흡연
      </span>
      <span>
      	<input type="checkbox" id="drinking" name="drinking">음주
      </span>
  	  </div>
      </div>
      <button type="submit">저장하기</button>
    </form>
  </div>
  
     <!-- footer -->
   <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />
</body>
</html>
