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
         .content {
            /* background-color: tomato; */
            width: 1200px;
            margin: auto;
        }
        .con-terms{
            width:1000px;
            margin:auto;
        }
        .terms-title{
            margin-top : 50px;
            font-size: 40px;
            font-weight: bold;
        }
        .terms-content{
            margin-top : 30px;
            font-size: 20px;

        }
        .terms-button{
            margin-top : 30px;
            margin-bottom : 50px;
            text-align: center;
        }

    </style>


</head>

<body>

	<jsp:include page="../common/headerMain.jsp" />
 
    <div class="content">
        <div class="con-terms">
            <div class="terms-title">
                <span>회원가입 약관</span>
            </div>
            <div class="terms-content">
                <div>회원가입 약관 내용꾸며 내려온 동
                    력은 바로 이것이다 이성은 투명하되 얼음과 
                    같으며 지혜는 날카로우나 갑 속에 든 칼이다 
                    청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 
                    얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이</div>
            </div>
            <div class="terms-button">
                <form action="${contextPath}/member/signUpCoja" 
               		method="get" onsubmit="return retudisagree();">
                    <input type="checkbox" name="agree" id="agree">
                 	<label for="agree">위 약관에 동의합니다.</label>

                    <br>


					<button type="submit">회원가입</button>	

                </form>
            </div>


        </div>
        
    </div>
    
    <jsp:include page="../common/footer.jsp" />
    
    <script src="${contextPath}/resources/js/member.js"></script>
    
   	<script>
	// 약관 동의가 체크 되었을 때에만 탈퇴 진행 (약관동의 체크박스 name/id = agree)
		function retudisagree(){
			if( !$("#agree").prop("checked")) {
			
				swal({"icon" : "info" , "title" : "약관에 동의해야 가입할 수 있습니다."})
				console.log("체크안됨");
				
				return false;
			}
		}
	</script>
    

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>


</body>

</html>