<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bmi 계산 페이지</title>
<link href="/resources/css/exercise/exercise.css" rel="stylesheet">
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/include/header_format.jsp" />
	
	<div class="container">
        <h1>나의 <span class="highlight">BMI</span> 지수 알아보기</h1>
        <form action="calculateBMI.aws" method="post">
            <div class="form-group">
                <label for="height">키(cm):</label>
                <input type="number" id="height" name="height" required>
            </div>
            <div class="form-group">
                <label for="weight">몸무게(kg):</label>
                <input type="number" id="weight" name="weight" required>
            </div>
            <button type="submit" class="btn">계산</button>
        </form>

        <div class="result">
            <h2>결과</h2>
            <c:if test="${not empty bmi}">
                <p>당신의 BMI 지수는 <span class="bmi-value">${bmi}</span> 입니다.</p>
                <p>당신의 신장에 따른 표준체중은 <span class="standard-weight">${standardWeight}</span>kg 입니다.</p>
            </c:if>
        </div>

		<div class="bmi-result">
			<ul class="bmi-ul">
	        	<li class="bmi-li-1">BMI</li>
	        	<li class="bmi-li-2">18.5</li>
	        	<li class="bmi-li-3">23</li>
	        	<li class="bmi-li-4">25</li>
	        </ul>
	
	        <div class="bmi-bar">
			    <div class="bar-section underweight ${bmiCategory == '저체중' ? 'active' : ''}">저체중</div>
			    <div class="bar-section normal ${bmiCategory == '정상' ? 'active' : ''}">정상</div>
			    <div class="bar-section overweight ${bmiCategory == '과체중' ? 'active' : ''}">과체중</div>
			    <div class="bar-section obese ${bmiCategory == '비만' ? 'active' : ''}">비만</div>
			</div>
		</div>
    </div>
    
    <!-- 여백 -->
	<div style="height: 150px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/include/footer_format.jsp" />
    
</body>
</html>