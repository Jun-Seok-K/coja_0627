<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>${pagination.categoryName} 포스팅</title>
<style>
#list-table td {
	padding: 0;
	vertical-align: middle;
}

#list-table th {
	text-align: center;
}

#list-table td:not(:nth-of-type(3)) {
	text-align: center;
}

.list-wrapper {
	min-height: 540px;
}

#list-table td:nth-child(3) {
	width: 50%;
}

#list-table td:nth-child(3)>a {
	color: black;
}

.boardTitle img {
	width: 70px;
	padding: 10px
}

.pagination {
	justify-content: center;
}

#searchForm {
	position: relative;
}

#searchForm>* {
	top: 0;
}

#contentArea {
	/* background-color: lightgray; */
	width: 896px;
	margin-right: 0;
	float: left;
}

#list-table>thead>tr>th{
	font-size: 16px;
}

</style>

</head>
<body>

	<jsp:include page="../common/headerMain.jsp" />

	<jsp:include page="../common/headerBlog.jsp" />

	<jsp:include page="../common/blogSide.jsp" />

	<div id="contentArea">
		<div class="container my-5">
			<h1>${pagination.categoryName}게시판</h1>

			<div class="list-wrapper">
				<table class="table table-hover table-striped my-5" id="list-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>태그</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<c:if test="${!empty param.sk && !empty param.sv}">
						<c:set var="searchStr" value="&sk=${param.sk}&sv=${param.sv}" />
					</c:if>
					<tbody>
						<c:choose>
							<c:when test="${empty postingList}">
								<tr>
									<td colspan="6">게시글이 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${postingList}" var="posting">
									<tr>
										<td>${posting.pstNo}</td>

										<td>${posting.ctNm}</td>

										<td class="boardTitle"><a
											href="view?no=${posting.pstNo}&cp=${pagination.currentPage}&type=${pagination.blogType}${searchStr}">

												${posting.pstTitle} </a></td>

										<td>${posting.pstBox}</td>

										<td>${posting.pstCount}</td>

										<td>${posting.pstCreateDt}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<c:if test="${!empty loginMember}">
			<button type="button" class="btn btn-primary float-right"
				id="insertBtn"
				onclick="location.href='../blog2/insertForm?type=${pagination.blogType}';">글쓰기</button>
		</c:if>

		<%---------------------- Pagination start----------------------%>

		<c:set var="pageURL" value="list?type=${pagination.blogType}" />

		<c:set var="prev"
			value="${pageURL}&cp=${pagination.prevPage}${searchStr}" />
		<c:set var="next"
			value="${pageURL}&cp=${pagination.nextPage}${searchStr}" />

		<div class="my-5">
			<ul class="pagination">

				<c:if test="${pagination.currentPage > pagination.pageSize}">
					<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
				</c:if>

				<c:if test="${pagination.currentPage > 1}">
					<li><a class="page-link"
						href="${pageURL}&cp=&{pagination.currentPage - 1}${searchStr}">&lt;</a></li>
				</c:if>

				<c:forEach var="p" begin="${pagination.startPage}"
					end="${pagination.endPage}">

					<c:choose>
						<c:when test="${p == pagination.currentPage}">
							<li class="page-item active"><a class="page-link">${p}</a></li>
						</c:when>

						<c:otherwise>
							<li><a class="page-link"
								href="${pageURL}&cp=${p}${searchStr}">${p}</a></li>
						</c:otherwise>
					</c:choose>

				</c:forEach>

				<c:if test="${pagination.currentPage < pagination.maxPage}">
					<li><a class="page-link"
						href="${pageURL}&cp=${pagination.currentPage + 1}${searchStr}">&gt;</a></li>
				</c:if>

				<c:if
					test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
					<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
				</c:if>
			</ul>
		</div>
		
		<div class="my-5">
			<form action="list" method="GET" class="text-center" id="searchForm">
				<input type="hidden" name="type" value="${pagination.categoryName}">

				<!-- 게시판 타입 유지를 위한 태그 -->
				<select name="sk" class="form-control"
					style="width: 100px; display: inline-block;">
					<option value="title">글제목</option>
					<option value="content">내용</option>
					<option value="titcont">제목+내용</option>
					<option value="writer">작성자</option>
				</select> <input type="text" name="sv" class="form-control"
					style="width: 25%; display: inline-block;">
				<button class="form-control btn btn-primary"
					style="width: 100px; display: inline-block;">검색</button>
			</form>
		</div>
		
	</div>



	<jsp:include page="../common/footer.jsp" />

	<script>
		// 검색 내용이 있을 경우 검색창에 해당 내용을 작성해두는 기능
		(function() {
			var searchKey = "${param.sk}";
			// 파라미터 중 sk가 있을 경우   ex)  "abc"
			// 파라미터 중 sk가 없을 경우   ex)  ""
			var searchValue = "${param.sv}";

			// 검색창 select의 option을 반복 접근
			$("select[name=sk] > option").each(function(index, item) {
				// index : 현재 접근중인 요소의 인덱스
				// item : 현재 접근중인 요소
				// content            content
				if ($(item).val() == searchKey) {
					$(item).prop("selected", true);
				}
			});

			// 검색어 입력창에 searcValue 값 출력
			$("input[name=sv]").val(searchValue);
		})();
	</script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
</body>
</html>
