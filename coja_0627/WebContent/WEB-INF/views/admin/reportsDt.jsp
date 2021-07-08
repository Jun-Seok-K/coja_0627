<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Admin Member List</title>

   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

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
        div {
            /*border: 1px solid black;*/
            box-sizing: border-box;
        }

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

 

        /* ------------------------------영역구분선------------------------------ */


        /* 블로그 전체 본문영역 div */
        #contentArea {
            /*background-color: lightgray;*/
            width: 896px;
            margin-right: 0;
            height: 1000px;
            float: left;
        }

        /* 블로그 본문 영역 확인용 css */
        #contentArea>div {
            /* background-color: orange;*/
        }

        /* 블로그 본문 영역 확인용 css */
        #contentArea>div>div {
            /* background-color: tomato; */
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

        /* content-box 자식 중 첫 번째 div */
        /*고객센터 게시글 상세조회*/
        .content-box>div:first-of-type {
            width: 100%;
            height: 60px;
            width: 100%;
            font-size: 30px;
        }

        /* ---------------------------구분선------------------------ */

        .navi-box {
            width: 200px;
            height: 165px;
            margin: auto;
            margin-top: 60px;


        }

        .navigator {
            text-align: center;
            line-height: 100px;
        }

        /* 관리자 네비관련 */
        #navi li a:hover {
            color: #c7f1ec;
        }

        #navi li a {
            width: 100%;
            height: 100%;
            display: inline-block;
            text-decoration: none;
            color: rgba(0, 0, 0, 0.5);
            font-weight: bold;
            font-size: 15px;
        }


        .content-box {
            width: 700px;
            height: 900px;
            margin: auto;
            margin-top: 40px;
            box-sizing: border-box;
            /* margin-botton: 40px;  --> 40px 만큼 아래쪽 공백 준거임 */
            margin-bottom: 40px;
        }

        .next {
            width: 50%;
            /* 부모 너비의 50% (좌우 2분할)*/
            height: 100%;
            /* 부모 높이 100% */
            float: left;
            margin: auto;
            margin-left: 0;
            text-align: center;
            line-height: 100px;
            font-size: 20px;

        }

        .next1 {
            width: 50%;
            /* 부모 너비의 50% (좌우 2분할)*/
            height: 100%;
            /* 부모 높이 100% */
            float: left;
            margin: auto;
            text-align: center;
            line-height: 200px;
            font-size: 20px;

        }

        #img {
            width: 130px;
            height: 130px;
            margin: auto;
            margin-top: 15px;
            border-radius: 50%;
            background-color: gainsboro;
        }

        .btn-group-toggle {
            text-align: center;
            line-height: 50px;
            border-style: none;
        }

        .title1 {
            width: 100px;
            height: 70px;
            text-align: center;
            line-height: 70px;
            border-style: none;
        }

        /*1:1문의,신고글,기타 글*/
        .qna {
            font-size: 20px;
            color: black;
        }

        .qna a:hover {
            color: #c7f1ec;
        }

        /*1:1문의,신고글,기타 박스*/
        .list3 {
            /*border-right: 1px solid lightgray;*/
            width: 150px;
            height: 50px;
            text-align: center;
            line-height: 50px;
            float: left;
            color: black;
        }
        #one_one{
            border-right: 1px solid lightgray;
        }

        /* 밑줄 삭제 구문... */
        .list3>a{
            text-decoration: none;
        }


        /*고객센터,등타이틀*/
        .one_one_title {
            width: 100%;
            height: 50px;
            margin-left: 0;
            float: left;
            font-size: 40px;
        }

        /*제목*/
        .one_title {
            width: 50%;
            height: 50px;
            font-size: 30px;
            float: left;

        }

        /*날짜*/
        .yy_mm {
            width: 50%;
            height: 50px;
            font-size: 20px;
            float: right;
            text-align: right;
            line-height: 50px;

        }

        /*내용 텍스트*/
        .one_text {
            width: 100%;
            height: 70%;
            float: left;
            font-size: 20px;
            line-height: 40px;
            border-style: groove;
        }        

        .board-table {
            margin-top: 10px;
            margin-left: 90px;
            margin-right: 90px;
        }

        /*페이지버튼*/
        #pagingBtnArea {
            margin: auto;
            margin-top: 40px;
            margin-bottom: 20px;
            width: 240px;
            height: 38px;
        }

       /* #deleteBtn{
           margin-top: 20px; 
        }
        #backlist{
            margin-top: 20px;
        }*/
        .endbar{
            width: 100%;
            height: 660px;
        }
    </style>
</head>

<body>
    
    </div>

    <!-- ===============================영역구분선=============================== -->

    <!-- 전체 div를 포함하는 영역 -->
    <div id="contentContainer">
       


        <!-- 본문 영역 -->
        <div id="contentArea">
            <div class="content-box">
                <div class=gogeksemter-SS> 게시글 상세조회</div>

                <%-- 글 제목 --%>
                 <div class="one_title"><a href="view?no=${param.no}&cp=${param.cp}&type=${param.type}">
				 ${reports.rptTitle}
                   </a></div>
                 <%--회원이름 --%>
                <div class="yy_mm">${reports.memNm}</div>
                <%--작성일 --%>
                <div class="yy_mm">
                <td>
			          <fmt:formatDate var="createDate" value="${reports.rptCreateDt}" pattern="yyyy-MM-dd" />
			          <fmt:formatDate var="today" value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd" />
			                                        
			          <c:choose>
			          <%-- 글 작성일이 오늘이 아닐 경우 --%>
			          <c:when test="${reports.rptCreateDt != today}">
			          ${reports.rptCreateDt}
			          </c:when>
			                                        
			          <%-- 글 작성일이 오늘일 경우 --%>
			          <c:otherwise>
			                <fmt:formatDate value="${reports.rptCreateDt}" pattern="HH:mm" />
			          </c:otherwise>
			          </c:choose>
		         </td>
		         </div>
                 <%--글 내용 --%>
                 <div class="one_text">${reports.rptCnt}</div>
                 <div class="endbar"></div>                     
                
                    <div id="backlist"><a href="${contextPath}/admin/reports/reportsList" class="btn btn-primary float-right mr-2">목록으로</a></div>
                    
                </div>
                <div>   
                </div>

          <!----------------------------------------------------------------------------------------------  content end -->


        </div>
    </div>

    <!-- ===============================영역구분선=============================== -->
    <jsp:include page="../common/footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
       integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
       crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
       integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
       crossorigin="anonymous"></script>

</body>

</html>