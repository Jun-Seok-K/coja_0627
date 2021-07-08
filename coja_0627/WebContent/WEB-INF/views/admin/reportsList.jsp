<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Member List</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<style>
@font-face {
	font-family: 'NEXON Lv1 Gothic OTF';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body * {
	font-family: 'NEXON Lv1 Gothic OTF';
}

/* ------------------------------영역구분선------------------------------ */

/* userInfoArea div와 contentArea div를 감싸는 div */
#contentContainer {
	/* background-color: red;*/
	margin: auto;
	width: 1200px;
	height: auto;
}
/* ---------------------------구분선------------------------ */
/* 관리자 네비관련 */
#navi {
	width: 1200px;
	height: auto;
	margin: auto;
	box-sizing: border-box;
	text-align: left;
	line-height: 70px;
	border-bottom: 1px solid lightgray;
	background-color: pink;
}

#navi li a:hover {
	color: #c7f1ec;
}

.navi-a {
	text-decoration: none;
	display: inline-block;
}

.navi-li {
	text-align: center;
	float: left;
	margin-left: 50px;
	margin-right: 50px
}

.navi-ul {
	list-style-type: none;
}
/* ------------------------------영역구분선------------------------------ */

/* content ) 게시글 목록 스타일 */
#contentArea {
	
}

#h-menu {
	clear: both;
}

.h-div {
	float: left;
	width: 21%;
}

.mem-menu {
	display: inline-block;
	float: left;
	width: 50%;
}

/* 컬럼명 가운데 정렬 */
#list-table th {
	text-align: center;
}

/* 게시글 제목을 제외한 나머지 가운데 정렬 */
#list-table td:not(:nth-of-type(3)) {
	text-align: center;
}

/* 게시글 목록의 높이가 최소 540px은 유지하도록 설정 */
.list-wrapper {
	min-height: 540px;
}

/*글 제목 영역의 너비를 table의 50% 넓게 설정*/
#list-table td:nth-child(3) {
	width: 10%;
}
/*가을 생성*/
#list-table td:nth-child(4) {
	width: 40%;
}

/* 제목 a태그 색 변경 */
#list-table td:nth-child(3)>a {
	color: black;
}

/* pagination 가운데 정렬 */
.pagination {
	justify-content: center;
}

#searchForm {
	position: relative;
}

#searchForm>* {
	top: 0;
}
/* ------------------------------영역구분선------------------------------ */
/* footer 시작 */
.footer {
	width: 1200px;
	height: 60px;
	line-height: 60px;
	margin: auto;
	background-color: #e9e9e9;
	text-align: center;
	clear: both;
}

.footer-text {
	text-align: center;
	color: gray;
	font-size: 12px;
	border-style: none;
	text-decoration: none;
	margin-right: 1.5%;
}
/* footer 끝 */
</style>
</head>

<body>


	<!-- ===============================영역구분선=============================== -->

	<jsp:include page="../common/headerAdmin.jsp" />
	<!-- 전체 div를 포함하는 영역 -->
	<div id="contentContainer">
		<!-- ===============================영역구분선=============================== -->

		<div id="contentArea">
			<div id="h-menu">
				<div class="h-div">
					<h2>
						<span id="listTitle">고객센터</span> 리스트
					</h2>
				</div>
				<div class="mem-menu">
					<form method="POST" action="reportsList"></form>
				</div>
			</div>
			<div class="list-wrapper">
				<table class="table table-hover table-striped my-1" id="list-table">

					<thead>
						<tr>
							<th>No.</th>
							<th>회원번호</th>
							<th class="title-1">제목</th>
							<th class="content-1">내용</th>
							<th>작성일</th>
							<th>글 타입</th>

						</tr>
					</thead>

					<tbody>
						<c:choose>
							<%-- 조회된 게시글 목록이 없는 경우 --%>
							<c:when test="${empty reportsList}">
								<tr>
									<td colspan="7">게시글이 존재하지 않습니다/</td>
								</tr>

							</c:when>

							<%-- 조회된 게시글 목록이 있을 경우 --%>

							<c:otherwise>

								<c:forEach items="${reportsList}" var="reports">
									<tr>
										<%--글번호(No) --%>
										<td>${reports.rptNo}</td>

										<%-- 회원이름 --%>
										<td>${reports.memNm}</td>


										<%-- 글제목 --%>
										<td class="csRptTitle"><a
											href="view?no=${reports.rptNo}&cp=${pagination.currentPage}&type=${pagination.boardType}${searchStr}">
											${reports.rptTitle}
											</a></td>
										<%-- 글내용 --%>
										<td>${reports.rptCnt}</td>
										<%--작성일 --%>
										<td><fmt:formatDate var="createDate"
												value="${reports.rptCreateDt}" pattern="yyyy-MM-dd" /> <fmt:formatDate
												var="today" value="<%=new java.util.Date()%>"
												pattern="yyyy-MM-dd" /> <c:choose>
												<%-- 글 작성일이 오늘이 아닐 경우 --%>
												<c:when test="${reports.rptCreateDt != today}">
                                                 ${reports.rptCreateDt}
                                              </c:when>

												<%-- 글 작성일이 오늘일 경우 --%>
												<c:otherwise>
													<fmt:formatDate value="${reports.rptCreateDt}"
														pattern="HH:mm" />
												</c:otherwise>
											</c:choose></td>

										<%-- 글타입 --%>
										<td><c:if test="${reports.rptTypeNo == 1}">1:1 문의</c:if>
											<c:if test="${reports.rptTypeNo == 2}">
												<span style="color: red;">신고</span>
											</c:if></td>

									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<%---------------------- Pagination start----------------------%>
			<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>

			<c:set var="pageURL" value="reportsList?type=${pagination.boardType}" />

			<c:set var="prev"
				value="${pageURL}&cp=${pagination.prevPage}${searchStr}" />
			<c:set var="next"
				value="${pageURL}&cp=${pagination.nextPage}${searchStr}" />


			<div class="my-5">
				<ul class="pagination">

					<%-- 현재 페이지가 10페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > pagination.pageSize}">
						<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>


					</c:if>

					<%-- 현재 페이지가 2페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage>2}">
						<li><a class="page-link"
							href="${pageURL}&cp=${pagination.currentPage -1}${searchStr}">&lt;</a></li>
					</c:if>


					<%-- 페이지 목록 --%>
					<c:forEach var="p" begin="${pagination.startPage}"
						end="${pagination.endPage}">

						<c:choose>
							<c:when test="${p == pagination.currentPage}">
								<li class="page-item active"><a class="page-link">${p}</a></li>
							</c:when>
							<c:otherwise>
								<%--클릭가능 --%>
								<li><a class="page-link"
									href="${pageURL}&cp=${p}${searchStr}">${p}</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>




					<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
					<c:if test="${pagination.currentPage< pagination.maxPage}">
						<li><a class="page-link"
							href="${pageURL}&cp=${pagination.currentPage +1}${searchStr}">&gt;</a></li>
					</c:if>

					<%-- 현재 페이지가 마지막 페이지 미만인경우 --%>
					<c:if test="${pagination.currentPage< pagination.maxPage}">
						<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
					</c:if>


				</ul>
			</div>

			<!----------------------------------------------------------------------------------------------  Pagination end -->

			<!-- 검색창 -->
			<!-- <div class="my-2">
				<form action="#" method="GET" class="text-center" id="searchForm">
					<div class="container2">
						<div class="row">
							<div class="col-sm" align="right">
								<button class="form-control btn btn-primary"
									style="width: 100px; display: inline-block;">검색</button>
							</div>
							<div class="col-sm">
								하이룽~~~~~ 
								<input type="text" name="sv" class="form-control"
									style="width: 50%%; display: inline-block;">
							</div>
							<div class="col-sm" align="left">
								<select name="sk" class="form-control"
									style="width: 200px; display: inline-block;">
									<option value="nick">닉네임으로 검색</option>
									<option value="content">제목으로 검색</option>
									<option value="writer">아이디로 검색</option>
								</select>
							</div>
						</div>
					</div>
				</form>
			</div> -->
		</div>
	</div>



	<!-- ===============================영역구분선=============================== -->
	<jsp:include page="../common/footer.jsp" />



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>


	<script>
		$("select[name='memberOption'] > option").each(function(index, item) {
			if ($(item).val() == "${param.memberOption}") {
				$(item).prop("selected", true);
				$("#listTitle").text($(item).text());
			}
		});
	</script>

	<script>
		/*$(function(){
		   $("#memberStatusUpdate-btn").click(function(){
		      funUpdateStatus();
		   })
		})
		
		function funUpdateStatus(){
		   const memStatus = $("#memberStatus").val();
		   console.log(memStatus);
		}*/

		function updteStatus(memNo, btn) {

			const memberStatus = $(btn).parent().prev().children("select")
					.val();

			$.ajax({
				url : "${contextPath}/admin/member/memberStatusUpdate",
				data : {
					"memNo" : memNo,
					"memStatus" : memberStatus
				},
				type : "POST",
				success : function(result) {
					if (result > 0) {
						alert("변경 성공");
					}
				},
				error : function() {
					console.log("실패");
				}
			})

		}
	</script>


</body>

</html>