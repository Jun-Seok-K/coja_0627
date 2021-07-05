<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<style>
  		.write-container{
            width: 1000px;
            height: auto;
            box-sizing: border-box;
            text-align: center;
            margin: auto;
            
        }
        .write-head{
            width: 60%;
            height: 40px;
            line-height: 40px;
            display: inline-block;
            background-color: gainsboro;
            text-align: center;
            border-style: none;
            margin: 10px;
            font-size: 20px;
            font-weight: 600;
            box-sizing: border-box;
        }

        .write-dropdown{
            width: 11%;
            height: 40px;
            float: left;
            margin-left: 4.5%;
            box-sizing: border-box;
        }

        .write-text-title{
            width: 80%;
            height: 40px;
            box-sizing: border-box;
            float: left;
        }

        .write-tool-area{
            width: 100%;
            height: 80px;
            box-sizing: border-box;
            clear: both;
        }

		.write-upload-area{
            text-align: left;
        }

        .write-upload-label {
			width: 158px;
			height: 200px;
			line-height: 50px;
			display: inline-block;
			vertical-align: top;
			text-align: center;
        }

        .brdImg{
			cursor : pointer;
			width: 200px;
			height: 200px;
			margin-right: 4px;
			border : 1px solid #ced4da;
			display: inline-block;
			position: relative;
		}

        .brdImg > img{
			max-width : 100%;
			max-height : 100%;
			position: absolute;
			top: 0;
			bottom : 0;
			left : 0;
			right : 0;
			margin : auto;
		}
	
		#fileArea{
			display : none;
		}

		.write-content-area{
			width: 100%;
			height: 900px;
			resize: none;
			overflow: auto;
			box-sizing: border-box;
		}

		.write-btn-area{
			width: 100%;
			height: 40px;
			box-sizing: border-box;
		}

		.public-area{
			width: 20%;
			height: 100%;
			box-sizing: border-box;
			float: left;
		}

		/* 전체 공개 토글 버튼 시작 */
		.custom-control-input-success:checked ~ .custom-control-label::before {
			background-color: #28a745 !important;
			border-color: #28a745 !important;
		}

		.custom-switch-lg .custom-control-label::before {
			left: -2.25rem;
			width: 3rem;
			border-radius: 1.5rem;
		}

		.custom-switch-lg .custom-control-label::after {
			top: calc(.25rem + 3px);
			left: calc(-2.25rem + 4px);
			width: calc(1.5rem - 6px);
			height: calc(1.5rem - 6px);
			border-radius: 1.5rem;
		}

		.custom-switch-lg .custom-control-input:checked ~ .custom-control-label::after {
			transform: translateX(1.4rem);
		}

		.custom-switch-lg .custom-control-label::before {
			height: 1.5rem;
		}

		.custom-switch-lg .custom-control-label {
			padding-left: 1.5rem;
			line-height: 1.7rem;
		}
		/* 전체 공개 토글 버튼 끝 */

		.write-confirm-btn{
			float: right;
		}

		.write-cancel-btn{
			float: right;
			margin-right: 20px;
		}
	</style>
</head>
<body>
		<jsp:include page="../common/headerMain.jsp"></jsp:include>

		<div class="write-container">
        <form action="${contextPath}/board2/update/" method="post" enctype="multipart/form-data" role="form" onsubmit="return boardValidate();">
            <div>
                <div class="write-head">게시글 수정하기</div>
            </div>

            <br>

            <div class="write-title-area">
                <select class="write-dropdown" name="write-dropdown" id="brdType">
                    <option value="dropdown-notice" hidden>공지</option>
                    <option value="dropdown-free">자유</option>
                    <option value="dropdown-qna">질문</option>
                    <option selected hidden>말머리 선택</option>
                </select>
    
                <input type="text" class="write-text-title" id="write-text-title" name="write-text-title" placeholder="글 제목" value="${board.brdTitle}">
            </div>

            <div class="write-tool-area"></div>
            
            <!-- 이미지 출력 -->
				<c:forEach items="${board.brdImgList}" var="brdImg">
				
					<c:choose>
						<c:when test="${brdImg.brdImgLv == 0 && !empty brdImg.brdImgNm}">
							<c:set var="img1" value="${contextPath}/${brdImg.brdImgUrl}${brdImg.brdImgNm}"/>
						</c:when>
						<c:when test="${brdImg.brdImgLv == 1 && !empty brdImg.brdImgNm}">
							<c:set var="img2" value="${contextPath}/${brdImg.brdImgUrl}${brdImg.brdImgNm}"/>
						</c:when>
						<c:when test="${brdImg.brdImgLv == 2 && !empty brdImg.brdImgNm}">
							<c:set var="img3" value="${contextPath}/${brdImg.brdImgUrl}${brdImg.brdImgNm}"/>
						</c:when>
						<c:when test="${brdImg.brdImgLv == 3 && !empty brdImg.brdImgNm}">
							<c:set var="img4" value="${contextPath}/${brdImg.brdImgUrl}${brdImg.brdImgNm}"/>
						</c:when>
					</c:choose>
				</c:forEach>
            
			<div class="write-upload-area">
				<label class="write-upload-label"> <br>첨부된<br>이미지</label>
				<div class="brdImg" id="brdImgArea0">
					<c:if test="${!empty img0 }"><img id="brdImg0" src="${img0}"> </c:if>
					<c:if test="${empty img0 }">  <img id="brdImg0"> </c:if>
				</div>

				<div class="brdImg" id="brdImgArea1">
					<c:if test="${!empty img1 }"><img id="brdImg1" src="${img1}"> </c:if>
					<c:if test="${empty img1 }">  <img id="brdImg1"> </c:if>
				</div>

				<div class="brdImg" id="brdImgArea2">
					<c:if test="${!empty img2 }"><img id="brdImg2" src="${img2}"> </c:if>
					<c:if test="${empty img2 }">  <img id="brdImg2"> </c:if>
				</div>

				<div class="brdImg" id="brdImgArea3">
					<c:if test="${!empty img3 }"><img id="brdImg3" src="${img3}"> </c:if>
					<c:if test="${empty img3 }">  <img id="brdImg3"> </c:if>
				</div>

                <!-- 파일 업로드 하는 부분 -->
                <div id="fileArea">
                    <input type="file" id="img0" name="img0" onchange="LoadImg(this,0)"> 
                    <input type="file" id="img1" name="img1" onchange="LoadImg(this,1)"> 
                    <input type="file" id="img2" name="img2" onchange="LoadImg(this,2)">
                    <input type="file" id="img3" name="img3" onchange="LoadImg(this,3)">
                </div>
			</div>

            <textarea class="write-content-area" id="write-content-area"  name="write-content-area" placeholder="글 내용을 작성해주세요."> ${board.brdCnt} </textarea>

            <div class="write-btn-area">
                <div class="public-area custom-control custom-switch custom-switch-lg m-0">
                    <input class="custom-control-input custom-control-input-success" id="write-public" type="checkbox" checked>
                    <label class="custom-control-label" for="write-public">게시글 전체 공개</label>
                </div>

                <div class="write-confirm-btn">
                    <button type="submit" class="btn btn-secondary">작성 완료</button>
                </div>

                <div class="write-cancel-btn">
                    <a href="#" type="button" class="btn btn-secondary">작성 취소</a>
                </div>
            </div>
        </form>
    </div>


	<jsp:include page="../common/footer.jsp"></jsp:include>
		
		
	<script>
		
		// 유효성 검사 
		function boardValidate() {
			if ($("#write-text-title").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#write-text-title").focus();
				return false;
			}

			if ($("#write-content-area").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#write-content-area").focus();
				return false;
			}
		}

		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function() {
			$(".brdImg").on("click", function() {
				var index = $(".brdImg").index(this);
				$("#img" + index).click();
			});

		});

		
		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.readAsDataURL(value.files[0]);
				reader.onload = function(e) {
					$(".brdImg").eq(num).children("img").attr("src", e.target.result);
				}
			}
		}

			
		// 카테고리를 이전 게시글에 입력된 값으로 세팅
		const brdTypeNm = "${board.brdTypeNm}";
			
		$("#brdType > option").each(function(index, item) {
			if( $(item).text() == brdTypeNm ) {
				$(item).prop("selected", true)
			}
			
		});
	</script>
</body>
</html>
