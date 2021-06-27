<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<!-- footer -->
	<div class="footer">
		<a href="#" class="footer-text" id="ft-t1">회사소개</a> <a href="#"
			class="footer-text" id="ft-t2">운영정책</a> <a href="#"
			class="footer-text" id="ft-t3">이용약관</a> <a href="#"
			class="footer-text" id="ft-t4">고객센터</a>
	</div>

</body>

</html>