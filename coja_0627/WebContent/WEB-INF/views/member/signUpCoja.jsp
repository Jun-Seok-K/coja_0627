<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>html문서 제목</title>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
        div {
            /*border: 1px solid black; */
            box-sizing: border-box;
            width: 1200px;
            left: 0;
            right: 0;
            margin: auto;
        }
        /* 본문 시작*/
        /*가을수정,margin-left 생성,수정*/
        #titleArea {
            /* 제목 영역 */
            width: 1000px;
            height: 140px;
            margin-left: 340px;
        }
        
        #titleText {
            /* 상단의 "회원가입" 텍스트 */
            display: inline-block;
            margin-top: 30px;
            font-size: 45px;
           
        }
        /*가을수정,margin-left 생성,수정*/
        .wrap {
            /* 본문의 input, button 등을 감싸는 요소 */
            position: relative;
            /* background-color: gray; */
            width: 750px;
            margin-left: 300px;
        }
        .wrap>div {
            /* 각 항목에 대한 div */
            /* background-color: red; */
            width: 500px;
            height: 100px;
            margin: 50px;
        }
        #join {
            /* 회원가입 페이지의 각 입력항목에서 제목에 대한 텍스트 크기 */
            font-size: 25px;
            text-align: left;
        }
        #join input {
            /* 회원가입 페이지의 각 입력항목에서 내용입력란에 대한 텍스트 크기 */
            width: 500px;
            left: 0;
            right: 0;
            margin: auto;
        }
        #programmerYNArea {
            /* 개발자 여부 관련 틀잡기 용도... */
            margin-bottom: 0;
        }
        #programmerYNArea>label {
            /* 미해당/해당 폰트 사이즈 조절 */
            font-size: 20px;
        }
        #programmerNoArea {
            /* 개발자 여부 관련 틀잡기 용도... */
            margin-top: 0;
            width: 50px;
        }
        #proNo {
            /* 개발자 여부 관련 틀잡기 용도... */
            margin-right: 50px;
        }
        #programmerYesArea {
            /* 개발자 여부 관련 틀잡기 용도... */
            margin-top: 0;
            width: 50px;
        }
        #inputCareerArea {
            /* 경력 관련 틀잡기 용도... */
            margin-top: 0;
        }
        #inputCareerYearArea {
            /* 경력 관련 틀잡기 용도... */
            width: 30%;
            margin-left: 0;
            margin-right: 10px;
        }
        #inputCareerMoonthArea {
            /* 경력 관련 틀잡기 용도... */
            width: 30%;
            margin-left: 50px;
            margin-right: 10px;
        }
        #idDuplicationConfirmation {
            /* 아이디 중복확인 버튼 위치잡기용 */
            float: right;
            margin-top: 40px;
        }
        #nicknameDuplicationConfirmation {
            /* 닉네임 중복확인 버튼 위치잡기용 */
            float: right;
            margin-top: 40px;
        }
        #emailDuplicationConfirmation {
            /* 이메일 중복확인 및 인증 버튼 위치잡기용 */
            float: right;
            margin-top: 40px;
        }
        #summitArea {
            /* 회원가입, 취소버튼 영역 위치잡기 용도 */
            margin: 0;
            width: 750px;
            height: 150px;
        }
        /*가을수정,margin-right 생성수정*/
        #joinButton {
            /* 회원가입 버튼 */
            float: right;
            margin-right: 70px;
        }
        /*가을수정,margin-right 생성수정*/      
        #cancelButton {
            /* 취소버튼 */
            float: right;
            margin-left: 20px;
            margin-right: 300px;
        }

        #summitArea>button {
            /* 회원가입, 취소버튼 위치잡기 용도 */
            margin-top: 50px;
        }

    </style>


</head>

<body>

   <jsp:include page="../common/headerMain.jsp" />
 
    <div class="body" id="join">
        <hr>
        <div id="titleArea">
            <span id="titleText">회원가입</span> <br>
            <span style="font-size: 20px;">* 표시가 되어있는 항목은 필수입력 항목입니다.</span> <br>
        </div>

        <hr>
        <%-- <form method="POST" action="signUpCoja" name="signUpFormCoja" onsubmit="return validate();" id="join"> --%>
        <form method="POST" action="signUpCoja" name="signUpFormCoja" onsubmit="return validate();" id="join">
            <div class="wrap">

                <div class="form-group">
                    <label for="inputId">* 아이디</label>
                    <input type="text" class="form-control" id="id" name="id" required>
                    <span id="checkId">&nbsp;</span>
                </div>

                <div class="form-group">
                    <label for="inputPw1">* 비밀번호</label>
                    <input type="password" class="form-control" id="pw1" name="pw1" required>
                    <span id="checkPw1">&nbsp;</span>
                </div>

                <div class="form-group">
                    <label for="inputPw2">* 비밀번호 확인</label>
                    <input type="password" class="form-control" id="pw2" name="pw2" required>
                    <span id="checkPw2">&nbsp;</span>
                </div>

                <div class="form-group">
                    <label for="inputName">* 이름</label>
                    <input type="text" class="form-control" id="name" name="name"required>
                    <span id="checkName">&nbsp;</span>
                </div>

                <div class="form-group">
                    <label for="nickname">* 닉네임</label>
                    <input type="text" class="form-control" id="nickName" name="nickName" required>
                    <span id="checkNickName">&nbsp;</span>
                </div>

                <div class="form-group">
                    <label for="email">* 이메일 주소</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                    <span id="checkEmail">&nbsp;</span>
                </div>

                <div class="form-group" id="programmerYNArea">
                    개발자 여부<br>
                    <div class="form-check form-check-inline" id="programmerNoArea">
                        <input class="form-check-input" type="radio" id="workExpNo" name="workExp" value="N"
                            checked required>
                    </div>
                    <label class="form-check-label" for="workExpNo" id="proNo">미해당</label>

                    <div class="form-check form-check-inline" id="programmerYesArea">
                        <input class="form-check-input" type="radio" id="workExpYes" name="workExp" value="Y">
                    </div>
                    <label class="form-check-label" for="workExpYes">해당</label>
                </div>

                <div class="form-row">
                    <div id="inputCareerArea">개발자 경력<span style="font-size: 18px;">(선택)</span></div>
                    <div id="inputCareerYearArea">
                        <input type="number" class="form-control w-100" id="inputCareerYear" name="expYr" min="0" max=30 step=1 value=0>
                    </div>년
                </div>



<%--가을 수정,submit은 한곳에서만 사용가능해서 취소버튼은 굳이안해도되서 버튼으로 변경했습니다.
onclick="history.back() <-, ()괄호추가.
--%>
                <div id="summitArea">
             
                    <button type="button" class="btn btn-secondary btn-lg" id="cancelButton"
                        onclick="history.back()">취소</button>
                    <button type="submit" class="btn btn-primary btn-lg" id="joinButton">회원가입</button>
                </div>
            </div>
        </form>

    </div>
    
    <jsp:include page="../common/footer.jsp" />
    
    <script src="${contextPath}/resources/js/member.js"></script>
    

   <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>


</body>

</html>