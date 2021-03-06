<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>${board.boardTitle}</title>

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
            border: 2px solid #ced4da;
            max-width: 300px;
            max-height: 300px;
            display: inline-block;
        }

        .board-detail-content-area {
            width: 100%;
            height: auto;
            clear: both;
            box-sizing: border-box;
            padding: 10px;
        }

        .board-detail-content-img {
            width: 100%;
            height: auto;
            box-sizing: border-box;
            padding: 10px;
        }

        #brdImgLabel {
            width: fit-content;
            box-sizing: border-box;
            height: auto;
            vertical-align: center;
            text-align: center;
        }

        .boardImg {
            max-width: 300px;
            box-sizing: border-box;
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

        /*??????*/
        .replyWrite>table {
            margin-top: 100px;
        }

        .rWriter {
            display: inline-block;
            vertical-align: top;
            font-size: 1.2em;
            font-weight: bold;
        }

        .rDate {
            display: inline-block;
        }

        .rContent,
        .replyBtnArea {
            height: 100%;
            width: 100%;
        }

        .replyBtnArea {
            text-align: right;
        }

        .replyUpdateContent {
            resize: none;
            width: 100%;
        }

        .reply-row {
            border-top: 1px solid #ccc;
            padding: 15px 0;
        }
    </style>
</head>

<body>
    <div class="container  my-5">

        <div>

            <div id="board-area">

				<!-- Date -->
                <p align="left">
	                <span class="board-dateArea">
	                    	<fmt:formatDate value="${board.boardModifyDate}" pattern="yyyy/MM/dd (HH:mm:ss)" /> ??????
	                </span>
                </p>
				
                <!-- Category -->
                <h5 class="mt-4">(${board.boardTypeNm})</h5>

                <!-- Title -->
                <h2 class="mt-4" align="center">${board.boardTitle}</h2>

                <!-- Writer -->
                <p class="lead float-right">????????? : ${board.memNm} (??????:${board.boardWarn}???)</p><br><br>
                
	            <span class="float-right"><fmt:formatDate value="${board.boardCreateDate}" pattern="yyyy / MM / dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????${board.boardReadCount}</span><br>

                <hr>

                <div class="board-detail-content-area" id="board-detail-content-area" name="board-detail-content-area"
                    align="center">

                    <!-- ????????? ?????? -->
                    <c:forEach items="${board.brdImgList}" var="brdImg">
                        <c:choose>
                            <c:when test="${brdImg.brdImgLv == 0 && !empty brdImg.brdImgNm}">
                                <c:set var="img0" value="${contextPath}/${brdImg.brdImgUrl}${brdImg.brdImgNm}" />
                            </c:when>
                            <c:when test="${brdImg.brdImgLv == 1 && !empty brdImg.brdImgNm}">
                                <c:set var="img1" value="${contextPath}/${brdImg.brdImgUrl}${brdImg.brdImgNm}" />
                            </c:when>
                            <c:when test="${brdImg.brdImgLv == 2 && !empty brdImg.brdImgNm}">
                                <c:set var="img2" value="${contextPath}/${brdImg.brdImgUrl}${brdImg.brdImgNm}" />
                            </c:when>
                            <c:when test="${brdImg.brdImgLv == 3 && !empty brdImg.brdImgNm}">
                                <c:set var="img3" value="${contextPath}/${brdImg.brdImgUrl}${brdImg.brdImgNm}" />
                            </c:when>
                        </c:choose>
                    </c:forEach>

                    <!-- ????????? ???????????? -->
                    <div class="board-detail-content-img">
                        <table>
                            <td>
                                <div class="boardImg" id="boardImg0">
                                    <c:if test="${!empty img0 }">
                                        <img id="brdImg0" src="${img0}">
                                    </c:if>
                                </div>
                            </td>
                            <td>
                                <div class="boardImg" id="boardImg1">
                                    <c:if test="${!empty img0 }">
                                        <img id="brdImg1" src="${img1}">
                                    </c:if>
                                </div>
                            </td>
                            <td>
                                <div class="boardImg" id="boardImg2">
                                    <c:if test="${!empty img2 }">
                                        <img id="brdImg2" src="${img2}">
                                    </c:if>
                                </div>
                            </td>
                            <td>
                                <div class="boardImg" id="boardImg3">
                                    <c:if test="${!empty img3 }">
                                        <img id="brdImg3" src="${img3}">
                                    </c:if>
                                </div>
                            </td>
                        </table>
                    </div>
                </div>

                <div class="board-detail-slide-area">
                    <hr>
                    
                    <!-- Content -->
                    <div id="board-content">${board.boardContent}</div>

                    <hr>

                    <div>
                        <button id="deleteBtn" class="btn btn-primary float-right mr-3" onclick="boardDelete();">???????????????</button>
                            
                        <form id="deleteForm" method="POST" action="boardDelete">
                            <input type="hidden" name="boardNo" value="${board.boardNo}">
                        </form>
                        
                        <a href="${contextPath}/board/boardList" class="btn btn-primary float-right mr-2">???????????????</a>
                    </div>

					<br>

                    <div id="reply-area ">
                        <!-- ?????? ?????? ?????? -->
                        <div class="replyList mt-5 pt-2">
                            <ul id="replyListArea">
                                <c:forEach items="${rList}" var="reply">
                                    <li class="reply-row">
                                        <div>
                                            <p class="rWriter">${reply.memberName}</p>
                                            <p class="rDate">????????? :
                                                <fmt:formatDate value="${reply.createDate }"
                                                    pattern="yyyy??? MM??? dd??? HH:mm" />
                                            </p>
                                        </div>

                                        <p class="rContent">${reply.replyContent }</p>


                                        <div class="replyBtnArea">
                                            <button class="btn btn-primary btn-sm ml-1" id="deleteReply"
                                                onclick="deleteReply(${reply.replyNo})">?????? ??????</button>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                    </div>

                </div>



            </div>
        </div>
        <jsp:include page="../common/footer.jsp"></jsp:include>

        <form action="#" method="POST" name="requestForm">
            <input type="hidden" name="boardNo" value="${board.boardNo}">
            <input type="hidden" name="cp" value="${param.cp}">
            <input type="hidden" name="type" value="${param.type}">
        </form>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>

        <script>

            function boardDelete() {

                swal({
                    title: "????????? ??????",
                    text: "???????????? ?????????????????????????",
                    icon: "info",
                    buttons: [
                        '?????????',
                        '???'
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        swal({
                            title: '????????? ?????? ??????!',
                            text: '?????? ???????????? ?????????????????????.',
                            icon: 'success'
                        }).then(function () {
                            $("#deleteForm").submit();
                        });
                    } else {
                        swal("?????? ??????", "????????? ????????? ?????????????????????.", "error");
                    }
                })

            }

            //-----------------------------------------------------------------------------------------
            // ?????? ????????? ??????
            const boardNo = ${ board.boardNo };

            //?????? ????????? ?????? ?????? ??????
            function selectReplyList() {

                $.ajax({
                    url: "${contextPath}/reply/list",
                    data: { "boardNo": boardNo },
                    type: "POST",
                    dataType: "JSON",
                    success: function (rList) {
                        console.log(rList);

                        $("#replyListArea").html("");

                        $.each(rList, function (index, item) {

                            var li = $("<li>").addClass("reply-row");

                            var div = $("<div>");
                            var rWriter = $("<p>").addClass("rWriter").text(item.memberName);
                            var rDate = $("<p>").addClass("rDate").text("????????? : " + item.createDate);
                            div.append(rWriter).append(rDate)

                            var rContent = $("<p>").addClass("rContent").html(item.replyContent);

                            var replyBtnArea = $("<div>").addClass("replyBtnArea");

                            var deleteReply = $("<button>").addClass("btn btn-primary btn-sm ml-1").text("????????????").attr("onclick", "deleteReply(" + item.replyNo + ")");

                            replyBtnArea.append(deleteReply);

                            li.append(div).append(rContent).append(replyBtnArea);
                            console.log("????????? ????????? ????????????.");

                            $("#replyListArea").append(li);
                        });

                    },
                    error: function () {
                        console.log("?????? ?????? ?????? ??????")
                    }

                });
            }

            // -----------------------------------------------------------------------------------------
            //?????? ??????
            function deleteReply(replyNo) {

                swal({
                    title: "?????? ??????",
                    text: "????????? ?????????????????????????",
                    icon: "info",
                    buttons: [
                        '?????????',
                        '???'
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {

                    if (isConfirm) {
                        var url = "${contextPath}/reply/deleteReply";

                        $.ajax({
                            url: url,
                            data: { "replyNo": replyNo },
                            success: function (result) {
                                if (result > 0) {
                                    selectReplyList(boardNo);
                                    console.log(replyNo)

                                    swal({
                                        title: '?????? ?????? ??????!',
                                        text: '?????? ????????? ?????????????????????.',
                                        icon: 'success'
                                    }).then(function () {
                                        $("#deleteForm").submit();
                                        location.reload();
                                    });
                                }

                            }, error: function () {
                                console.log("ajax ?????? ??????");
                            }
                        });

                    } else {
                        swal("?????? ??????", "?????? ????????? ?????????????????????.", "error");
                    }
                })
            }
        </script>
</body>

</html>

