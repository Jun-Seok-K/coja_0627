<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>아이디 찾기</title>

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
      body * {
        font-family: "NEXON Lv1 Gothic OTF";
      }
      div {
        /*border: 1px solid black;*/
        box-sizing: border-box;
        width: 1200px;
        left: 0;
        right: 0;
        margin: auto;
      }
      /******************************* 본문 시작*/
      #titleArea {
        /* 제목 영역 */
        width: 1000px;
        height: 100px;
      }
      /*가을 수정 :margin-left: 300px;*/
      #titleText {
        /* 상단의 "회원가입" 텍스트 */
        display: inline-block;
        margin-top: 30px;
        font-size: 45px;
        margin-left: 250px;
      }
      /*가을 수정 margin-right생성*/
      .wrap {
        position: relative;
        width: 750px;
        margin-left: 300px;
      }
      .wrap > div {
        /* 각 항목에 대한 div */
        /* background-color: red; */
        width: 600px;
        height: 100px;
        margin: 50px;
        font-weight: bold;
        font-size: 24px;
      }
      #findIdText {
        font-size: 16px;
      }
      #inputName {
        width: 400px;
      }
      #inputEmail {
        width: 400px;
      }
      #receiveNumBtnArea {
        width: 135px;
        float: right;
        margin-top: -40px;
      }
      #inputNum {
        width: 400px;
      }
      #btnArea {
        width: 660px;
        height: 60px;
        margin-bottom: 30px;
      }
      /*가을수정,margin-left 생성*/
      #perviousBtn {
        width: 120px;
        height: 55px;
        float: left;
        margin-left: 150px;
      }
      #perviousBtn > button {
        width: 170px;
      }
      #nextBtn {
        width: 120px;
        height: 55px;
        float: right;
      }
      #nextBtn > button {
        width: 120px;
      }
    </style>
  </head>

  <body>
    <jsp:include page="../common/headerMain.jsp" />

    <div class="body">
      <hr />
      <div id="titleArea"><span id="titleText">아이디 찾기</span> <br /></div>

      <hr />

      <form method="POST" action="findID" name="findIDForm" id="findId">
        <div class="wrap">
          <div>
            <span id="findIdTitle">본인확인 </span><br />
            <span id="findIdText"
              >가입 시 입력한 이름과 이메일 주소가 같아야 아이디를 확인할 수
              있습니다.</span
            >
          </div>

          <div>
            <label for="inputName">이름</label>
            <input
              type="text"
              class="form-control"
              id="inputName"
              name="name"
              required
            />
          </div>

          <div class="form-group">
            <label for="inputEmail">이메일 주소</label>
            <input
              type="email"
              class="form-control"
              id="inputEmail"
              name="email"
              required
            />
          </div>

          <div class="form-group">
            <div id="perviousBtn">
              <button
                type="submit"
                class="btn btn-primary btn-lg"
                id="pervious"
              >
                아이디 찾기
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>

    <jsp:include page="../common/footer.jsp" />

    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"
    ></script>
  </body>
</html>