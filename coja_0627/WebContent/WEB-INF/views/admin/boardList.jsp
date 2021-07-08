<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Admin Board List</title>

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

      /* ------------------------------영역구분선------------------------------ */

      /* userInfoArea div와 contentArea div를 감싸는 div */
      #contentContainer {
         /* background-color: red;*/
         margin: auto;
         width: 1200px;
         height: auto;
      }

      /* ---------------------------구분선------------------------ */
/*       .navi-box {
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

      /* ------------------------------영역구분선------------------------------ */

      /* content ) 게시글 목록 스타일 */
      #contentArea{
      }
      #h-menu{
         clear :both;
      }
      .h-div{
         float:left;
         width : 21%;
      }
      .mem-menu{
         display: inline-block;
         float: left;
         width : 50%;
      }
      
      .container {
         /* border : 1px solid red; */
         width: 896px;
         height: auto;
         float: left;
         margin-top: 5%;
      }

      /* 컬럼명 가운데 정렬 */
      #list-table th {
         text-align: center;
      }

      /* 게시글 제목을 제외한 나머지 가운데 정렬 */
      #list-table td:not(:nth-of-type(3)) {
         text-align: center;
      }

      /* 게시글 목록의 높이가 최소 540px은 유지하도록 설정 */
      .list-wrapper {
         min-height: 540px;
      }

      /* 글 제목 영역의 너비를 table의 50% 넓게 설정
      #list-table td:nth-child(3) {
         width: 50%;
      }*/

      /* 제목 a태그 색 변경 */
      #list-table td:nth-child(3)>a {
         color: black;
      }

      /* 게시글 제목에 영역 이미지 설정 */
      .boardTitle img {
         width: 70px;
         padding: 10px
      }

      /* pagination 가운데 정렬 */
      .pagination {
         justify-content: center;
      }

      #searchForm {
         position: relative;
      }

      #searchForm>* {
         top: 0;
      }
      /* ------------------------------영역구분선------------------------------ */
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
         <button type="button" class="header-button btn btn-secondary" id="bt-1">로그아웃</button>
      </div>
      </div>

   <!-- ===============================영역구분선=============================== -->
   <div id="navi">
      <ul class="navi-ul">
         <li class="navi-li"><a class="navi-a" href="${contextPath}/main">Main</a></li>
         <li class="navi-li"><a class="navi-a" href="${contextPath}/member/memberList">Members</a></li>
         <li class="navi-li"><a class="navi-a" href="${contextPath}/board/boardList">Boards</a></li>
         <li class="navi-li"><a class="navi-a" href="${contextPath}/blog">Blogs</a></li>
         <li class="navi-li"><a class="navi-a" href="${contextPath}/blog">Reports</a></li>
      </ul>
   </div>
   <!-- 전체 div를 포함하는 영역 -->
   <div id="contentContainer">
      <!-- ===============================영역구분선=============================== -->
   
      <div id="contentArea">
         <div id="h-menu">
            <div class="h-div"><h2><span id="listTitle">게시판</span> 리스트</h2></div>
            <div class="mem-menu">
               <form method="POST" action="boardList">
                  <select name="boardOption">
                     <option value="boardList" selected>전체글</option>
                     <option value="notice">공지글</option>
                     <option value="free">자유글</option>
                     <option value="qna">질문글</option>
                     <option value="delete">삭제글</option>
                  </select>
                  <button type="submit">조회</button>
               </form>
            </div>
         </div>
         <div class="list-wrapper">
            <table class="table table-hover table-striped my-1" id="list-table">

               <thead>
                  <tr>
                     <th>No.</th>
                     <th>카레고리</th>
                     <th>글제목</th>
                     <th>작성자</th>
                     <th>작성일</th>
                     <th>신고횟수</th>
                  </tr>
               </thead>

               <tbody>
                   <c:choose>
                       <%-- 조회된 게시글 목록이 없는 경우 --%>
                          <c:when test="${empty boardList}">
                             <tr>
                                <td colspan="7">게시글이 존재하지 않습니다</td>
                             </tr>
     
                          </c:when>
     
                       <%-- 회원 목록이 있을 경우 --%>
     
                          <c:otherwise>
  
                             <c:forEach items="${boardList}" var="board">
                                <tr >
                                      <%--게시글 번호(No.) --%>
                                      <td>${board.boardNo}</td>
                                      <%-- 카테고리 --%>
                                      <td>${board.boardTypeNm}</td>
                                      <%-- 글제목 --%>
                                      <td>${board.boardTitle}</td>
                                      <%-- 작성자 --%>
                                      <td>${board.memNm}</td>
                                      <%-- 작성일 --%>
                                      <td>${board.boardCreateDate}</td>
                                      <%-- 신고횟수 --%>
                                      <td>${board.boardWarn}</td>
                                </tr>
                             </c:forEach>
                          </c:otherwise>
                 </c:choose>
               </tbody>
            </table>
         </div>
         <!----------------------------------------------------------------------------------------------  content end -->

         <!----------------------------------------------------------------------------------------------  Pagination start -->
         <!-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 -->
		<c:if test="${empty param.sk && empty param.sv }">
		
         <div class="my-2">
            <ul class="pagination my-4">
            
<%--        <c:set var="pageURL" value="list?type=${pagination.boardType}" />
            <c:set var="prev" value="${pageURL}&cp=${pagination.prevPage}" /> 
            <c:set var="next" value="${pageURL}&cp=${pagination.nextPage}" /> 
 --%>
               <c:set var="pageURL" value="boardList" />
               
               <%-- boardOption이 파라미터로 있을 경우 --%>
               <c:if test="${!empty param.boardOption}">
                  <c:set var="op" value="&boardOption=${param.boardOption}"/>
               </c:if>
               
            <c:set var="prev" value="${pageURL}?cp=${pagination.prevPage}${op}" /> 
            <c:set var="next" value="${pageURL}?cp=${pagination.nextPage}${op}" /> 

               <!-- 현재 페이지가 10페이지 초과인 경우 -->
               <c:if test="${pagination.currentPage > pagination.pageSize }">
                  <li><a class="page-link" href="${prev}${op}"> &lt;&lt;</a></li>
               </c:if>

               <!-- 현재 페이지가 2페이지 초과인 경우 -->
               <c:if test="${pagination.currentPage > 1 }">
                  <li><a class="page-link" href="${pageURL}?cp=${pagination.currentPage - 1 }${op}"> &lt;</a></li>
               </c:if>

               <!-- 페이지 목록 -->
               <c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage }">
                  <c:choose>
                     <c:when test="${p == pagination.currentPage }">
                        <li class="page-item active"><a class="page-link">${p}</a></li>
                     </c:when>
                     <c:otherwise>
                        <li><a class="page-link" href="${pageURL}?cp=${p}${op}">${p}</a></li>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>

               <!-- 현재 페이지가 마지막 페이지 미만인 경우 -->
               <c:if test="${pagination.currentPage < pagination.maxPage }">
                  <li><a class="page-link" href="${pageURL}?cp=${pagination.currentPage + 1 }${op}"> &gt;</a></li>
               </c:if>

               <!-- 현재 페이지가 마지막 페이지 미만인 경우 -->
               
               <c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
                  <li><a class="page-link" href="${next}${op}"> &gt;&gt;</a></li>
               </c:if>
            </ul>
         </div>
         
		</c:if>   
         <!----------------------------------------------------------------------------------------------  Pagination end -->

         <!-- 검색창 -->
           <div class="my-2">
            <form action="boardList" method="GET" class="text-center" id="searchForm">
            
               <div class="container2">
                  <div class="row">
                     <div class="col-sm" align="right">
                        <button class="form-control btn btn-primary"
                           style="width:100px; display: inline-block;">검색</button>
                     </div>
                     <div class="col-sm">
                        <input type="text" name="sv" class="form-control" style="width: 50%%; display: inline-block;">
                     </div>
                     <div class="col-sm" align="left">
                        <select name="sk" class="form-control" style="width: 200px; display: inline-block;">
                           <option value="title">글제목 검색</option>
                           <option value="content">내용 검색</option>
                           <option value="titcont">제목+내용 검색</option>
                           <option value="writer">작성자 검색</option>
                        </select>
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>

   <!-- ===============================영역구분선=============================== -->
   <jsp:include page="../common/footer.jsp" />

   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"></script>


   <script>
   /* select 옵션 관련 이벤트 */
	$("select[name='boardOption'] > option").each(function(index, item){
	   if( $(item).val() == "${param.boardOption}" ){
	      $(item).prop("selected", true);
	      $("#listTitle").text($(item).text());
	   }
	});
      
   /* 게시글 상세조회 관련 이벤트 */
  	$("#list-table td").on("click", function(){
		console.log( $(this).parent().children().eq(0).text().trim() );
		
		const boardNo = $(this).parent().children().eq(0).text().trim();
		
		location.href = "${contextPath}/admin/board/boardView?boardNo=" + boardNo;
		
	});
   
	   // 검색 내용이 있을 경우 검색창에 해당 내용을 작성해두는 기능
	   (function(){
	      var searchKey = "${param.sk}"; 
	      var searchValue = "${param.sv}";
	      
	      // 검색창 select의 option을 반복 접근
	      $("select[name=sk] > option").each(function(index, item){
	         if( $(item).val() == searchKey  ){
	            $(item).prop("selected", true);
	         }
	      });      
	      
	      $("input[name=sv]").val(searchValue);
	   })();
   
   
   
   </script>

</body>

</html>