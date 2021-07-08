<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- fmt 태그 : 문자열, 날짜, 숫자의 형식(모양)을 지정하는 태그 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스팅</title>
<style>
#board-area {
	min-height: 700px;
	margin-bottom: 100px;
}

#board-content {
	padding-bottom: 150px;
}

.boardImgArea {
	height: 300px;
}

.boardImg {
	width: 100%;
	height: 100%;
	border: 1px solid #ced4da;
	max-width: 300px;
	max-height: 300px;
}

.replyWrite>table {
	width: 90%;
	align: center;
}

#replyContentArea {
	width: 90%;
}

#replyContentArea>textarea {
	resize: none;
	width: 100%;
}

#replyBtnArea {
	width: 100px;
	text-align: center;
}

.rWriter {
	margin-right: 30px;
}

.rDate {
	font-size: 0.7em;
	color: gray;
}

#replyListArea {
	list-style-type: none;
}

.board-dateArea {
	font-size: 14px;
}

.boardImg {
	width: 200px;
	height: 200px;
}

.thubnail {
	width: 300px;
	height: 300px;
}

.boardImg>img {
	width: 100%;
}

#contentArea {
	/* background-color: lightgray; */
	width: 800px;
	margin-right: 0;
	float: left;
}
</style>
</head>
<body>
	<jsp:include page="../common/headerMain.jsp" />

	<jsp:include page="../common/headerBlog.jsp" />

	<jsp:include page="../common/blogSide.jsp" />


	<div id="contentArea">
		<div class="container  my-5">

			<div>

				<div id="board-area">

					<!-- Category -->
					<h6 class="mt-4">카테고리 : [${posting.ctNm}]</h6>

					<!-- Title -->
					<h3 class="mt-4">${posting.pstTitle}</h3>

					<!-- Writer -->
					<p class="lead">작성자 : ${posting.memNm}</p>

					<hr>

					<!-- Date -->
					<p>
						<span class="board-dateArea"> 작성일 : <fmt:formatDate
								value="${posting.pstCreateDt}" pattern="yyyy년 MM월 dd일 HH:mm:ss" />

							<br> 마지막 수정일 : <fmt:formatDate value="${posting.pstModifyDt}"
								pattern="yyyy년 MM월 dd일 HH:mm:ss" />

						</span> <span class="float-right">조회수 ${posting.pstCount} </span>
					</p>

					<hr>

					<!-- Content -->
					<div id="board-content">${posting.pstCnt}</div>


					<hr>


					<div>
						<%-- 로그인된 회원과 해당 글 작성자가 같은 경우에만 버튼 노출--%>
						<c:if test="${loginMember.memNo == posting.memNo}">
							<button id="deleteBtn" class="btn btn-primary float-right mr-2">삭제</button>
							<button id="updateBtn" class="btn btn-primary float-right mr-2"
								onclick="fnRequest('updateForm')">수정</button>
						</c:if>


						<c:if test="${!empty param.sk && !empty param.sv}">
							<%-- 검색은 게시글 목록 조회에 단순히 sk, sv 파라미터를 추가한 것
					-> 목록 조회 결과 화면을 만들기 위해 boardList.jsp로 요청 위임 되기 때문에
					   request 객체가 유지되고, 파라미터도 유지된다. --%>
							<c:set var="searchStr" value="&sk=${param.sk}&sv=${param.sv}" />
						</c:if>

						<a href="list?type=${param.type}&cp=${param.cp}${searchStr}"
							class="btn btn-primary float-right mr-2">목록으로</a>
					</div>


					<%-- 댓글 영역 !!!!!!!!!!!!!!!!--%>

					<%-- <jsp:include page="reply.jsp"></jsp:include> --%>
				</div>

			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>


	<!-- 2021.07.01 1교시 수업 영상 복습!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<form action="#" method="POST" name="requestForm">
		<input type="hidden" name="pstNo" value="${posting.pstNo}">
		<input type="hidden" name="cp" value="${param.cp}"> <input
			type="hidden" name="type" value="${param.type}">
	</form>

	<jsp:include page="../common/footer.jsp" />

	<script>
		function fnRequest(addr) {

			// 현재 문서 내부에 name 속성 값이 requestForm인 요소의 action 속성 값을 변경
			document.requestForm.action = "../board2/" + addr;

			// 현재 문서 내부에 name 속성 값이 requestForm인 요소를 제출해라
			document.requestForm.submit();
		}
	</script>
</body>
</html>
