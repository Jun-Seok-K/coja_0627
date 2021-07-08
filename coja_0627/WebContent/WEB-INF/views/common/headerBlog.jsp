<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- -------------------------------------아직 기능은 미구현 ---------------------------------------------- -->


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>블로그 헤더</title>
<style>
/* 블로그 기본정보 영역 div(today, 블로그이름, 검색창) */
#blogInfoArea {
	margin-top: 50px;
    border-top: 1px solid lightgray;
	margin: auto;
	width: 1200px;
	height: 80px;
}

/* 블로그 기본 정보 div */
#todayInfoArea {
	/* background-color: lightcoral; */
	width: 220px;
	height: 30px;
	margin-left: 20px;
	margin-top: 50px;
	float: left;
	font-size: 15px;
	text-align: center;
}

#todayInfoArea {
	line-height: 30px;
	border-bottom: 1px solid lightgray;
	border-top: 1px solid lightgray;
}

/* 블로그 이름 div */
#blogNameArea {
	/* background-color: lightcoral; */
	width: 450px;
	height: 50px;
	margin-left: 50px;
	margin-top: 30px;
	float: left;
	text-align: left;
	font-size: 25px;
	font-weight: bold;
}

#blogNameArea>span {
	line-height: 70px;
}

/* 검색박스 div */
#searchBoxArea {
	/* background-color: lightcoral; */
	width: 300px;
	height: 50px;
	margin-right: 20px;
	margin-top: 30px;
	float: right;
}

/* 검색입력창 */
#searchBox {
	margin: auto;
	border: 2px solid #c7f1ec;
	width: 85%;
	height: 46px;
	line-height: 38px;
	display: inline-block;
	font-size: 18px;
}
</style>
</head>

<body>
	<div id="blogInfoArea">
		<div id="todayInfoArea">
			<span>today:100 / total:100,000</span>
		</div>


		<!-- 블로그 이름 영역 -->
		<div id="blogNameArea">
			<span>${loginBlog.blogNm }</span>
		</div>

		<!-- 검색창 및 검색버튼 -->
		<div id="searchBoxArea">
			<input type="search" id="searchBox" placeholder="  검색할 단어를 입력하세요.">
			<button class="header-search-button">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
					fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path
						d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                </svg>
			</button>
		</div>
	</div>
</body>
</html>