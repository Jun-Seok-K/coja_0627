<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Admin Member List</title>
   
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

      /* border 주석 풀면 전체적인 div 구획 확인 가능 */
      /*div {
            border: 1px solid black;
            box-sizing: border-box;
        }
      */
      .header {
         /* background-color: red; */
         width: 1200px;
         height: 80px;
         margin: auto;
         box-sizing: border-box;
         text-align: left;
         line-height: 70px;
         border-bottom: 1px solid lightgray
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
         width: 75%;
         display: inline-block;
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

      #bt-1 {
         background-color: gainsboro;
      }
      /* header 끝 */
      /* ---------------------------구분선------------------------ */
      /* 관리자 네비관련 */
      #navi{
          width: 1200px;
         height: auto;
         margin: auto;
         box-sizing: border-box;
         text-align: left;
         line-height: 70px;
         border-bottom: 1px solid lightgray;
         background-color : pink;
      }
      
      #navi li a:hover {
         color: #c7f1ec;
      }
      
      .navi-a{
         text-decoration: none;
      display: inline-block;
      }
      .navi-li{
         text-align: center;
         float:left;
         margin-left : 50px;
         margin-right: 50px
      }
      .navi-ul{
         list-style-type: none;
      }
   </style>
</head>

<body>

   <!-- header -->
      <div class="header">
      <!-- 로고 -->
      <div class="header-logobox">
         <a href="${contextPath}"><img
               src="https://assets.bigcartel.com/theme_images/10846261/cojalogo.png?auto=format&fit=max&h=500&w=1800"
               id="header-logo"></img></a>
      </div>

      <!-- 검색 -->
      <div class="header-searchbox">

      </div>

      <!-- 버튼3 -->
      <div class="header-buttonbox">

         <button type="button" class="header-button btn btn-secondary" id="bt-1">관리자모드</button>
         <button type="button" class="header-button btn btn-secondary" id="logout-btn">로그아웃</button>
      </div>
      </div>

   <!-- ===============================영역구분선=============================== -->
   <div id="navi">
      <ul class="navi-ul">
         <li class="navi-li"><a class="navi-a" href="${contextPath}/admin/main/mainConfiguration">Main</a></li>
         <li class="navi-li"><a class="navi-a" href="${contextPath}/admin/member/memberList">Members</a></li>
         <li class="navi-li"><a class="navi-a" href="${contextPath}/admin/board/boardList">Boards</a></li>
         <li class="navi-li"><a class="navi-a" href="${contextPath}/admin/blog">Blogs</a></li>
         <li class="navi-li"><a class="navi-a" href="${contextPath}/admin/blog">Reports</a></li>
      </ul>
   </div>
   <!-- 전체 div를 포함하는 영역 -->
   <!-- ===============================영역구분선=============================== -->
   
   

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"></script>
      
      
   	<script>
		document.getElementById("logout-btn").addEventListener("click",function() {
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

									window.location.href = "${contextPath}/admin/logout";
								}
							});
		});
	</script>

</body>

</html>