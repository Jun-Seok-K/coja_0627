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
<title>헤더</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<!-- sweetalert API 추가 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
/* border 주석 풀면 전체적인 div 구획 확인 가능 */

      @font-face {
         font-family: 'NEXON Lv1 Gothic OTF';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
         font-weight: normal;
         font-style: normal;
      }
      body * {
         font-family: 'NEXON Lv1 Gothic OTF';
      }
div {
	/* border: 1px solid black; */
	box-sizing: border-box;
}

/* header 시작 */
.header-container {
	padding-top: 1%;
	width: 1200px;
	height: auto;
	text-align: center;
	margin: auto;
}

.header {
	width: 100%;
	height: 64px;
	box-sizing: border-box;
	margin-bottom : 30px;
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
	border: 2px solid #c7f1ec;
	width: 75%;
	height: 38px;
	line-height: 38px;
	margin: 10px;
	margin-right: 0;
	padding: 0;
	display: inline-block;
	font-size: 18px;
}

/* 버튼 */
.header-search-button {
	border-style: none;
	background-color: white;
	width: 7%;
	height: 38px;
	line-height: 30px;
	margin-left: 0;
	margin-bottom: 6px;
	padding: 0;
	display: inline-block;
	cursor: pointer;
	vertical-align: middle;
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

#bt-1, #bt-2, #bt-3, #logout-btn {
	background-color: gainsboro;
}

/*  로그인 시작 */
#loginFormModal {
	text-align: center;
}

.swal-modal {
	border: 3px solid red;
}

.login-btn-area {
	margin-top: 10px;
}

#savecheck {
	width: 42%;
}

#login {
	width: 375px;
	margin-top: 0;
}

.swal-button {
	width: 120px;
	background-color: gray;
	font-size: 18px;
}

#findId {
	width: 115px;
}

#findPw {
	width: 130px;
	margin: 8px;
}

#joinMember {
	width: 90px;
	margin-left: 18px;
}
</style>

</head>

<body>
	<!-- header -->
	<div class="header-container">
		<div class="header">
			<!-- 로고 -->
			<div class="header-logobox">
				<a href="${contextPath}"><img
					src="https://assets.bigcartel.com/theme_images/10846261/cojalogo.png?auto=format&fit=max&h=500&w=1800"
					id="header-logo"></img></a>
			</div>

			<!-- 검색 -->
			<div class="header-searchbox">
				<input type="search" class="header-search-area"
					id="search-text-area" placeholder="  검색할 단어를 입력하세요.">
				<button class="header-search-button">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
						fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg>
				</button>
			</div>

			<!-- 버튼3 -->

			<c:choose>
				<c:when test="${!empty loginMember}">
					<div class="header-buttonbox">
						<a href="${contextPath}/blog/myBlog">
							<button type="button" class="header-button btn btn-secondary"
								id="bt-1">내 블로그</button>
						</a> <a href="${contextPath}/member/myPage"><button type="button"
								class="header-button btn btn-secondary" id="bt-2">${loginMember.memId}</button></a>
						<button type="button" class="header-button btn btn-secondary"
							id="logout-btn">로그아웃</button>
					</div>
				</c:when>

				<c:otherwise>
					<div class="header-buttonbox">
						<a href="${contextPath}/member/findID"><button type="button"
								class="btn btn-light btn-sm" id="bt-1">ID찾기</button></a> <a
							href="${contextPath}/member/findPw"><button type="button"
								class="btn btn-light btn-sm" id="bt-2">PW찾기</button></a>
						<button type="button" class="btn btn-info btn-sm" id="bt-3"
							data-toggle="modal" data-target="#loginForm">로그인</button>
						<a href="${contextPath}/member/signUpTerms"><button
								type="button" class="btn btn-info btn-sm" id="bt-4">회원가입</button></a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<%-- Modal창에 해당하는 html 코드는 페이지 마지막에 작성하는게 좋다 --%>
	<%-- 로그인 modal --%>
	<div class="modal fade" id="loginForm" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" id="loginFormModal">
			<div class="modal-content border-0">
				<div class="modal-header border-0">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="POST" action="${contextPath}/member/login"
						onsubmit="return loginValidate();">
						<table align="center">
							<tr>
								<th width="100px" height="45px"><label for="memId">아이디</label></th>
								<td><input type="text" size="33" id="memId" name="memId"
									placeholder=" 아이디를 입력해주세요." value="${cookie.saveId.value}"></td>
							</tr>
							<tr>
								<th width="100px" height="45px"><label for="memPw">비밀번호</label></th>
								<td><input type="password" size="33" id="memPw"
									name="memPw" placeholder=" 비밀번호를 입력해주세요."></td>
							</tr>
						</table>

						<%-- 이전에 저장해둔 아이디가 존재한다면 --%>
						<c:if test="${ !empty cookie.saveId.value }">
							<c:set var="ch" value="checked" />
						</c:if>

						<div class="checkbox mb-3" id="savecheck">
							<label> <input type="checkbox" name="save" id="save"
								${ch}> 아이디 저장
							</label>
						</div>

						<button class="btn btn-secondary" id="login" type="submit">로그인</button>
						<div class="login-btn-area">
							<a class="btn btn-secondary" href="${contextPath}/member/findID"
								role="button" id="findId">아이디 찾기</a> <a
								class="btn btn-secondary" href="${contextPath}/member/findPw"
								role="button" id="findPw">비밀번호 찾기</a> <a
								class="btn btn-secondary"
								href="${contextPath}/member/signUpTerms" role="button"
								id="joinMember">회원가입</a>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<%-- 로그아웃 팝업 --%>
	<script>
		document
				.getElementById("logout-btn")
				.addEventListener(
						"click",
						function() {
							swal("로그아웃 하시겠습니까?", "", {
								"buttons" : {
									"cancel" : "아니오",
									"catch" : {
										"text" : "네",
										"value" : "yes",
									},
								},
							})
									.then(
											function(value) {
												if (value == "yes") {
													window.location.href = "${contextPath}/member/logout";

													swal({
														"title" : "로그아웃 되었습니다!",
														"button" : "확인",
														"icon" : "success"
													});
												}
											});
						});
	</script>

	<%-- 로그인 실패와 같은 메세지가 서버로 부터 전달되어 온 경우 출력 --%>
	<c:if test="${!empty title }">
		<script>
			swal({
				"icon" : "${icon}",
				"title" : "${title}",
				"text" : "${text}",
				"button" : "확인",
			});
		</script>

		<%-- 특정 스코프에 있는 속성(변수)를 제거할 수 있음 --%>
		<%-- 서버로 부터 전달 받은 메세지를 1회 출력 후 제거 -> 반복 출력 되지 않음 --%>
		<c:remove var="icon" />
		<c:remove var="title" />
		<c:remove var="text" />
	</c:if>


	<script>
		// 로그인 수행 시 아이디/비밀번호가 작성 되었는지 확인하는 유효성 검사
		function loginValidate() {

			if ($("#memId").val().trim().length == 0) {

				swal({
					"icon" : "warning",
					"title" : "아이디를 입력해주세요",
					"button" : "확인"

				}).then(function() {
					// 아이디 입력창으로 포커스 이동
					$("#memId").focus();
				});

				// 제출되지 않도록 submit 기본 이벤트 제거
				return false;
			}

			if ($("#memPw").val().trim().length == 0) {

				swal({
					"icon" : "warning",
					"title" : "비밀번호를 입력해주세요",
					"button" : "확인"

				}).then(function() {
					// 아이디 입력창으로 포커스 이동
					$("#memPw").focus();
				});

				// 제출되지 않도록 submit 기본 이벤트 제거
				return false;
			}
		}
	</script>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
</body>

</html>