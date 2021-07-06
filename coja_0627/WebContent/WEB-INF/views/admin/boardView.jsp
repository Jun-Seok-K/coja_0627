<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	#board-area{ min-height: 700px;  margin-bottom: 100px;}
	#board-content{ padding-bottom:150px;}

	.boardImgArea{
		height: 300px;
	}

	.boardImg{
		width : 100%;
		height: 100%;
		border : 1px solid #ced4da;
		max-width : 300px;
		max-height: 300px;
	}
	
	.replyWrite > table{
		width: 90%;
		align: center;
	}
	
	#replyContentArea{ width: 90%; }
	
	#replyContentArea > textarea{
	    resize: none;
    	width: 100%;
	}
	
	#replyBtnArea{
	    width: 100px;
	    text-align: center;
	}
	
	.rWriter{ margin-right: 30px;}
	.rDate{
		font-size: 0.7em;
		color : gray;
	}
	
	#replyListArea{
		list-style-type: none;
	}
	
	.board-dateArea{
		font-size: 14px;
	}
	
	
	.boardImg {
		width: 200px;
		height: 200px;
	}
	.thubnail{
		width: 300px;
		height: 300px;
	}
	
	.boardImg > img{
		width : 100%;
	}
</style>
</head>
<body>
	<jsp:include page="../common/headerAdmin.jsp" />
	<div class="container  my-5">

		<div>

			<div id="board-area">

				<!-- Category -->
				<h6 class="mt-4">카테고리 : [${board.boardTypeNm}]</h6>
				
				<!-- Title -->
				<h3 class="mt-4">${board.boardTitle}</h3>

				<!-- Writer -->
				<p class="lead">
					작성자 : ${board.memNm}
				</p>

				<hr>

				<!-- Date -->
				<p>
					<span class="board-dateArea">
						작성일 : <fmt:formatDate value="${board.boardCreateDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/> 
						<br>
						<%-- ${board.createDate} --%>
						<br>
						마지막 수정일 : <fmt:formatDate value="${board.boardModifyDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/> 
						<%-- ${board.modifyDate} --%>
						
						
					</span>
			 		<span class="float-right">조회수${board.boardReadCount}</span>
				</p>

				<hr>
				
				
				<hr>
				<!-- Content -->
				<div id="board-content">${board.boardContent}</div>
				

				<hr>
				 
				
				<div>   
						<button id="deleteBtn" class="btn btn-primary float-right mr-2" onclick="boardDelete();">삭제</button> 
						<form id="actionForm" method="POST" action="boardDelete">
							<input type="hidden" name="boardNo" value="${board.boardNo}">
						</form>
						<a href="${contextPath}/board/boardList" class="btn btn-primary float-right mr-2">목록으로</a>
				</div>
				
				
				<%-- 댓글 영역 --%>

			</div>



		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<form action="#" method="POST" name="requestForm">
		<input type="hidden" name="boardNo" value="${board.boardNo}">
		<input type="hidden" name="cp" value="${param.cp}">
		<input type="hidden" name="type" value="${param.type}">
	</form>
	
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<script>
		const boardNo = ${board.boardNo};
		
		function fnRequest(addr){
			
			// 현재 문서 내부에 name속성 값이 requestForm인 요소의 action 속성 값을 변경
			document.requestForm.action = "../board2/" + addr;
			
			// 현재 문서 내부에 name속성 값이 requestForm인 요소를 제출해라
			document.requestForm.submit();
		}
		
		function boardDelete(){
			
			
			
			if(confirm("삭제하시겠습니까?")){
				$("#actionForm").submit();
				
				
			}else{
				
			}
		/* 	swal({
				  title: "게시글 삭제",
				  text: "정말로 삭제하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) {
				  if (willDelete) {
				    swal("해당 게시글을 삭제하였습니다.", {
				      icon: "success"
				    });
				    return true
				    
				    function boardDelete2(){
				    	return true
				    }
				    
				  } else {
				    swal("게시글 삭제를 취소하였습니다.");
				  }
				  return false
				  
				});
						 */
		}
		
		
	</script>
</body>
</html>


