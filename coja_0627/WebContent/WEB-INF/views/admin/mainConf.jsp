<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Admin Main</title>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

   <style>
      @font-face {
         font-family: 'NEXON Lv1 Gothic OTF';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
         font-weight: normal;
         font-style: normal;
      }
      body * {
         font-family: 'NEXON Lv1 Gothic OTF';
      }
      /* border 주석 풀면 전체적인 div 구획 확인 가능 */
      /*div {
            border: 1px solid black;
            box-sizing: border-box;
        }
      */
      .header {
         /* background-color: red; */
         width: 1200px;
         height: 80px;
         margin: auto;
         box-sizing: border-box;
         text-align: left;
         line-height: 70px;
         border-bottom: 1px solid lightgray
      }
      /* 로고박스 */
      .header-logobox {
         width: 20%;
         height: 100%;
         box-sizing: border-box;
         float: left;
      }
      /* 로고 */
      #header-logo {
         width: 100%;
         height: 90%;
      }
      /* 검색창박스 */
      .header-searchbox {
         width: 50%;
         height: 100%;
         text-align: center;
         box-sizing: border-box;
         margin: auto;
         float: left;
      }
      /* 검색입력창 */
      .header-search-area {
         width: 75%;
         display: inline-block;
      }
      /* 버튼박스 */
      .header-buttonbox {
         width: 30%;
         height: 100%;
         text-align: center;
         box-sizing: border-box;
         margin: auto;
         float: left;
      }
      /* 내블로그,마이페이지,로그아웃 */
      .header-button {
         width: 30%;
         height: 38px;
         display: inline-block;
         border-radius: 10px;
         font-size: 14px;
         color: black;
         font-weight: 700;
         border-style: none;
         margin-top: 10px;
         margin-right: 1%;
      }
      #bt-1 {
         background-color: gainsboro;
      }
      /* -----------------------------------------------------------header 끝 */
      /* userInfoArea div와 contentArea div를 감싸는 div */
      #contentContainer {
         /* background-color: red;*/
         margin: auto;
         width: 1200px;
         height: auto;
      }
      
              /* 관리자 본문영역 전체 div */
        #admin-contentArea {
            width: 1200px;
            margin-right: 0;
            height: 1000px;
            float: left;
            box-sizing: border-box;
        }
        /* 캐러셀 관리 */
        #carouselArea-div{
            width: 100%;
            height:50%;
            box-sizing: border-box;
            margin-top: 40px;
        }
        #carousel-btn {
            width: 100%;
            height:35%;
        }
        #carousel-btn > button {
            float: right;
        }
        #carousel-table-div{
            width: 100%;
            height:65%;
            text-align: center;
            clear: both;
            
        }
        #carousel-table{
            display: inline-block;
        }
        #th1{
            width: 15%;
        }
        #th2{
            width: 15%;
        }
        #th3{
            width: 55%;
        }
        #th4{
            width: 10%;
        }

        /*-----------------------------------------------------------------------------*/

        /* 인기글 관리 */
        #popularPostArea-div{
            width:100%;
            height:50%;
            box-sizing: border-box;
            margin-top: 50px;
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
        /* ---------------------------구분선------------------------ */
      
      
      /* ---------------------------구분선------------------------ */
      /* 관리자 네비관련 */
      #navi{
          width: 1200px;
         height: auto;
         margin: auto;
         box-sizing: border-box;
         text-align: left;
         line-height: 70px;
         border-bottom: 1px solid lightgray;
         background-color : pink;
      }
      #navi li a:hover {
         color: #c7f1ec;
      }
      .navi-a{
      	text-decoration: none;
		display: inline-block;
      }
		.navi-li{
			text-align: center;
			float:left;
			margin-left : 50px;
			margin-right: 50px
		}
		.navi-ul{
			list-style-type: none;
		}
      /* ------------------------------영역구분선------------------------------ */

      /* ------------------------------영역구분선------------------------------ */

   </style>
</head>

<body>

   <!-- header -->
	<div class="header">
		<!-- 로고 -->
		<div class="header-logobox">
			<a href="${contextPath}"><img
				src="https://assets.bigcartel.com/theme_images/10846261/cojalogo.png?auto=format&fit=max&h=500&w=1800"
				id="header-logo"></img></a>
		</div>

		<!-- 검색 -->
		<div class="header-searchbox"></div>

		<!-- 버튼3 -->
		<div class="header-buttonbox">

			<button type="button" class="header-button btn btn-secondary"
				id="bt-1">관리자모드</button>
			<button type="button" class="header-button btn btn-secondary"
				id="bt-1">로그아웃</button>
		</div>
	</div>

	<!-- ===============================header 끝=============================== -->
	<div id="navi">
		<ul class="navi-ul">
			<li class="navi-li"><a class="navi-a"
				href="${contextPath}/admin/main/mainConfiguration">Main</a></li>
			<li class="navi-li"><a class="navi-a"
				href="${contextPath}/admin/member/memberList">Members</a></li>
			<li class="navi-li"><a class="navi-a"
				href="${contextPath}/admin/board">Boards</a></li>
			<li class="navi-li"><a class="navi-a"
				href="${contextPath}/admin/blog">Blogs</a></li>
			<li class="navi-li"><a class="navi-a"
				href="${contextPath}/admin/reports">Reports</a></li>
		</ul>
	</div>
	
   <!-- ===============================관리자  navi 끝=============================== -->
	<!-- 전체 div를 포함하는 영역 -->
	<div id="contentContainer">
	
		<div id="admin-contentArea">
			<!-- 캐러샐 관리 영역-->
				<div id="carouselArea-div">
					<div id="carousel-btn">
						<h2>Carousel Option</h2>
					</div>
					<div id="carousel-table-div">
						<form name="" id="" method="POST" action="" enctype="multipart/form-data">
						<table id="carousel-table" width="500px">
							<thead>
								<tr>
									<th id="th1">1번</th>
									<th id="th2">2번</th>
									<th id="th3">3번</th>
									<th id="th4">4번</th>
								</tr>
							</thead>
							<tbody>
							<tr>
								<c:choose>
									<%-- 조회된 게시글 목록이 없는 경우 --%>
									<c:when test="${empty carouselList}">
										<tr>
											<td colspan="4" >
													<input type="file" name="" ud="">
											</td>
										</tr>
								
									</c:when>

									<%-- 회원 목록이 있을 경우 --%>

									<c:otherwise>

										<c:forEach items="${popularPstList}" var="posting">
											<tr>
												<%-- 포스팅번호(No) --%>
												<td>${posting.pstNo}</td>
												<%-- 포스팅 제목 --%>
												<td>${posting.pstTitle}</td>
												<%-- 포스팅 작성자 --%>
												<td>${posting.pstTitle}</td>
												<%-- 포스팅 작성일 --%>
												<td>${posting.pstCreatDt}</td>
												<%-- 조회수 --%>
												<td>${posting.pstCount}</td>
												<%-- 좋아요 --%>
												<td>${posting.pstLike}</td>
												<%-- 신고 --%>
												<td>${posting.pstWarn}</td>

												<td>삭제관련 radio 또는 button</td>
												<%-- 회원 상태 변경 버튼--%>
											</tr>

										</c:forEach>
									</c:otherwise>
								</c:choose>
						</tbody>
						</table>
								</form>
					</div>
						<button>저장</button>
						<button type="reset">취소</button>

				</div>
			<hr>

			<!-- 인기글 관리 영역 -->
			<div id="popularPostArea-div">
				<!-- 인기글 네비게이터 -->
				<h2>Popular Post</h2>
				<div id="navigator">
					<form method="POST" action="mainConfiguration">
			         	<select name="memberOption">
			         		<option value="memberList" selected>전체인기글</option>
			         		<option value="warningMember">JAVA 인기글</option>
			         		<option value="blindMember">JDBC 인기글</option>
			         		<option value="closedAccount">DB인기글</option>
			         	</select>
		         	<button type="submit">조회</button>
	         	</form>
				</div>
				<hr>
				<div class="board-table">
					<table class="table table-hover table-sm" id="list-table">
						<thead>
							<tr>
								<th>게시글 번호</th>
								<th>제목</th>
								<th>작성자일단타이틀</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>좋아요</th>
								<th>신고</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:choose>
									<%-- 조회된 게시글 목록이 없는 경우 --%>
									<c:when test="${empty popularPstList}">
										<tr>
											<td colspan="7">포스팅이 존재하지 않습니다</td>
										</tr>

									</c:when>

									<%-- 회원 목록이 있을 경우 --%>

									<c:otherwise>

										<c:forEach items="${popularPstList}" var="posting">
											<tr>
												<%-- 포스팅번호(No) --%>
												<td>${posting.pstNo}</td>
												<%-- 포스팅 제목 --%>
												<td>${posting.pstTitle}</td>
												<%-- 포스팅 작성자 --%>
												<td>${posting.pstTitle}</td>
												<%-- 포스팅 작성일 --%>
												<td>${posting.pstCreatDt}</td>
												<%-- 조회수 --%>
												<td>${posting.pstCount}</td>
												<%-- 좋아요 --%>
												<td>${posting.pstLike}</td>
												<%-- 신고 --%>
												<td>${posting.pstWarn}</td>

												<td>삭제관련 radio 또는 button</td>
												<%-- 회원 상태 변경 버튼--%>
											</tr>

										</c:forEach>
									</c:otherwise>
								</c:choose>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
	<!-- ===============================본문 끝=============================== -->
   <jsp:include page="../common/footer.jsp" />
   
   

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"></script>



</body>

</html>