<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스팅</title>
<style>
.insert-label {
	display: inline-block;
	width: 80px;
	line-height: 40px
}

.boardImg {
	cursor: pointer;
	width: 200px;
	height: 200px;
	border: 1px solid #ced4da;
	position: relative;
}

.thubnail {
	width: 300px;
	height: 300px;
}

.boardImg>img {
	max-width: 100%;
	max-height: 100%;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
}

#fileArea {
	display: none;
}

#contentArea {
	/* background-color: lightgray; */
	width: 800px;
	margin-right: 0;
	float: left;
}

#radioTableArea {
	height: 200px;
	margin: auto;
}

#radioTable {
	width: 700px;
	margin: auto;
}
</style>
</head>
<body>
	<jsp:include page="../common/headerMain.jsp" />

	<jsp:include page="../common/headerBlog.jsp" />

	<jsp:include page="../common/blogSide.jsp" />


	<div id="contentArea">

		<div class="container my-5">

			<h3>포스팅 등록</h3>
			<hr>
			<!-- 파일 업로드를 위한 라이브러리 cos.jar 라이브러리 다운로드(http://www.servlets.com/) -->

			<!-- 
				- enctype : form 태그 데이터가 서버로 제출 될 때 인코딩 되는 방법을 지정. (POST 방식일 때만 사용 가능)
				- application/x-www-form-urlencoded : 모든 문자를 서버로 전송하기 전에 인코딩 (form태그 기본값)
				- multipart/form-data : 모든 문자를 인코딩 하지 않음.(원본 데이터가 유지되어 이미지, 파일등을 서버로 전송 할 수 있음.) 
			-->
			<form action="${contextPath}/blog2/insert?type=${param.type}"
				method="post" role="form"
				onsubmit="return boardValidate();">

				<c:if test="${ !empty category}">
					<div class="mb-2">
						<label class="input-group-addon mr-3 insert-label">카테고리</label> <select
							class="custom-select" id="categoryCode" name="pstCtNo"
							style="width: 150px;">
							<c:forEach items="${category}" var="c">
								<option value="${c.pstCtNo }">${c.pstCtNm }</option>
							</c:forEach>
						</select>
					</div>
				</c:if>


				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">제목</label> <input
						type="text" class="form-control" id="boardTitle" name="pstTitle"
						size="70">
				</div>

				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">작성자</label>
					<h5 class="my-0" id="writer">${loginMember.memNm }</h5>
				</div>


				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">작성일</label>
					<h5 class="my-0" id="today"></h5>
				</div>

				<hr>

				<div class="form-group">
					<div>
						<label for="content">내용</label>
					</div>
					<textarea class="form-control" id="boardContent" name="pstCnt" rows="15" style="resize: none;"></textarea>

					<div id="radioTableArea">
						<table id="radioTable">
							<tr>
								<td><input class="form-check-input" name="pstBox"
									type="radio" value="Java" id="invalidCheck"> <label
									class="form-check-label" for="invalidCheck">Java</label></td>
								<td><input class="form-check-input" name="pstBox"
									type="radio" value="DB" id="invalidCheck"> <label
									class="form-check-label" for="invalidCheck">DB</label></td>
								<td><input class="form-check-input" name="pstBox"
									type="radio" value="HTML" id="invalidCheck"> <label
									class="form-check-label" for="invalidCheck">HTML</label></td>
							</tr>
							<tr>
								<td><input class="form-check-input" name="pstBox"
									type="radio" value="CSS" id="invalidCheck"> <label
									class="form-check-label" for="invalidCheck">CSS</label>
								<td><input class="form-check-input" name="pstBox"
									type="radio" value="jQuery" id="invalidCheck">
									<label class="form-check-label" for="invalidCheck">jQuery</label>
								</td>
							</tr>
						</table>
					</div>
				</div>


				<hr class="mb-4">

				<div class="text-center">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-primary">목록으로</button>
				</div>

			</form>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>


	<script>
		(function printToday() {
			// 오늘 날짜 출력 
			var today = new Date();
			var month = (today.getMonth() + 1);
			var date = today.getDate();

			var str = today.getFullYear() + "-"
					+ (month < 10 ? "0" + month : month) + "-"
					+ (date < 10 ? "0" + date : date);
			$("#today").html(str);
		})();

		// 유효성 검사 
		function boardValidate() {
			if ($("#boardTitle").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}

			if ($("#boardContent").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#content").focus();
				return false;
			}
		}

		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function() {
			$(".boardImg").on("click", function() {
				var index = $(".boardImg").index(this);
				$("#img" + index).click();
			});

		});

		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				// 자바스크립트 FileReader
				// 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체

				reader.readAsDataURL(value.files[0]);
				// FileReader.readAsDataURL()
				// 지정된의 내용을 읽기 시작합니다. Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.

				// FileReader.onload
				// load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.
				reader.onload = function(e) {
					//console.log(e.target.result);
					// e.target.result
					// -> 파일 읽기 동작을 성공한 객체에(fileTag) 올라간 결과(이미지 또는 파일)

					$(".boardImg").eq(num).children("img").attr("src",
							e.target.result);
				}
			}
		}
	</script>
</body>
</html>
