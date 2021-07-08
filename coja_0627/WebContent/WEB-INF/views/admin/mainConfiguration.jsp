<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Admin Main</title>
   


   <style>

      /* userInfoArea div와 contentArea div를 감싸는 div */
      #contentContainer {
         /* background-color: red;*/
         margin: auto;
         width: 1200px;
         height: auto;
      }
      .h-div{
         float:left;
         width : 21%;
      }
      #navigator{
         display: inline-block;
         float: left;
         width : 50%;
      }
      
              /* 관리자 본문영역 전체 div */
        #admin-contentArea {
            width: 1200px;
            margin-right: 0;
            height: auto;
            float: left;
            box-sizing: border-box;
        }
        /* 캐러셀 관리 */
        #carouselArea-div{
            width: 100%;
            height:50%;
            box-sizing: border-box;
        }
        #carousel-btn {
            width: 100%;
            height:35%;
        }
        #carousel-btn > button {
            float: right;
        }
        #carousel-table-div{
            width: 100%;
            height:65%;
            text-align: center;
            clear: both;
            
        }

        /*-----------------------------------------------------------------------------*/

        /* 인기글 관리 */
        .post-table-div{
                    width: 100%;
            height:65%;
            text-align: center;
            clear: both;
        }
        #popularPostArea-div{
            width:100%;
            height:50%;
            box-sizing: border-box;
            margin-top: 50px;
        }
        #navigator {
            height: 60px;
        }

        /* 메뉴박스 */
        #navi {
            padding: 0;
            margin: 0;
            list-style-type: none;
            width: 100%;
            height: 100%;
        }
        /* 인기글 네비관련 */
        #navi>li {
            width: 11%;
            height: 100%;
            float: left;
            text-align: center;
            line-height: 80px;
            position: relative;
            cursor: pointer;
        }
        .h-div2{
        	float: right;
        	height : 60px;
        }
        /* ---------------------------구분선------------------------ */


   </style>
</head>

<body>
	<jsp:include page="../common/headerAdmin.jsp" />
	
   <!-- ===============================관리자  navi 끝=============================== -->
	<!-- 전체 div를 포함하는 영역 -->
	<div id="contentContainer">
	
		<div id="admin-contentArea">
			<!-- 캐러샐 관리 영역-->
				<div id="carouselArea-div">
					<div id="carousel-btn">
						<h2>Carousel Option</h2>
					</div>
					<div id="carousel-table-div">
					
						
						<table class="table table-hover table-sm" id="carousel-table">
							<thead>
								<tr >
									<th id="th1">디스플레이 여부</th>
									<th id="th2">캐러셀 번호</th>
									<th id="th3">이름</th>
									<th id="th4">디스플레이</th>
									<th id="th5">등록일</th>
									<th id="th6">경로</th>
									<th id="th7">목록에서 삭제</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${crsList}" var="carousel">
									<tr>
										<td>                                         
		                                        <c:if test="${carousel.crsDisplay=='Y'}">
		                                        	<input type="checkbox" name="crsDisplayCB" value="${carousel.crsNo}" checked>
				                                </c:if>
				                                <c:if test="${carousel.crsDisplay=='N'}">
		                                        	<input type="checkbox" name="crsDisplayCB" value="${carousel.crsNo}">
				                                </c:if>

	                                	</td>
										<%-- 캐러셀 번호 --%>
										<td>${carousel.crsNo}</td>
										<%-- 캐러셀 이름 --%>
										<td>
											<a href="${contextPath}/${carousel.crsURL}${carousel.crsNm}" target="_blank">
												${carousel.crsNm}
											</a>
										</td>
										<%-- 캐러셀 디스플레이 여부 --%>
										<td>${carousel.crsDisplay}</td>
										<%-- 캐러셀 등록일 --%>
										<td>${carousel.crsDt}</td>
										<%-- 캐러셀 경로 --%>
										<td>${carousel.crsURL}</td>
										<%-- 캐러셀 삭제 버튼 (실제로는 D로 변경) --%>
										<td><button type="button" onclick="deleteCarousel(${carousel.crsNo});">삭제</button></td>

									</tr>

								</c:forEach>
								<tr>
									<td colspan="6">
										<form method="POST" action="mainCarousel" enctype="multipart/form-data">
											<input type="file" id="img0" name="carousel"> 	<button type="submit">업로드</button><button type="reset">취소</button>
										</form>
									</td>

								</tr>
							</tbody>
						</table>
						
						<button type="button" onclick="updateCarousel(this);">저장</button>

						
					</div>

				</div>
			<hr>
<!--------------------------------------------------------------------------------------->
			<!-- 인기글 관리 영역 -->
			<div id="popularPostArea-div">
				<!-- 인기글 네비게이터 -->
				<h2>Popular Post</h2>
				<div class="h-div"><h5><span id="listTitle"></span> 인기글 리스트</h5></div>
		
				<div id="navigator">
					<form method="POST" action="mainConfiguration">
			         	<select name="popularOption">
			         		<option value="allpop" selected>전체</option>
			         		<option value="Java">Java</option>
			         		<option value="DB">DataBase</option>
			         		<option value="CSS">CSS</option>
			         		<option value="HTML">HTML</option>
			         		<option value="jQuery">jQuery</option>
			         	</select>
		         		<button type="submit">조회</button>
	         		</form>
				</div>
				<div class="h-div2"> <button type="button" id="pop-delete-btn" onclick="deletePopPst(this);"></button></div>
				<div class="post-table-div">
					<table class="table table-hover table-sm" id="list-table">
						<thead>
							<tr>
								<th>포스팅 번호</th>
								<th>조회수</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>신고</th>
								<th>목록에서 삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:choose>
									<%-- 조회된 게시글 목록이 없는 경우 --%>
									<c:when test="${empty blogPostList}">
										<tr>
											<td colspan="7">포스팅이 존재하지 않습니다</td>
										</tr>

									</c:when>

									<%-- 포스팅 목록이 있을 경우 --%>

									<c:otherwise>

										<c:forEach items="${blogPostList}" var="posting">
											<tr>
												<%-- 포스팅번호(No) --%>
												<td>${posting.pstNo}</td>
												<%-- 조회수 --%>
												<td>${posting.pstCount}</td>
												<%-- 포스팅 제목 --%>
												<td>
													<a href="mainPopPstView?no=${posting.pstNo}&type=${posting.pstBox}${searchStr}">
													${posting.pstTitle}
													</a>
												</td>
												<%-- 포스팅 작성자 --%>
												<td>${posting.memNm}</td>
												<%-- 포스팅 작성일 --%>
												<td>${posting.pstCreateDt}</td>
												<%-- 신고 --%>
												<td>${posting.pstWarn}</td>

												<td>
		                                        	<input type="checkbox" name="popDisplayCB" value="${posting.pstNo}" >
												</td>
												<%-- 상태 변경 버튼--%>
											</tr>

										</c:forEach>
									</c:otherwise>
								</c:choose>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
	<!-- ===============================본문 끝=============================== -->
   <jsp:include page="../common/footer.jsp" />
   
   <script>
   
      $("select[name='popularOption'] > option").each(function(index, item){
         if( $(item).val() == "${param.popularOption}" ){
            $(item).prop("selected", true);
            $("#listTitle").text($(item).text());
         }
      });
      
      
      function updateCarousel(crsDisplay, btn){
          
          if($("input[name='crsDisplayCB']:checked").length < 3){
        	  alert("최소 3개 이상");
        	  return false;
          }
    	  
    	  
    	  let arr = [];
    	  let uncheckedArr = [];
    	  
         $("input[name='crsDisplayCB']:checked").each(function(){
        	 arr.push($(this).val());
         });         
         const condition = "(" + arr.join() + ")"; 
         
         $("input[name='crsDisplayCB']:not(:checked)").each(function(){
       	  uncheckedArr.push($(this).val());
         });		
		 const uncondition = "(" + uncheckedArr.join() + ")";
			
		           
		$.ajax({
             url : "${contextPath}/admin/main/mainCrsUpdate",
             data : {"condition" : condition , "uncondition" : uncondition},
             type : "POST",
             success : function(result){
            	 
                if(result > 0){
                	
                	$("input[name='crsDisplayCB']:checked").each(function(){
                   	 $(this).parent().parent().children().eq(3).text('Y');
                    });
                	$("input[name='crsDisplayCB']:not(:checked)").each(function(){
                     $(this).parent().parent().children().eq(3).text('N');
                    });
                	
                   alert("변경 성공");
                }
             },
             error : function(){
                console.log("실패");
             }
          })
     }
      
      ///-----------------------------------------------------------///
      
      function deleteCarousel(crsNo, btn){
    	  

		$.ajax({
             url : "${contextPath}/admin/main/mainCrsDelete",
             data : { "crsNo" : crsNo },
             type : "POST",
             success : function(result){
            	 
                if(result > 0){
                	
                   	 $(this).parent().prev().text('D');

                   alert("삭제 성공");
                   $.ajax({
                	   url : "${contextPath}/admin/main/mainConfiguration"
                   })
                }
             },
             error : function(){
                console.log("실패");
             }
          })
     }
      
      //----------------------인기글 목록에서 삭제--------------------------//
      
      
      function deletePopPst(pstStatus, btn){
          
    	  let arr = [];

    	  $("input[name='popDisplayCB']:checked").each(function(){
        	 arr.push($(this).val());
         });         
         const condition = "(" + arr.join() + ")"; 
         
		$.ajax({
             url : "${contextPath}/admin/main/mainPopPstDelete",
             data : {"condition" : condition},
             type : "POST",
             success : function(result){
            	 
                if(result > 0){
                	
                   alert("목록에서 삭제 완료");
                   
                   $.ajax({
                	   url : "${contextPath}/admin/main/mainConfiguration"
                   })
                }
             },
             error : function(){
                console.log("실패");
             }
          })
     }      
   
   </script>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"></script>



</body>

</html>