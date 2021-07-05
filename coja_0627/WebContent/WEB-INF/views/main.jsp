<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html lang="ko"> 

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인 페이지</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<style>

/* content 시작 */
#content {
	margin: auto;
	width: 1200px;
}

#navigator {
	height: 60px;
}

/* 메뉴박스 */
#navi {
	padding: 0;
	margin: 0;
	list-style-type: none;
	width: 100%;
	height: 100%;
}

/* 인기글 네비관련 */
#navi>li {
	width: 11%;
	height: 100%;
	float: left;
	text-align: center;
	line-height: 80px;
	position: relative;
	cursor: pointer;
}

/* 인기글 네비관련 */
#navi li a:hover {
	color: #c7f1ec;
}

/* 인기글 네비관련 */
#navi li a {
	height: 100%;
	display: inline-block;
	text-decoration: none;
	color: rgba(0, 0, 0, 0.5);
	font-weight: bold;
	font-size: 15px;
	font-family: "굴림";
}

/* 전체 인기글 카드를 감싸는 div 영역 */
/* background-color 주석 풀면 해당 영역 확인 가능 */
#cardArea {
	height: 410px;
	/* background-color: red; */
}

/* 각각의 인기글 카드 위치잡는 css */
.card {
	float: left;
	margin-left: 8px;
	margin-top: 20px;
	margin-bottom: 20px;
}

/* 전체 최신글을 감싸는 영역 */
/* background-color 주석 풀면 해당 영역 확인 가능 */
#newestArea {
	height: 1080px;
	/* background-color: red; */
}

/* "최신글"이라고 써져있는 span 태그를 감싸는 div 영역 */
/* background-color 주석 풀면 해당 영역 확인 가능 */
#newestText {
	height: 60px;
	/* background-color: red; */
}

/* "최신글" 이라고 써져있는 span 태그 부분 */
#newestText>span {
	margin-left: 25px;
	font-size: 15px;
	font-weight: bold;
	line-height: 90px;
}

/* 각각의 최신글을 감싸는 영역 */
/* background-color 주석 풀면 해당 영역 확인 가능 */
#newestArea>.newestContent {
	width: 1160px;
	height: 300px;
	margin: auto;
	margin-top: 20px;
	/* background-color: red; */
}

/* 1~3번 최신글의 이미지 영역 */
#imageBox1, #imageBox2, #imageBox3 {
	width: 250px;
	height: 250px;
	margin-top: 25px;
	margin-left: 25px;
	float: left;
	background-color: lightgray;
}

/* 1~3번 최신글의 텍스트 영역 */
#contentBox1, #contentBox2, #contentBox3 {
	height: 250px;
	width: 820px;
	margin-top: 25px;
	margin-left: 25px;
	float: left;
	background-color: tomato;
}
/* content 끝 */


</style>

</head>

<body>
	<!-- header 뜯어옴 -->
	<jsp:include page="common/headerMain.jsp" />
	
<!-- ************************************************************************** -->	

	<!-- content -->
	<div id="content">
		<!-- 캐러셀 -->
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="http://jpcamara.com/wp-content/uploads/2015/02/carousel.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="http://jpcamara.com/wp-content/uploads/2015/02/carousel.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="http://jpcamara.com/wp-content/uploads/2015/02/carousel.jpg"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

		<!-- 인기글 네비게이터 -->
		<div>
			<div id="navigator">
				<ul id="navi">
					<li><a hrdf="#">전체인기글</a></li>
					<li><a hrdf="#">JAVA 인기글</a></li>
					<li><a hrdf="#">JDBC 인기글</a></li>
					<li><a hrdf="#">DB인기글</a></li>
				</ul>
			</div>
			<hr>
		</div>

		<!-- 인기글 card -->
		<div id=cardArea>
			<!-- 인기글 1 -->
			<div class="card" style="width: 18rem;">
				<img src="https://www.bordbia.ie/globalassets/bordbia.ie/about/man-in-a-business-suit-on-a-laptop" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">포스팅 제목</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">포스팅으로</a>
				</div>
			</div>

			<!-- 인기글 2 -->
			<div class="card" style="width: 18rem;">
				<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi-Pyk3TsTwrMUWXCWv26lVAM292ri47K7yA&usqp=CAU" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">포스팅 제목</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">포스팅으로</a>
				</div>
			</div>
			<div class="card" style="width: 18rem;">
				<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS2Rcn9p4u9neUfgj6BRZUc82T6ahsblA6oMbCSgqMGwSdy9Kt6ZJFZdll8R0afwTZazE&usqp=CAU" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">포스팅 제목</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">포스팅으로</a>
				</div>
			</div>

			<!-- 인기글 3 -->
			<div class="card" style="width: 18rem;">
				<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1E60PzPbXCpzaVsl-yeBtCFei-7A17sb2MRKojUzfhVyp1R-HxG6DBEtc165a71BeVEc&usqp=CAU" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">포스팅 제목</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">포스팅으로</a>
				</div>
			</div>
		</div>


		<!-- 최신글 -->
		<div id="newestArea">

			<div id="newestText">
				<span>최신글</span>
			</div>
			<hr>

			<!-- 최신글 1 -->
			<div class="newestContent">
				<div id="imageBox1">이미지 상자 1</div>

				<div id="contentBox1">텍스트 상자 1</div>
			</div>

			<!-- 최신글 2 -->
			<div class="newestContent">
				<div id="imageBox2">이미지 상자 1</div>

				<div id="contentBox2">텍스트 상자 1</div>
			</div>

			<!-- 최신글 3 -->
			<div class="newestContent">
				<div id="imageBox3">이미지 상자 1</div>

				<div id="contentBox3">텍스트 상자 1</div>
			</div>
		</div>
	</div>
<!-- ************************************************************************** -->	
		<!-- footer 뜯어옴 -->
	<jsp:include page="common/footer.jsp" />


</body>

</html>