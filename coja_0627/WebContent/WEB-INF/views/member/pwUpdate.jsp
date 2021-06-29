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
        @font-face {
            font-family: 'NEXON Lv1 Gothic OTF';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body * {
            font-family: 'NEXON Lv1 Gothic OTF';
        }
        
        div{
        /* border: 1px solid black; */
        }

        /* ------------------------------영역구분선------------------------------ */

        /* 블로그 전체 본문영역 div */
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
        
        .form-group{
        width: 500px;
        }
        
        .btn-lg{
        width: 300px;
        }

    </style>

</head>

<body>
    <!-- header -->
    <jsp:include page="../common/headerMain.jsp" />

    <!-- content -->
    <div class="body">
        <hr>
        <div id="titleArea" align="center">
            <span id="titleText"><h1>비밀번호 변경<h1></h1></span> <br>
        </div>

        <hr>
        <div class="bg-white rounded shadow-sm container p-3">
            <form method="POST" action="pwUpdate" name="pwUpdate" onsubmit="return pwdValidate();" role="form">
                <div class="wrap" align="center">

                    <div class="form-group" align="left">
                        <label for="currentPw">현재 비밀번호 확인</label> 
                        <input type="password" class="form-control" id="currentPw" name="currentPw">
                        <span id="cpw">&nbsp;</span>
                    </div>

                    <div class="form-group" align="left">
                        <label for="newPw1">새로운 비밀번호</label> 
                        <input type="password" class="form-control" id="pw1" name="pw1" placeholder="새로운 비밀번호를 입력해주세요.">
                        <span id="checkPw1">&nbsp;</span>
                    </div>

                    <div class="form-group" align="left">
                        <label for="newPw2">새로운 비밀번호 확인</label> 
                        <input type="password" class="form-control" id="pw2" name="pw2" placeholder="새로운 비밀번호를 다시 입력해주세요."> <span id="pwVali"></span>
                        <span id="checkPw2">&nbsp;</span>
                    </div>

                </div>

                <div id="btnArea">
                    <div id="nextBtn" align="center">
                        <button type="submit" class="btn btn-primary btn-lg" id="next">비밀번호 수정</button>
                    </div>
                </div>
                
            </form>
        </div>
    </div>

    <!-- footer -->
    <jsp:include page="../common/footer.jsp" />
	<script src="${contextPath}/resources/js/member.js"></script>
    <script>
        // 비밀번호 유효성 검사  
        function pwdValidate() {
            const regExp = /^[a-zA-Z0-9\#\-\_]{6,20}$/;
            const newPw1 = $("#pw1").val().trim();
            const newPw2 = $("#pw2").val().trim();

            if (!regExp.test(newPw1) || (newPw1 != newPw2)) {

                swal({
                    "icon": "error",
                    "title": "새 비밀번호가 유효하지 않습니다.",
                    "text": "영문대소문자,숫자,#,-,\_ 6글자 이상 20글자 이하"
                });

                return false;
            }
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>

</body>

</html>