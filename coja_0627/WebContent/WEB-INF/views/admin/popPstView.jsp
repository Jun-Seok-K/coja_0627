<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		#board-area{
		float: left;
		width: 100%;
		}
		
		#back-btn{
		text-align : right;
		}
        /* ---------------------------구분선------------------------ */


   </style>
</head>

<body>
	<jsp:include page="../common/headerAdmin.jsp" />
	
   <!-- ===============================관리자  navi 끝=============================== -->
	<!-- 전체 div를 포함하는 영역 -->
	<div id="contentContainer">
	
		<div>

			<div id="board-area">

				<!-- Category -->
				<h6 class="mt-4">카테고리 : [${pst.pstBox} ]</h6>
				
				<!-- Title -->
				<h3 class="mt-4">${pst.pstTitle}</h3>

				<!-- Writer -->
				<p class="lead">
					작성자 : ${pst.memNm}
				</p>

				<hr>

				<!-- Date -->
				<p>
					<span class="board-dateArea">
						작성일 : <fmt:formatDate value="${pst.pstCreateDt}" pattern="yyyy년 MM월 dd일 "/> 
						<br>
						마지막 수정일 : <fmt:formatDate value="${pst.pstModifyDt}" pattern="yyyy년 MM월 dd일"/> 
					</span>
			 		<span class="float-right">조회수 ${pst.pstCount} </span>
				</p>

				<!-- Content -->
				<!-- div로 되어있어서 컨텐트에 엔터를 눌러도 인식이 안됨 -->
				<div id="board-content"> ${pst.pstCnt}</div>
				

				<hr>
				 
				
				<div>
					<button type="button" id="back-btn">목록으로</button>
				</div>
				
				<hr>

			</div>



		</div>
		
		
	</div>
	<!-- ===============================본문 끝=============================== -->
   <jsp:include page="../common/footer.jsp" />
   

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"></script>

	<script>
		$("#back-btn").click(function(){
			window.history.back();
		})	
	
	</script>

</body>

</html>