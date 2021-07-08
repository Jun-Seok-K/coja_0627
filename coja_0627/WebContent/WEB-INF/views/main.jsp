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

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

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
	width: 18rem;
	height: 350px;
}
div{
	overflow: hidden;
}


/* 전체 최신글을 감싸는 영역 */
/* background-color 주석 풀면 해당 영역 확인 가능 */
#newestArea {
	height: auto;
	margin-bottom : 50px;
	
	/* background-color: red; */
}

/* "최신글"이라고 써져있는 span 태그를 감싸는 div 영역 */
/* background-color 주석 풀면 해당 영역 확인 가능 */
#newestText {
	margin-left : 20px;
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
				<c:forEach items="${crsList}" var="crs" varStatus="status">
					<c:choose>
						<c:when test="${status.first == true}">
							<div class="carousel-item active">
								<img class="d-block w-100" alt="..."
									src="${contextPath}/${crs.crsURL}${crs.crsNm}">
							</div>
						</c:when>
						
						<c:otherwise>
							<div class="carousel-item">
								<img class="d-block w-100" alt="..."
									src="${contextPath}/${crs.crsURL}${crs.crsNm}">
							</div>
						
						</c:otherwise>
					</c:choose>
				</c:forEach>
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
					<li class="popPosting" value="allpop" >전체인기글</li>
					<li class="popPosting" value="Java" >Java</li>
					<li class="popPosting" value="DB">DB</li>
					<li class="popPosting" value="HTML">HTML</li>
					<li class="popPosting" value="CSS">CSS</li>
					<li class="popPosting" value="jQuery">jQuery</li>
					<li id="viewAllContents"><a href="${contextPath}/board/list">전체
							글</a></li>
				</ul>
			</div>
			<hr>
		</div>

		<!-- 인기글 card -->
		<div id=cardArea>
			<!-- 인기글 1 -->
			<c:forEach items="${pstList}" var="pst">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">${pst.pstTitle}</h5>
						<p class="card-text">${pst.pstCnt}</p>
					</div>
				</div>
			</c:forEach>
		</div>


		<!-- 최신글 -->
		<div id="newestArea">

			<div id="newestText">
				<h4>   게시판 최신글</h4>
			</div>
			<hr>
			<c:forEach items="${recentBrdList}" var="brd">
				<div class="border-primary" style="width: 1180px; ">
			        <div class="card-header" id="brd-title">${brd.brdTypeNm}</div>
			        <div class="card-body text-primary">
			            <h5 class="card-title">${brd.brdTitle}</h5>
			            <p class="card-text">${brd.brdCnt}</p>
			        </div>
				</div>
			</c:forEach>

		</div>
	</div>
	<!-- ************************************************************************** -->
	<!-- footer 뜯어옴 -->
	<jsp:include page="common/footer.jsp" />
	
	<script>
		$(".popPosting").on("click", function(){
			console.log("야호~");

			const popMenu = $(this).attr("value");
			
			console.log(popMenu);
			
	         $.ajax({
	             url : "${contextPath}/main",
	             data : {"popMenu" : popMenu},
	             type : "POST",
	             dataType : "JSON",
	             success : function(pstList){
	            	 console.log(pstList);
	            	 
	            	 $("#cardArea").html("");
	            	 $.each(pstList, function(index, item){
	            		 var div = $("<div>").addClass("card");
	            		 var div2 = $("<div>").addClass("card-body");
	            		 var pstTitle = $("<h5>").addClass("card-title").text(item.pstTitle);
	            		 var pstCnt = $("<p>").addClass("card-text").text(item.pstCnt);
	            		 div2.append(pstTitle).append(pstCnt);
	            		 div.append(div2);
	            		 $("#cardArea").append(div);
	            	 });
	            		 
	             },
	             error : function(){
	                console.log("실패");
	             }
	          });
		});

		
	
	</script>
	


</body>

</html>