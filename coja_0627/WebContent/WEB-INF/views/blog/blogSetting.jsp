<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>블로그 설정</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<style>
/* 블로그 정보 상세조회 항목 */
#blogInformationTitleArea {
	margin-left: 15px;
	margin-top: 25px;
	width: 200px;
	height: 50px;
}

#blogInformationTitleArea>span {
	font-size: 23px;
	line-height: 50px;
	font-weight: bold;
}

#blogInformationAreaWrap {
	margin-left: 98px;
	width: 700px;
	height: 300px;
}

#blogInformationAreaWrap1 {
	/* background-color: skyblue; */
	margin-top: 20px;
	margin-left: 20px;
	width: 250px;
	height: 230px;
	float: left;
}

.blogInformationArea1 {
	/* background-color: red; */
	margin-left: 48px;
	margin-top: 25px;
	width: 160px;
	height: 30px;
	text-align: center;
	border-right: 1px solid lightgrey;
	float: left;
	clear: both;
}

#blogInformationAreaWrap2 {
	/* background-color: skyblue; */
	margin-top: 20px;
	margin-left: 20px;
	width: 390px;
	height: 230px;
	float: left;
}

/* 회원의 블로그 상세 정보 */
#blogInformationArea2Wrap {
	width: 100px;
	height: 40px;
	float: left;
}

#userBlogName {
	margin-top: 100px;
	width: 330px;
	margin-left: 6px;
}

#userIntroduce {
	margin-top: 23px;
	width: 330px;
	margin-left: 6px;
	margin-top: 14px;
}

#blogAddress {
	margin-top: 23px;
	width: 330px;
	margin-left: 6px;
	margin-top: 14px;
}

/* ------------------------------영역구분선------------------------------ */
/* 카테고리 설정 영역 */
#categorySettingAreaWrap {
	margin-left: 98px;
	margin-top: 10px;
	width: 700px;
	height: 250px;
	/* background-color: skyblue; */
}

#categorySettingTitle {
	margin-left: 15px;
	margin-top: 25px;
	width: 200px;
	height: 50px;
	/* background-color: blueviolet; */
}

#categorySettingTitle>span {
	font-size: 23px;
	line-height: 50px;
	font-weight: bold;
}

#categorySettingArea {
	/* background-color: red; */
	margin-top: 30px;
	margin-left: 15px;
	width: 668px;
	height: 250px;
}

#categoryTable {
	text-align: center;
}

#addCategoryBtnArea {
	margin-top: 10px;
	width: 40px;
	height: 45px;
	float: right;
}

#add-category-btn {
	float: right;
}

#deleteCategoryBtnArea {
	margin-top: 10px;
	width: 40px;
	height: 45px;
	float: right;
}

#delete-category-btn {
	float: right;
}

/* 블로그 공개여부 설정 영역 */
#openYNArea {
	margin-top: 20px;
	width: 700px;
	height: 150px;
	/* background-color: red; */
	clear: both;
}

#openYNTitle {
	margin-left: 15px;
	margin-top: 25px;
	width: 200px;
	height: 50px;
	/* background-color: blueviolet; */
}

#openYNTitle>span {
	font-size: 23px;
	line-height: 50px;
	font-weight: bold;
	clear: both;
}

/* 블로그 전체 공개 토글 버튼 시작 */
#toggleSwitch {
	/* background-color: red; */
	margin-top: 20px;
	margin-left: 40px;
	width: 200px;
	height: 30px;
}

.custom-control-input-success:checked ~.custom-control-label::before {
	background-color: #28a745 !important;
	border-color: #28a745 !important;
}

.custom-switch-lg .custom-control-label::before {
	left: -2.25rem;
	width: 3rem;
	border-radius: 1.5rem;
}

.custom-switch-lg .custom-control-label::after {
	top: calc(.25rem + 3px);
	left: calc(-2.25rem + 4px);
	width: calc(1.5rem - 6px);
	height: calc(1.5rem - 6px);
	border-radius: 1.5rem;
}

.custom-switch-lg .custom-control-input:checked ~.custom-control-label::after
	{
	transform: translateX(1.4rem);
}

.custom-switch-lg .custom-control-label::before {
	height: 1.5rem;
}

.custom-switch-lg .custom-control-label {
	padding-left: 1.5rem;
	line-height: 1.7rem;
}

/* 전체 공개 토글 버튼 끝 */
#btnArea {
	margin-right: 98px;
	margin-top: 10px;
	margin-bottom: 30px;
	width: 330px;
	height: 50px;
	float: right;
}

#writeBtn {
	width: 150px;
	float: right;
	margin-right: 20px;
}

#cancleBtn {
	width: 150px;
	float: right;
}

#contentArea {
	/* background-color: lightgray; */
	width: 896px;
	margin-right: 0;
	float: left;
}

#titleText {
	/* 블로그 본문의 소제목 텍스트 */
	display: inline-block;
	margin-top: 15px;
	margin-left: 20px;
	font-size: 25px;
	font-weight: bold;
}

#plusBtnArea {
	float: right;
	margin-bottom: 30px;
}

#minusBtnArea {
	float: right;
	margin-left: 10px;
	margin-bottom: 30px;
}
</style>


</head>

<body>
	<jsp:include page="../common/headerMain.jsp" />
	<!-- ===============================영역구분선=============================== -->
	<jsp:include page="../common/headerBlog.jsp" />

	<jsp:include page="../common/blogSide.jsp" />
	<!-- blogSide include 영역 -->

	<div id="contentContainer">
		<!-- 유저 정보관련 영역 -->


		<!-- 블로그 본문 영역 -->
		<div id="contentArea">
			<!-- 블로그 본문 소제목 영역 -->
			<div id="titleArea">
				<span id="titleText">블로그 설정</span> <br>
			</div>

			<!-- 블로그 기본정보 상세조회 관련 영역 -->
			<form method="POST" action="updateBlog">
				<div id="blogInformationAreaWrap">
					<hr>
					<div id="blogInformationAreaWrap1">
						<div id="blogInformationTitleArea">
							<span>블로그 정보</span>
						</div>

						<div class="blogInformationArea1">
							<span>블로그명</span>
						</div>

						<div class="blogInformationArea1">
							<span>소개글</span>
						</div>

						<div class="blogInformationArea1">
							<span>블로그 주소</span>
						</div>
					</div>


					<!-- 유저별로 달라지는 블로그 정보 영역 -->
					<div id="blogInformationAreaWrap2">
						<div id="userBlogName">
							<input type="text" name="blogNm" class="form-control"
								placeholder="블로그의 이름을 입력해 주세요." value="${loginBlog.blogNm }"></input>
						</div>

						<div id="userIntroduce">
							<input type="text" name="blogIntro" class="form-control"
								placeholder="블로그 소개글을 작성해 주세요." value="${loginBlog.blogIntro }"></input>
						</div>

						<div id="blogAddress">
							<input type="text" name="blogAddr" class="form-control"
								placeholder="블로그 주소를 작성해 주세요." value="${loginBlog.blogAddr }"></input>
						</div>
					</div>
				</div>

				<!-- 블로그 카테고리 설정관련 영역 -->
				<div id="categorySettingAreaWrap">
					<hr>
					<div id="categorySettingTitle">
						<span>블로그 카테고리</span>
					</div>

					<div id="categorySettingArea">
						<table class="table table-sm" id="categoryTable">
							<thead>
								<tr>
									<th scope="col">카테고리 순서</th>
									<th scope="col">카테고리 이름</th>
								</tr>
							</thead>

							<tbody id="categorySetting">
								<c:forEach var="item" items="${loginCategory}">
									<tr>
										<td>${item.ctNo}</td>
										<td><input type='text' name="ctNm" class='form-control'
											size='5' placeholder='카테고리 이름을 입력해주세요.' value="${item.ctNm}"></input>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div id="minusBtnArea">
							<button type="button" class="btn btn-primary btn"
								id="delete-category-btn">-</button>
						</div>
						<div id="plusBtnArea">
							<button type="button" class="btn btn-primary btn"
								id="add-category-btn">+</button>
						</div>
					</div>
				</div>

				<!-- 블로그 공개 여부 관련 영역 -->
				<div id="openYNArea">
					<hr>
					<div id="openYNTitle">
						<span>블로그 공개 여부</span>
					</div>

					<div id="toggleSwitch">
						<div
							class="public-area custom-control custom-switch custom-switch-lg m-0">
							<input class="custom-control-input custom-control-input-success"
								id="write-public" type="checkbox" checked> <label
								class="custom-control-label" for="write-public"
								style="cursor: pointer">블로그 전체 공개</label>
						</div>
					</div>
				</div>

				<div id="btnArea">
					<button type="submit" class="btn btn-secondary btn-lg"
						id="cancleBtn">취소</button>
					<button type="submit" class="btn btn-primary btn-lg" id="writeBtn">수정완료</button>
				</div>
			</form>

		</div>
	</div>

	<script>		
		let index = ${fn:length(loginCategory)} + 1;
		
		let categoryName = "<input type='text' name='ctNm' class='form-control' size='5' placeholder='카테고리 이름을 입력해주세요.'</input>";
		
		$("#add-category-btn").on("click", function() {
			
			let insertTr = "";
			insertTr += "<tr>";
			insertTr += "<td>" + index + "</td>";
			insertTr += "<td>" + categoryName + "</td>";
			insertTr += "</tr>";
			
			$("#categorySetting").append(insertTr);
			
			console.log($("#categorySetting tr").length);

			if (index <= 10) {
				index++;
			} else {
				alert("10개를 초과하여 카테고리를 추가할 수 없습니다.");
				$("#categorySetting > tr:last").remove();
				
			}
		});

		
		$("#delete-category-btn").on("click", function() {
			$("#categorySetting > tr:last").remove();
			index--;
			console.log($("#categorySetting tr").length);
			if (index < 1) {
				index = 1;
			}
		});

		/* ------------------------ 카테고리 관련 설정 영역 -------------------------------------------------- */

		const loginBlogNo = "${loginBlog.memNo}"
		
		
		function selectCategoryList(){
			$.ajax({
	            url : "${contextPath}/blog/categoryList}",
	            type : "POST", 
	            data : { "memNo" : loginBlogNo }
	         })
		};
	</script>

	<jsp:include page="../common/footer.jsp" />

	<script src="${contextPath}/resources/js/member.js"></script>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
</body>

</html>