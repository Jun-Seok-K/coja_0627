<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 게시글 목록 조회</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<style>
/* content(B,C,D행) --------------------------------------------------------------------------- 시작 
                
        /* content B) 게시글 목록 스타일 (B행) */
#brdListTitle {
	margin: 30px;
}

.board_list_wrap {
	width: 1200px;
	height: 700px;
	box-sizing: border-box;
	margin: auto;
	/* border: 2px solid red; */
}

.board_list {
	width: 1200px;
	height: 700px;
	border-bottom: 5px solid grey;
	font-size: 18px;
	text-align: center;
	/* border: 2px solid red; */
}

.board_list_head {
	border-top: 2px solid grey;
	border-bottom: 2px solid grey;
	height: 60px;
}

.board_list_body {
	height: auto;
}

.board_list .category {
	width: 10%;
}

.board_list .num {
	width: 5%;
}

.board_list .title {
	width: 40%;
}

.board_list .writer {
	width: 10%;
}

.board_list .date {
	width: 10%;
}

.board_list .view {
	width: 5%;
}

.board_list .like {
	width: 5%;
}

a {
	text-decoration: none;
	color: inherit;
}

/* content C) 게시글 페이지 버튼 스타일(C행) */
.pagebutton {
	width: 1200px;
	height: 70px;
	/* border: 1px solid black; */
}

.pagebtn {
	position: relative;
	top: 50%;
	transform: translateY(-50%);
}

.pagelink {
	position: relative;
	display: block;
	padding: .5rem .75rem;
	margin-left: -1px;
	line-height: 1.25;
	color: grey;
	background-color: #dee2e6;
	border: 1px solid white;
}

.pagelink:hover {
	z-index: 2;
	color: #0056b3;
	text-decoration: none;
	background-color: white;
	border-color: #dee2e6
}

.page-item.disabled .pagelink {
	color: #6c757d;
	pointer-events: none;
	cursor: auto;
	background-color: #dee2e6;
	border-color: white
}

.pagination .pagelink {
	padding: .7rem 1.2rem;
	font-size: 20px;
}

/* content D) 신고, 검색파트, 글작성 스타일(E행) */

/* D) 신고, 검색파트, 글작성을 감싸는 전체 div (E행) */
.searcharea {
	width: 1200px;
	height: 60px;
	box-sizing: border-box;
}

/* D-1) 신고마크 div(E행1열) */
.accuse {
	width: 5%;
	height: 100%;
	float: left;
}

/* 신고 마크 */
.accuse svg {
	color: black;
	float: left;
	margin-top: 7px;
}

/* D-2) 게시글 검색창과 버튼영역을 모두 아우르는 div(D행2열) */
.body-searchbox {
	width: 83%;
	height: 60px;
	float: left;
	box-sizing: border-box;
	text-align: center;
	padding: 6px;
}

/* 검색 옵션창 */
#search-option {
	width: 120px;
	height: 40px;
	display: inline-block;
	margin-right: 0;
	margin-top: 3px;
}

/* 게시글 검색 입력창 */
#search-text-area1 {
	width: 500px;
	height: 40px;
	display: inline-block;
	margin-left: 0;
	margin-top: 3px;
}

/* 게시글 검색 버튼 */
#searchbtn1 {
	width: 100px;
	height: 40px;
	box-sizing: border-box;
	margin-bottom: 4px;
	display: inline-block;
}

/* 게시글 글작성버튼 스타일(D행 3열) */

/* D-3) 글작성 버튼 div */
.writing {
	width: 12%;
	height: 100%;
	float: right;
}

/* 글작성 버튼 */
#writingbtn {
	width: 120px;
	height: 40px;
	float: right;
	margin-top: 8px;
}

/* content 끝 */
</style>
</head>
<body>

	<jsp:include page="../common/headerMain.jsp"></jsp:include>



	<!-- contents 시작 -->
	<!-- 1) 게시글 조회 목록 -->
	<div class="board_list_wrap" align="center">
		<h1 id="brdListTitle">전체 게시글</h1>
		<table class="board_list table-hover">
			<thead class="board_list_head">
				<tr>
					<th class="num">글번호</th>
					<th class="category">카테고리</th>
					<th class="title">제 목</th>
					<th class="writer">작성자</th>
					<th class="date">작성일</th>
					<th class="view">조회수</th>
					<th class="like">♥</th>
				</tr>
			</thead>

			<%-- 게시글 목록 출력 --%>
			<tbody>
				<c:choose>

					<%-- 조회된 게시글 목록이 없는 경우 --%>
					<c:when test="${empty brdList}">
						<tr>
							<td colspan="7">게시글이 존재하지 않습니다.</td>
						</tr>
					</c:when>

					<%-- 조회된 게시글 목록이 있을 경우 --%>
					<c:otherwise>
						<c:forEach items="${brdList}" var="board">
							<tr class="item">
								<%-- 글번호 --%>
								<td>${board.brdNo}</td>

								<%-- 카테고리 --%>
								<td>${board.brdTypeNm}</td>

								<%-- 글 제목 --%>
								<td class="boardTitle"><a
									href="view?no=${board.brdNo}&cp=${brdPagination.brdCurrentPage}"
									style="color: black;">${board.brdTitle}</a></td>

								<%-- 작성자 --%>
								<td>${board.memNick}</td>

								<%-- 작성일 --%>
								<td><fmt:formatDate var="createDate"
										value="${board.brdCreateDt}" pattern="yyyy-MM-dd" /> <fmt:formatDate
										var="today" value="<%=new java.util.Date()%>"
										pattern="yyyy-MM-dd" /> <c:choose>

										<%-- 글 작성일이 오늘이 아닐 경우 --%>
										<c:when test="${board.brdCreateDt != today}">
											${board.brdCreateDt}
										</c:when>

										<%-- 글 작성일이 오늘일 경우 --%>
										<c:otherwise>
											<fmt:formatDate value="${board.brdCreateDt}" pattern="HH:mm" />
										</c:otherwise>

									</c:choose></td>

								<%-- 조회수 --%>
								<td>${board.brdReadCount}</td>

								<%-- 좋아요 --%>
								<td>${board.brdLike}</td>
						</c:forEach>
					</c:otherwise>

				</c:choose>
			</tbody>
		</table>


		<!-- 2) 게시판 pagination -->

		<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>
		<c:set var="prev" value="list?cp=${brdPagination.brdPrevPage}" />
		<c:set var="next" value="list?cp=${brdPagination.brdNextPage}" />

		<div class="pagebutton">
			<nav class="pagebtn" aria-label="Page navigation example">
				<ul class="pagination justify-content-center">

					<%-- 현재 페이지가 10페이지 초과인 경우 --%>
					<c:if
						test="${brdPagination.brdCurrentPage > brdPagination.brdPageSize}">
						<li class="page-item"><a class="pagelink" href="${prev}">&lt;&lt;</a></li>
					</c:if>

					<%-- 현재 페이지가 2페이지 초과인 경우 --%>
					<c:if test="${brdPagination.brdCurrentPage > 2}">
						<li class="page-item"><a class="pagelink"
							href="list?cp=${brdPagination.brdCurrentPage - 1}">&lt;</a></li>
					</c:if>


					<%-- 페이지 목록 --%>
					<c:forEach var="p" begin="${brdPagination.brdStartPage}"
						end="${brdPagination.brdEndPage}">
						<c:choose>
							<c:when test="${p == brdPagination.brdCurrentPage}">
								<li class="page-item active"><a class="pagelink">${p}</a></li>
							</c:when>

							<c:otherwise>
								<li class="page-item"><a class="pagelink"
									href="list?cp=${p}">${p}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>


					<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
					<c:if
						test="${brdPagination.brdCurrentPage < brdPagination.brdNextPage}">
						<li class="page-item"><a class="pagelink"
							href="list?cp=${brdPagination.brdCurrentPage +  1}">&gt;</a></li>
					</c:if>

					<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
					<c:if
						test="${brdPagination.brdCurrentPage - brdPagination.brdMaxPage + brdPagination.brdPageSize < 0}">
						<li class="page-item"><a class="pagelink" href="${next}">&gt;&gt;</a></li>
					</c:if>

				</ul>
			</nav>
		</div>


		<!-- 검색 영역 -->
		<div class="searcharea">

			<!-- 3) 신고 버튼 (로그인 되어 있을 경우에만 신고 버튼 노출) -->
			<c:if test="${!empty loginMember}">
				<div class=accuse>
					<a href="#" color="black"> <svg
							xmlns="http://www.w3.org/2000/svg" width="40" height="40"
							fill="currentColor" class="bi bi-exclamation-circle"
							viewBox="0 0 16 16">
		                    <path
								d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
		                    <path
								d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
		                </svg>
					</a>
				</div>
			</c:if>

			<!-- 4) 게시글 검색 -->
			<div class="body-searchbox">
				<form action="#" method="GET" id="boardSearchForm">

					<select name="sk" class="form-control" id="search-option">
						<option value="title">글제목</option>
						<option value="content">내용</option>
						<option value="titcont">제목+내용</option>
						<option value="writer">작성자</option>
					</select> <input type="search" name="sv"
						class="body-search-area form-control" id="search-text-area1"
						placeholder=" 게시글 검색">
					<button class="btn btn-secondary" id="searchbtn1">검색</button>

				</form>
			</div>

			<!-- 5) 게시글 작성 버튼 (로그인 되어 있을 경우에만 글쓰기 버튼 노출) -->
			<c:if test="${!empty loginMember}">
				<div class="writing">
					<button type="button" id="writingbtn" class="btn btn-secondary"
						onclick="location.href='../board2/brdInsertForm';">글작성</button>
				</div>
			</c:if>
		</div>
	</div>

	<!-- contents 끝-->


	<jsp:include page="../common/footer.jsp"></jsp:include>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>

</body>
</html>