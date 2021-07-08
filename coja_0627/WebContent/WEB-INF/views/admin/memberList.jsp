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
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

   <style>

      /* ------------------------------영역구분선------------------------------ */
	  /* userInfoArea div와 contentArea div를 감싸는 div */
      #contentContainer {
         /* background-color: red;*/
         margin: auto;
         width: 1200px;
         height: auto;
      }
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
      /* 제목 a태그 색 변경 */
      #list-table td:nth-child(3)>a {
         color: black;
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
   </style>
</head>

<body>

	<jsp:include page="../common/headerAdmin.jsp" />
   <!-- 전체 div를 포함하는 영역 -->
      <!-- ===============================영역구분선=============================== -->
   <div id="contentContainer">
   
      <div id="contentArea">
         <div id="h-menu">
            <div class="h-div"><h2><span id="listTitle">전체 회원</span> 리스트</h2></div>
            <div class="mem-menu">
               <form method="POST" action="memberList">
                  <select name="memberOption">
                     <option value="memberList" selected>전체 회원</option>
                     <option value="warningMember">신고 회원</option>
                     <option value="blindMember">정지 회원</option>
                     <option value="closedAccount">탈퇴 계정</option>
                  </select>
                  <button type="submit">조회</button>
               </form>
            </div>
         </div>
         <div class="list-wrapper">
         
            <table class="table table-hover table-striped my-1" id="list-table">
            
               <thead>
               
                  <tr>
                     <th>회원번호</th>
                     <th>아이디</th>
                     <th>이름</th>
                     <th>닉네임</th>
                     <th>이메일</th>
                     <th>가입일</th>
                     <th>경력여부</th>
                     <th>연차</th>
                     <th>신고</th>
                     <th>회원상태</th>
                     <th>상태 변경</th>
                  </tr>
               </thead>

               <tbody>
                   <tr>
                   <c:choose>
                       <%-- 조회된 게시글 목록이 없는 경우 --%>
                          <c:when test="${empty memberList}">
                             <tr>
                                <td colspan="7">회원이 존재하지 않습니다</td>
                             </tr>
     
                          </c:when>
     
                       <%-- 회원 목록이 있을 경우 --%>
     
                          <c:otherwise>
  
                             <c:forEach items="${memberList}" var="member">
                                <tr>
                                   
                                      <%--회원번호(No) --%>
                                      <td>${member.memNo}</td>
                                      <%-- 회원아이디 --%>
                                      <td>${member.memId}</td>
                                      <%-- 회원이름 --%>
                                      <td>${member.memNm}</td>
                                      <%-- 닉네임 --%>
                                      <td>${member.memNick}</td>
                                      <%-- 이메일 --%>
                                      <td>${member.memEmail}</td>
                                      <%-- 가입일 --%>
                                      <td>${member.memEnrollDt}</td>
                                      <%-- 경력여부 --%>
                                      <td>${member.memWorkExp}</td>
                                      <%-- 연차 --%>
                                      <td>${member.memExpYr}</td>
                                      <%--신고횟수 --%>
                                      <td>${member.memWarningPoint}</td>
                                      <%-- 회원 상태--%>
                                      <td>   
                                         <select name="memberStatus" >
                                         <c:if test="${member.memStatus=='Y'}">
                                    <option value="Y" selected>Y</option>
                                    <option value="S">S</option>
                                    <option value="N">N</option>
                                         </c:if>
                                         <c:if test="${member.memStatus=='S'}">
                                    <option value="Y">Y</option>
                                    <option value="S" selected>S</option>
                                    <option value="N">N</option>
                                         </c:if>
                                         <c:if test="${member.memStatus=='N'}">
                                    <option value="Y">Y</option>
                                    <option value="S">S</option>
                                    <option value="N" selected>N</option>
                                         </c:if>
                                 </select>
                              </td>
                                      <%-- 회원 상태 변경 버튼--%>
                              <td><button type="button" onclick="updteStatus(${member.memNo}, this);">상태변경</button></td>
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

         <div class="my-2">
            <ul class="pagination my-2">
            
<%--                <c:set var="pageURL" value="list?type=${pagination.boardType}" />
            <c:set var="prev" value="${pageURL}&cp=${pagination.prevPage}" /> 
            <c:set var="next" value="${pageURL}&cp=${pagination.nextPage}" /> 
 --%>
               <c:set var="pageURL" value="memberList" />
               
               <%-- memberOption이 파라미터로 있을 경우 --%>
               <c:if test="${!empty param.memberOption}">
                  <c:set var="op" value="&memberOption=${param.memberOption}"/>
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

         <!----------------------------------------------------------------------------------------------  Pagination end -->

         <!-- 검색창 -->
         <div class="my-2">
            <form action="#" method="GET" class="text-center" id="searchForm">
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
                           <option value="nick">닉네임으로 검색</option>
                           <option value="content">닉네임으로 검색</option>
                           <option value="writer">아이디로 검색</option>
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
   
   

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"></script>


   <script>
   
      $("select[name='memberOption'] > option").each(function(index, item){
         if( $(item).val() == "${param.memberOption}" ){
            $(item).prop("selected", true);
            $("#listTitle").text($(item).text());
         }
      });
   
   </script>

   <script>
   
   /*$(function(){
      $("#memberStatusUpdate-btn").click(function(){
         funUpdateStatus();
      })
   })
   
   function funUpdateStatus(){
      const memStatus = $("#memberStatus").val();
      console.log(memStatus);
   }*/
   
      function updteStatus(memNo, btn){
      
         const memberStatus = $(btn).parent().prev().children("select").val();
         
         $.ajax({
            url : "${contextPath}/admin/member/memberStatusUpdate",
            data : {"memNo" : memNo, "memStatus" : memberStatus},
            type : "POST",
            success : function(result){
               if(result > 0){
                  alert("변경 성공");
               }
            },
            error : function(){
               console.log("실패");
            }
         })
      
      
      }
   
   
   
   </script>


</body>

</html>