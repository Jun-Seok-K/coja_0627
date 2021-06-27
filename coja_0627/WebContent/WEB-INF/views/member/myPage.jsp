<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<style>
/* 블로그 기본정보 영역 div(today, 블로그이름, 검색창) */
#blogInfoArea {
	/* background-color: red; */
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
	text-align: center;
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

/* userInfoArea div와 contentArea div를 감싸는 div */
#contentContainer {
	/* background-color: gray */
	margin: auto;
	width: 1200px;
}

/* 유저정보 div */
#userInfoArea {
	/* background-color: lightgray; */
	width: 296px;
	/* height: 1000px; */
	float: left;
	border-right: 1px solid lightgray;
}

/* 회원정보 영역 확인용 css */
#userInfoArea>div {
	/* background-color: gray; */
	
}

/* 프사영역 div */
#profileImg {
	width: 200px;
	height: 200px;
	margin: auto;
	margin-top: 50px;
	border-radius: 50%;
	border: 1px solid lightgray;
	background-color: gray;
}

/* 블로그 소개글 영역 */
#introduceText {
	width: 250px;
	height: 100px;
	margin: auto;
	margin-top: 10px;
}

/* 블로그 소개글이 영역 내에 안정적으로 들어가게 하기위한 css */
#introduceText>span {
	margin: 10px;
}

/* 잔디영역 div */
#grassArea {
	width: 240px;
	height: 150px;
	margin: auto;
	margin-top: 10px;
}

/* 설정버튼 영역 div */
#settingBtnArea {
	width: 240px;
	height: 40px;
	margin: auto;
	margin-top: 10px;
}

/* 카테고리 영역 div */
#categoryArea {
	width: 200px;
	height: 250px;
	margin: auto;
	margin-top: 10px;
}

/* 블로그 검색 영역 div */
#blogSearchArea {
	width: 260px;
	height: 50px;
	margin: auto;
	margin-top: 30px;
	margin-bottom: 30px;
}

/* 검색입력창 */
#blogSearchBox {
	margin: auto;
	border: 2px solid #c7f1ec;
	width: 85%;
	height: 38px;
	font-size: 13px;
}

/* ------------------------------영역구분선------------------------------ */

/* 블로그 전체 본문영역 div */
#contentArea {
	/* background-color: lightgray; */
	width: 896px;
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
	height: 200px;
}

#contentProfileImg {
	width: 200px;
	height: 50px;
	margin-left: 50px;
	margin-top: 70px;
	text-align: center;
	font-size: 25px;
	float: left;
	border-right: 1px solid lightgray;
}

#userProfileImg {
	background-color: gray;
	width: 150px;
	height: 150px;
	margin-left: 105px;
	margin-top: 25px;
	text-align: center;
	font-size: 25px;
	float: left;
	border: 1px solid lightgray;
	border-radius: 50%;
}

/* 프사 변경 버튼 */
#imgBtnArea {
	width: 120px;
	height: 40px;
	margin-left: 20px;
	margin-top: 135px;
	text-align: center;
	font-size: 25px;
	float: left;
}

#contentProfileImg>span {
	line-height: 50px;
}

/* 본문 아이디 영역 */
#contentIdArea {
	margin: auto;
	margin-top: 20px;
	width: 700px;
	height: 60px;
}

#contentId {
	width: 200px;
	height: 50px;
	margin-left: 50px;
	margin-top: 4px;
	text-align: center;
	font-size: 25px;
	float: left;
	border-right: 1px solid lightgray;
}

#contentId>span {
	line-height: 50px;
}

#userId {
	width: 200px;
	height: 50px;
	margin-left: 80px;
	margin-top: 4px;
	text-align: left;
	font-size: 25px;
	float: left;
}

#userId>span {
	line-height: 50px;
}

/* 본문 이름 영역 */
#contentNameArea {
	margin: auto;
	margin-top: 20px;
	width: 700px;
	height: 60px;
}

#contentName {
	width: 200px;
	height: 50px;
	margin-left: 50px;
	margin-top: 4px;
	text-align: center;
	font-size: 25px;
	float: left;
	border-right: 1px solid lightgray;
}

#contentName>span {
	line-height: 50px;
}

#userName {
	width: 200px;
	height: 50px;
	margin-left: 80px;
	margin-top: 4px;
	text-align: left;
	font-size: 25px;
	float: left;
}

#userName>span {
	line-height: 50px;
}

/* 본문 닉네임 영역 */
#contentNicknameArea {
	margin: auto;
	margin-top: 20px;
	width: 700px;
	height: 60px;
}

#contentNickname {
	width: 200px;
	height: 50px;
	margin-left: 50px;
	margin-top: 4px;
	text-align: center;
	font-size: 25px;
	float: left;
	border-right: 1px solid lightgray;
}

#contentNickname>span {
	line-height: 50px;
}

#userNickname {
	width: 200px;
	height: 50px;
	margin-left: 80px;
	margin-top: 4px;
	text-align: left;
	font-size: 25px;
	float: left;
}

#userNickname>span {
	line-height: 50px;
}

#nicknameBtnArea {
	width: 120px;
	height: 40px;
	margin-left: 20px;
	margin-top: 10px;
	text-align: center;
	font-size: 25px;
	float: left;
}

/* 본문 개발자 여부 영역 */
#contentProgYNArea {
	margin: auto;
	margin-top: 20px;
	width: 700px;
	height: 60px;
}

#contentProgYN {
	width: 200px;
	height: 50px;
	margin-left: 50px;
	margin-top: 4px;
	text-align: center;
	font-size: 25px;
	float: left;
	border-right: 1px solid lightgray;
}

#contentProgYN>span {
	line-height: 50px;
}

#userProgYN {
	width: 250px;
	height: 50px;
	margin-left: 80px;
	margin-top: 10px;
	line-height: 37px;
	text-align: left;
	font-size: 22px;
	float: left;
}

#userProgYN>label {
	margin-right: 40px;
	margin-left: 0;
}

#userProgYN>div {
	margin-right: 0px;
}

/* 개발자 경력 영역 */
#contentProgCareerArea {
	margin: auto;
	margin-top: 20px;
	width: 700px;
	height: 60px;
	margin-bottom: 50px;
}

#contentProgCareer {
	width: 200px;
	height: 50px;
	margin-left: 50px;
	margin-top: 4px;
	text-align: center;
	font-size: 25px;
	float: left;
	border-right: 1px solid lightgray;
}

#contentProgCareer>span {
	line-height: 50px;
}

#userProgCareerYearValue {
	width: 155px;
	height: 50px;
	margin-left: 80px;
	margin-top: 4px;
	text-align: left;
	font-size: 25px;
	float: left;
}

#userProgCareerYear {
	width: 155px;
	height: 50px;
	margin-left: 20px;
	margin-top: 4px;
	text-align: left;
	font-size: 25px;
	float: left;
}

#userProgCareerYear>span {
	line-height: 50px;
}

#userProgCareerMoonth>span {
	line-height: 50px;
}

#contentSummitArea {
	margin: auto;
	margin-top: 110px;
	width: 700px;
	height: 50px;
	margin-bottom: 50px;
}

#contentSummitArea>button {
	float: right;
	width: 180px;
}
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

		<!-- 블로그 본문 영역 -->
		<div id="contentArea">
            <div id="titleArea">
                <span id="titleText">마이페이지</span> <br>
            </div>

            <div id="contentProfileImgArea">
                <div id="contentProfileImg">
                    <span>프로필 사진</span>
                </div>
                <div id="userProfileImg">
                    <img src="">
                </div>
                <div id="imgBtnArea">
                    <button type="submit" class="btn btn-primary btn">사진변경</button>
                </div>
            </div>

            <div id="contentIdArea">
                <div id="contentId">
                    <span>아이디</span>
                </div>
                <div id="userId">
                    <span>${loginMember.memId}</span>
                </div>
            </div>

            <div id="contentNameArea">
                <div id="contentName">
                    <span>이름</span>
                </div>
                <div id="userName">
                    <span>${loginMember.memNm}</span>
                </div>
            </div>

            <div id="contentNicknameArea">
                <div id="contentNickname">
                    <span>닉네임</span>
                </div>
                <div id="userNickname">
                    <input type="text" size="14" name="nickname" id="nickname" value="${loginMember.memNick}"></input>
                </div>
                <div id="nicknameBtnArea">
                    <button type="submit" class="btn btn-primary btn">중복확인</button>
                </div>
            </div>

            <div id="contentProgYNArea">
                <div id="contentProgYN">
                    <span>개발자 여부</span>
                </div>
                <div id="userProgYN">
                    <div class="form-check form-check-inline" id="programmerNoArea">
                        <input class="form-check-input" type="radio" name="programmerYN" id="programmerNo" value="no"
                            checked>
                    </div>
                    <label class="form-check-label" for="programmerNo" id="proNo">미해당</label>

                    <div class="form-check form-check-inline" id="programmerYesArea">
                        <input class="form-check-input" type="radio" name="programmerYN" id="programmerYes" value="yes">
                    </div>
                    <label class="form-check-label" for="programmerYes">해당</label>
                </div>
            </div>

            <div id="contentProgCareerArea">
                <div id="contentProgCareer">
                    <span>개발자 경력</span>
                </div>
                <div id="userProgCareerYearValue">
                    <input type="text" size="8" name="nickname" id="nickname" value="${loginMember.memExpYr}"></input>
                </div>
                <div id="userProgCareerYear">
                    <span>년차</span>
                </div>
            </div>

            <div id="contentSummitArea">
                <button type="submit" class="btn btn-primary btn-lg">수정완료</button>
            </div>
        </div>

	<jsp:include page="../common/footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>

</body>

</html>