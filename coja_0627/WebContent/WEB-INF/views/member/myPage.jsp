<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<style>
div {
	/* border: 1px solid black; */
	
}

#contentArea {
	/*한가을이 다시 뜯어고처 만듬.*/
	/* background-color: lightgray; */
	width: 896px;
	height: 1100px;
	margin-right: 0;
	float: left;
}

#titleArea {
	/* 제목 영역 */
	height: 80px;
}

#titleText {
	/* 블로그 본문의 소제목 텍스트 */
	display: inline-block;
	margin-top: 15px;
	margin-left: 20px;
	font-size: 25px;
	font-weight: bold;
}

/* 본문 프로필 사진 영역 */
#contentProfileImgArea {
	margin: auto;
	margin-top: 50px;
	width: 700px;
	height: 850px;
}

/*프로필 전체박스*/
#content-propile-box {
	width: 700px;
	height: 200px;
}

/*프로필 부분박스 1,2,3*/
.propile {
	width: 230px;
	height: 200px;
	float: left;
	float: left;
	font-size: 25px;
	text-align: center;
	line-height: 200px;
}

#userProfileImg {
	background-color: gray;
	width: 150px;
	height: 150px;
	border: 1px solid lightgray;
	border-radius: 50%;
	margin-top: 30px;
	margin-left: 40px;
	margin-right: 40px;
}

/*아이디,이름,비밀번호,닉네임,개발자여부,개발자경력 박스*/
.etc {
	width: 230px;
	height: 95px;
	float: left;
	font-size: 25px;
	text-align: center;
	line-height: 90px;

	/*개발자여부 -라디오체크*/
}

.form-check-input {
	margin-right: 160px;
}

/*회원탈퇴 수정*/
.etc2 {
	width: 346px;
	height: 90px;
	float: left;
	padding: 20px;
	padding-left: 120px;
	margin: auto;
}

/*가을수정 인풋박스생성수정*/
/*개발자경력 인풋박스*/
#memExpYr {
	width: 200px;
	margin-top: 50px;
	height: 50px;
	margin: auto;
}

#nickName {
	width: 200px;
	height: 50px;
}

#contentSummitArea {
	width: 300px;
	float: left;
}

#contentSummitArea>div {
	width: 250px;
}

#gb3 {
	width: 300px;
	float: right;
}

#gb3>div {
	width: 200px;
}

.form-check-label {
	font-size: 18px;
}

#contentProgCareer {
	width: 230px;
	height: 95px;
	float: left;
	font-size: 25px;
	text-align: center;
	line-height: 90px;
}

/*-----------------------------------------------*/
</style>
</head>

<body>
	<jsp:include page="../common/headerMain.jsp" />
	<!-- ===============================영역구분선=============================== -->
	<jsp:include page="../common/headerBlog.jsp" />


	<div id="contentContainer">
		<!-- 유저 정보관련 영역 -->

		<jsp:include page="../common/blogSide.jsp" />
		<!-- blogSide include 영역 -->

		<div id="contentArea">
			<div id="titleArea">
				<span id="titleText">마이페이지</span> <br>
			</div>
			<form method="POST" action="update"
				onsubmit="return memInfoUpdate();">
				<div id="contentProfileImgArea">
					<div id="contentIdArea">
						<div class="etc" id="contentId">
							<span>아이디</span>
						</div>
						<div class="etc" id="userId">
							<span>${loginMember.memId}</span>
						</div>
						<div class="etc" id="id3"></div>
					</div>
					<div id="contentNameArea">
						<div class="etc" id="contentNameArea">
							<span>이름</span>
						</div>
						<div class="etc" id="userName">
							<span>${loginMember.memNm}</span>
						</div>
						<div class="etc" id="nm3"></div>
					</div>

					<div id="contentPwArea">
						<div class="etc" id="contentPw">
							<span>비밀번호</span>
						</div>
						<div class="etc" id="pw">
							<a href="${contextPath}/member/pwUpdate"><button
									type="button" class="btn btn-primary btn" onclick="updatePw()">비밀번호
									변경</button></a>
						</div>
						<div class="etc" id="nm3"></div>
					</div>
					<div id="contentNickNameArea">
						<div class="etc" id="contentNickName">
							<span>닉네임</span>
						</div>
						<div class="etc" id="userNickName">
							<input type="text" size="25" name="memNick" id="nickName"
								value="${loginMember.memNick}"></input> <span id="checkNickName">&nbsp;</span>
						</div>
						<div class="etc" id="id3"></div>
					</div>
					<div id="contentProgYNArea">
						<div class="etc" id="contentProgYN">
							<span>개발자 여부</span>
						</div>
						<div class="form-check form-check-inline" id="programmerNoArea">

						</div>
						<div class="etc" id="userProgYN">
							<c:choose>
								<c:when test="${loginMember.memWorkExp eq 'N'}">
									<div>
										<input class="form-check-input" type="radio" name="memWorkExp"
											id="memWorkExpN" value="N" checked> <label
											class="form-check-label" for="programmerNo" id="proNo">미해당</label>
										<input class="form-check-input" type="radio" name="memWorkExp"
											id="memWorkExpY" value="Y"> <label
											class="form-check-label" for="proYes">해당</label>
									</div>
								</c:when>
								<c:otherwise>
									<div>
										<input class="form-check-input" type="radio" name="memWorkExp"
											id="memWorkExpN" value="N"> <label
											class="form-check-label" for="programmerNo" id="proNo">미해당</label>
										<input class="form-check-input" type="radio" name="memWorkExp"
											id="memWorkExpY" value="Y" checked> <label
											class="form-check-label" for="proYes">해당</label>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div id="contentProgCareerArea">
						<div class="etc" id="contentProgCareer"></div>
						<div class="etc" id="contentProgCareer">
							<span>개발자 경력</span>
						</div>
						<div class="etc" id="userProgCareerYearValue">
							<div id="memExpYrArea">
								<input type="number" name="memExpYr" id="memExpYr"
									value="${loginMember.memExpYr}"></input>
							</div>
						</div>
						<div class="etc" id="userProgCareerYea">
							<span>년차</span>
						</div>

					</div>
					<div id="contentProgCareerArea"></div>
				</div>
				<div>
					<div class="etc2" id="contentSummitArea">
						<button type="submit" class="btn btn-primary btn-lg" id="update">수정완료</button>
					</div>
				</div>
			</form>

			<div class="etc2" id="gb3">
				<form method="POST" action="secessionTerms">
					<button type="button" onclick="location.href = 'secession';"
						class="btn btn-danger btn" id="secession">회원탈퇴</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />

	<script>
		
	</script>

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