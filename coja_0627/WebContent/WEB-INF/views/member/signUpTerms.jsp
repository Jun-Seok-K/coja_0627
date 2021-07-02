<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<c:set
  var="contextPath"
  scope="application"
  value="${pageContext.servletContext.contextPath}"
/>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>html문서 제목</title>

    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style>
      @font-face {
        font-family: "NEXON Lv1 Gothic OTF";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }
      .content {
        /* background-color: tomato; */
        width: 1200px;
        margin: auto;
      }
      .con-terms {
        width: 1000px;
        margin: auto;
      }
      .terms-title {
        margin-top: 50px;
        font-size: 40px;
        font-weight: bold;
      }
      .terms-content {
        border: 1px solid gainsboro;
        margin-top: 30px;
        font-size: 20px;
      }
      .terms-button {
        margin-top: 30px;
        margin-bottom: 50px;
        text-align: center;
      }
      
      #signup-btn{
      	margin-top: 30px;
      	width: 220px;
      }
      
      #agree+label{
      	font-size: 20px;
      }
      
      .terms-content>div{
      	padding: 40px;
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
          <div>
            제1조(목적)<br />
            본 회원약관은 COJA(이하 '갑'라 한다)이 운영하는 인터넷관련
            서비스(이하 '서비스'라 한다)를 이용함에 있어<br />
            관리자와 이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을
            규정함을 목적으로 한다. <br />
            <br />
            제2조 ('갑'의 의무) <br />
            1. '갑'은 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을
            다하여야 합니다.
            <br />
            2.'갑'은항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여
            관리에 만전을 기함으로서 <br />회원의 정보보안에 최선을 다하여야
            합니다.<br />
            <br />
            제3조(회원의 의무)<br />
            1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이
            통지하는 사항을 준수하여야 하며,<br />
            기타 '갑'의 업무에 방해되는 행위를 하여서는 안됩니다. <br />
            2.회원은 '갑'의 사전 승낙없이 서비스를 이용하여 어떠한 영리 행위도
            할 수 없습니다. <br />
            3.회원은 서비스를 이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사,
            복제,변경, 번역, 출판,방송<br />
            기타의 방법으로 사용하거나 이를 타인에게제공할 수 없습니다.<br />
            <br />
          </div>
        </div>
        <div class="terms-button">
          <form
            action="${contextPath}/member/signUpCoja"
            method="get"
            onsubmit="return retudisagree();"
          >
            <input type="checkbox" name="agree" id="agree"/>
            <label for="agree">위 약관에 동의합니다.</label>

            <br />

            <button type="submit" class="btn btn-primary btn-lg" id="signup-btn">회원가입</button>
          </form>
        </div>
      </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

    <script src="${contextPath}/resources/js/member.js"></script>

    <script>
      // 약관 동의가 체크 되었을 때에만 탈퇴 진행 (약관동의 체크박스 name/id = agree)
      function retudisagree() {
        if (!$("#agree").prop("checked")) {
          swal({ icon: "info", title: "약관에 동의해야 가입할 수 있습니다." });
          console.log("체크안됨");

          return false;
        }
      }
    </script>

    <script
      src="https://code.jquery.com/jquery-3.4.1.min.js"
      integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"
    ></script>
  </body>
</html>