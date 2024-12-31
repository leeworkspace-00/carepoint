<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인 페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Slick CSS 및 JS 추가 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<!-- 메인 CSS -->
<link href="<%=request.getContextPath()%>/resources/css/user/main.css" type="text/css" rel="stylesheet">

<script>
$(document).ready(function() {
	  $('.banner-slides').slick({
		    autoplay: true,
		    autoplaySpeed: 8000,
		    dots: true,
		    arrows: true, // 화살표 활성화
		    infinite: true,
		    slidesToShow: 1,
		    slidesToScroll: 1,
		    prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-chevron-left"></i></button>',
		    nextArrow: '<button type="button" class="slick-next"><i class="fa fa-chevron-right"></i></button>'
		  });
	  
	  $('.graph-slides').slick({
		    autoplay: true,
		    autoplaySpeed: 8000,
		    dots: true,
		    arrows: false, // 화살표 활성화
		    infinite: true,
		    slidesToShow: 1,
		    slidesToScroll: 1
		  });
	  
	  $('.articles-slides').slick({
		    autoplay: true,
		    autoplaySpeed: 8000,
		    dots: true,
		    arrows: false,
		    infinite: true,
		    slidesToShow: 1,
		    slidesToScroll: 1
		  });

		  // 인터뷰 슬라이드
		  $('.interviews-slides').slick({
		    autoplay: true,
		    autoplaySpeed: 2000,
		    dots: true,
		    arrows: false,
		    infinite: true,
		    slidesToShow: 1,
		    slidesToScroll: 1
		  });
});

</script>

</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/header_footer/header_format.jsp" />

	<main>
		<!-- 이미지 슬라이더 섹션 -->
		<section class="banner-img">
			<div class="banner-slides">
				<div><img src="/resources/image/도경수.jpg" alt="슬라이드 이미지 1"></div>
				<div><img src="/resources/image/필릭스.jpg" alt="슬라이드 이미지 2"></div>
				<div><img src="/resources/image/현진.jpg" alt="슬라이드 이미지 3"></div>
			</div>
		</section>

		<!-- 통계 및 기사/인터뷰 섹션 -->
		<div class="main-content">
			<!-- 통계 섹션 -->
			<div class="graph-img">
				<div class="graph-slides">
					<div><img src="/resources/image/고혈압환자수_그래프.jpg" alt="통계 그래프"></div>
					<div><img src="/resources/image/당뇨유병률_그래프.png" alt="통계 그래프"></div>
					<div><img src="/resources/image/비만 그래프.jpg" alt="통계 그래프"></div>
				</div>
			</div>
		
			<div class="right-content">
				<!-- 기사 및 인터뷰 섹션 -->
				<div class="articles-link">
					<div class="articles-slides">					
							<div>
								<p><a href="https://www.whosaeng.com/140683">“20~30대 MZ세대 ‘고혈압’ 증가 추세”1</a></p>
								<p><a href="https://www.whosaeng.com/140683">“20~30대 MZ세대 ‘고혈압’ 증가 추세”1</a></p>
								<p><a href="https://www.whosaeng.com/140683">“20~30대 MZ세대 ‘고혈압’ 증가 추세”1</a></p>
								<br style="height: 73px;">
							</div>
							<div>
								<p><a href="https://www.whosaeng.com/140683">“20~30대 MZ세대 ‘고혈압’ 증가 추세”2</a></p>
								<p><a href="https://www.whosaeng.com/140683">“20~30대 MZ세대 ‘고혈압’ 증가 추세”2</a></p>
								<p><a href="https://www.whosaeng.com/140683">“20~30대 MZ세대 ‘고혈압’ 증가 추세”2</a></p>
							</div>
							<div>
								<p><a href="https://www.whosaeng.com/140683">“20~30대 MZ세대 ‘고혈압’ 증가 추세”3</a></p>
								<p><a href="https://www.whosaeng.com/140683">“20~30대 MZ세대 ‘고혈압’ 증가 추세”3</a></p>
								<p><a href="https://www.whosaeng.com/140683">“20~30대 MZ세대 ‘고혈압’ 증가 추세”3</a></p>
							</div>
					</div>
				</div>
	
				<div class="interviews-link">
					<div class="interviews-slides">
							<div>
								<p><a href="https://www.youtube.com/watch?v=hAcvQOkLznU">고혈압 관리가 중요한 이유1</a></p>
								<p><a href="https://www.youtube.com/watch?v=hAcvQOkLznU">고혈압 관리가 중요한 이유1</a></p>
								<p><a href="https://www.youtube.com/watch?v=hAcvQOkLznU">고혈압 관리가 중요한 이유1</a></p>
							</div>
							<div>
								<p><a href="https://www.youtube.com/watch?v=hAcvQOkLznU">고혈압 관리가 중요한 이유2</a></p>
								<p><a href="https://www.youtube.com/watch?v=hAcvQOkLznU">고혈압 관리가 중요한 이유2</a></p>
								<p><a href="https://www.youtube.com/watch?v=hAcvQOkLznU">고혈압 관리가 중요한 이유2</a></p>
							</div>
							<div>
								<p><a href="https://www.youtube.com/watch?v=hAcvQOkLznU">고혈압 관리가 중요한 이유3</a></p>
								<p><a href="https://www.youtube.com/watch?v=hAcvQOkLznU">고혈압 관리가 중요한 이유3</a></p>
								<p><a href="https://www.youtube.com/watch?v=hAcvQOkLznU">고혈압 관리가 중요한 이유3</a></p>
							</div>
					</div>
				 </div>
			 </div>
		</div>
	</main>

   <!-- Footer -->
   <jsp:include page="/WEB-INF/header_footer/footer_format.jsp" />
</body>
</html>
