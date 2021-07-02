<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- fmt 태그 : 문자열, 날짜, 숫자의 형식(모양)을 지정하는 태그 --%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글</title>
	<style>
		/* body 시작 */
		.board-detail-container{
            width: 1000px;
            height: auto;
            box-sizing: border-box;
            margin: auto;
            
        }

        .board-detail-title{
            width: 100%;
            height: 40px;
            line-height: 40px;
            font-size: 30px;
            font-weight: 550;
            box-sizing: border-box;
        }

        .board-detail-writer-img{
            width: 5%;
            height: 30px;
            line-height: 30px;
            box-sizing: border-box;
            text-align: center;
            float: left;
        }

        .board-detail-writer-name{
            width: auto;
            height: 30px;
            line-height: 30px;
            box-sizing: border-box;
            text-align: center;
            font-size: 13px;
            float: left;
        }

        .board-detail-view{
            width: auto;
            height: 30px;
            line-height: 30px;
            box-sizing: border-box;
            text-align: center;
            font-size: 13px;
            float: right;
        }

        .board-detail-write-date, .board-detail-modify-date{
            width: 15%;
            height: 30px;
            line-height: 30px;
            box-sizing: border-box;
            text-align: center;
            font-size: 13px;
            float: right;
        }

        .board-detail-content-area{
            width: 100%;
            height: auto;
            clear: both;
            box-sizing: border-box;
            padding: 10px;
            border: 1px solid #666666;
        }

		.board-detail-content-img{
			width: 100%;
			height: auto;
			box-sizing: border-box;
			padding: 10px;
		}

		#brdImgLabel{
			width: fit-content;
			box-sizing: border-box;
			height: auto;
			vertical-align: center;
			text-align: center;
		}

		.boardImg{
			max-width: 300px;
			box-sizing: border-box;
		}

        /* 좋아요 시작 */
        .heartContainer{
            width: 70px;
            height: 80px;
            box-sizing: border-box;
            float: left;
        }

        svg{
            max-width:100%;
            visibility:hidden;
            padding: 0;
        }
        text {
            -moz-user-select: none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        #hit{
            cursor:pointer;
        }
        /* 좋아요 끝 */

        #board-detail-like-btn{
            float: left;
            margin-top: 15px;
            font-size: 12px;
            margin-left: 0;
        }

        .board-detail-chat-icon{
            float: left;
            margin-top: 15px;
            margin-left: 20px;
            margin-right: 20px;
        }

        ion-icon{
            font-size: 32px;
        }

        #board-detail-comment-btn{
            float: left;
            margin-top: 15px;
            font-size: 12px;
        }

        #reportIcon{
            float: right;
            margin-top: 15px;
        }

        #board-detail-comment{
            clear: both;
        }

        #board-detail-like{
            clear: both;
        }

        #board-detail-like-body, #board-detail-comment1, #board-detail-comment2, #board-detail-comment3, #board-detail-comment4{
            margin-bottom: 8px;
            padding: 8px;
        }

        .comment-bar{
            margin-bottom: 4px;
        }

        .comment-writer{
            width: 15%;
            height: 20px;
            line-height: 20px;
            box-sizing: border-box;
            text-align: center;
            float: left;
        }
        
        .comment-writer-profile{
            width: 5%;
            height: 20px;
            line-height: 20px;
            box-sizing: border-box;
            text-align: center;
            float: left;
        }
        
        .comment-write-date{
            width: 20%;
            height: 20px;
            line-height: 20px;
            box-sizing: border-box;
            text-align: center;
            float: left;
        }

        #comment-lock{
            width: 4%;
            height: 20px;
            line-height: 20px;
            box-sizing: border-box;
            text-align: center;
            float: left;
            font-size: 18px;
        }

        #comment-report, #comment-modify, #comment-delete{
            font-size: 18px;
            height: 20px;
            line-height: 20px;
            box-sizing: border-box;
            text-align: center;
            float: right;
        }

        #comment-modify{
            margin-left: 4px;
        }

        #comment-content-area{
            clear: both;
        }

        #board-detail-comment-write-area{
            width: 100%;
            height: 100px;
            resize: none;
            overflow: auto;
            box-sizing: border-box;
            padding: 10px;
            border: 1px solid #666666;
        }

        .board-detail-public-area, .board-detail-btn-area{
            width: 100%;
            height: 40px;
            box-sizing: border-box;
        }

        #board-detail-comment-public-btn{
            width: 20%;
            height: 40px;
            line-height: 40px;
            padding-top: 5px;
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

        .board-detail-comment-confirm-btn{
            margin-top: 10px;
            float: right;
        }

        .board-detail-btn-area{
            margin-top: 10px;
        }

        .board-detail-write-btn, .board-detail-modify-btn, .board-detail-delete-btn{
            float: left;
            margin-right: 10px;
            box-sizing: border-box;
        }

        .board-table{
            text-align: center;
        }

        .page-btn-area{
            width: 100%;
            height: 40px;
            box-sizing: border-box;
        }

        #pagebtn{
            width: 56%;
            height: 100%;
            box-sizing: border-box;
            float: left;
        }

        .goToBoard{
            width: 10%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            text-decoration: none;
            box-sizing: border-box;
            float: right;
        }
	</style>
</head>
<body>
	<jsp:include page="../common/headerMain.jsp"></jsp:include>

	<!-- body -->
    <div class="board-detail-container">
        <form>
            <div class="board-detail-category"> ${board.brdTypeNm} </div>

            <br>

            <div class="board-detail-title"> ${board.brdTitle} </div>

			<a href="#" class="board-detail-writer-img"><img src="${board.memImgUrl}"></a>
            <div class="board-detail-writer-name"> ${board.memNick} </div>

            <div class="board-detail-view">조회 ${board.brdReadCount} </div>
            <div class="board-detail-modify-date"> 마지막 수정일 <fmt:formatDate value="${board.brdModifyDt}" pattern="yyyy년 MM월 dd일 HH:mm"/> </div>
            <div class="board-detail-write-date"> 작성일 <fmt:formatDate value="${board.brdCreateDt}" pattern="yyyy년 MM월 dd일 HH:mm"/> </div>
            

            <div class="board-detail-content-area" id="board-detail-content-area"  name="board-detail-content-area">
				
				<!-- 이미지 출력 -->
				<div class="board-detail-content-img-area">
					<c:forEach items="${board.brdImgList}" var="brdImg">
						<c:choose>
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
	
	
					<div class="board-detail-content-img">
						<c:if test="${!empty img1}">
							<label class="brdContentImg-label" id="brdImgLabel">업로드<br>이미지</label>
						</c:if>
						<div class="boardImg" id="boardImg1">
							<c:if test="${!empty img1}">
								<img id="brdContentImg1" src="${img1}">
							</c:if>
						</div>
	
						<div class="boardImg" id="boardImg2">
							<c:if test="${!empty img2}">
								<img id="brdContentImg2" src="${img2}">
							</c:if>
						</div>
	
						<div class="boardImg" id="boardImg3">
							<c:if test="${!empty img3}">
								<img id="brdContentImg3" src="${img3}">
							</c:if>
						</div>
					</div>

				</div>

				<div class="board-detail-content-text-area"> ${board.brdCnt} </div>
			</div>

            <div class="board-detail-slide-area">

                <!-- 좋아요 시작 -->
                <div class="heartContainer">
                    <svg class="heartSVG" width="80" height="80" viewBox="200 200 200 260">
                        <defs>
                            <mask id="dotMask">       
                                <circle id="whiteDot" fill="#FFFFFF" cx="300" cy="300.5" r="66"/>
                                <circle id="hole" cx="300" cy="300.5" r="0"/>    
                            </mask>
                            <path id="heart"  d="M318.2,259.5c-7.5,0-14.2,3.7-18.2,9.5c-4-5.7-10.7-9.5-18.2-9.5
                                c-12.3,0-22.3,10-22.3,22.3c0,30.4,31.6,58.7,40.5,58.7s40.5-28.4,40.5-58.7C340.5,269.5,330.5,259.5,318.2,259.5z"/>  
                        </defs>
                        <use id="greyHeart" xlink:href="#heart" fill="#AAB8C2"/> 
                        <use id="pinkHeart" xlink:href="#heart" fill="#E2264D"/> 
                        <g mask="url(#dotMask)">
                        <circle id="pinkDot" fill="#E52951" cx="300" cy="300.5" r="66"/>
                        </g>
                        <g id="sparkleGrowGroup" opacity="0">
                            <circle fill="#91D1F9" cx="310.7" cy="239" r="5"/>
                            <circle fill="#91D1F9" cx="235.7" cy="305" r="5"/>
                            <circle fill="#8CE9C4" cx="254.7" cy="252" r="5"/>
                            <circle fill="#8CE9C4" cx="359.7" cy="322" r="5"/>
                            <circle fill="#F48DA6" cx="332.7" cy="361" r="5"/>
                            <circle fill="#CB8EF4" cx="357.7" cy="267" r="5"/>
                            <circle fill="#91D1F9" cx="273.7" cy="363" r="5"/>
                        </g> 
                        <g id="sparkleMoveGroup" opacity="0">
                            <circle fill="#91D1F9" cx="300.7" cy="229" r="5"/>
                            <circle fill="#91D1F9" cx="263.7" cy="353" r="5"/>
                            <circle fill="#8CE9C4" cx="243.7" cy="257" r="5"/>
                            <circle fill="#8CE9C4" cx="367.7" cy="312" r="5"/>
                            <circle fill="#F48DA6" cx="320.7" cy="353" r="5"/>
                            <circle fill="#CB8EF4" cx="233.7" cy="317" r="5"/>
                            <circle fill="#CB8EF4" cx="353.7" cy="255" r="5"/>
                        </g> 
                        
                    <!--BROKEN HEART--> 
                        <g class="brokenHeartGroup" opacity="0">
                            <path id="brokenHeartR" fill="#E2264D" d="M299.9,340.5c8.9,0,40.5-28.4,40.5-58.7c0-12.3-10-22.3-22.3-22.3
                                c-7.5,0-14.2,3.7-18.2,9.5l4,7.3l-11.8,15.5l11.3,11.3l-7.8,12.8l7.3,9l-4,6.7L300,340.5z"/>
                            <path id="brokenHeartL" fill="#E2264D" d="M300.1,269c-4-5.7-10.7-9.5-18.2-9.5c-12.3,0-22.3,10-22.3,22.3
                                c0,30.4,31.6,58.7,40.5,58.7l-1-9l4-6.7l-7.3-9l7.8-12.8l-11.3-11.3l11.8-15.5L300,269z"/>  
                            <path id="breakLineL" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-miterlimit="10" d="M300,340.5l-1-9l4-6.7l-7.3-9
                                l7.8-12.8l-11.3-11.3l11.8-15.5l-4-7.3"/>
                            <path id="breakLineR" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-miterlimit="10" d="M300,340.5l-1-9l4-6.7l-7.3-9
                                l7.8-12.8l-11.3-11.3l11.8-15.5l-4-7.3"/>
                        </g>  
                        <use id="hit" xlink:href="#heart" fill="red" opacity="0"/> 
                    </svg>          
                </div>
            
                <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js"></script>
                <script>
                    var xmlns = 'http://www.w3.org/2000/svg', select = function (s) {
                        return document.querySelector(s);
                    }, selectAll = function (s) {
                        return document.querySelectorAll(s);
                    }, heartContainer = select('.heartContainer'), heartSVG = select('.heartSVG'), hit = select('#hit'), sparkleGrowGroup = select('#sparkleGrowGroup'), 
                    sparkleMoveGroup = select('#sparkleMoveGroup'), brokenHeartGroup = select('#brokenHeartGroup'), sparkleGrowColors = [
                        '#9E31E2',
                        '#9E31E2',
                        '#9E31E2',
                        '#92E8C5',
                        '#CDEB8E',
                        '#2AD492',
                        '#D79DF3'
                    ], sparkleMoveColors = [
                        '#E187D2',
                        '#E0A3FF',
                        '#F5BB30',
                        '#9ECA98',
                        '#35A0F0',
                        '#BADAB0',
                        '#33B6E9'
                    ];
            
                    TweenMax.set('svg', { visibility: 'visible' });
            
                    CSSPlugin.defaultSmoothOrigin = true;
            
                    TweenMax.set([
                        '#breakLineL',
                        '#breakLineR'
                    ]);
            
                    var tl = new TimelineMax({
                        paused: true,
                        onComplete: goBack
                    });
            
                    tl.from('#pinkDot', 1, { attr: { r: 0 } }).set('#greyHeart', {
                        scale: 0,
                        transformOrigin: '50% 100%'
                    }, '-=0.99').to('#pinkDot', 1, { fill: '#CD8FF7' }, '-=1').to('#hole', 1, { attr: { r: 67 } }, '-=0.5').from('#pinkHeart', 1.6, {
                        scale: 0,
                        transformOrigin: '50% 50%',
                        ease: Back.easeOut.config(1.2)
                    }, '-=0.5').set([
                        '#sparkleGrowGroup',
                        '#sparkleMoveGroup'
                    ], { alpha: 1 }, '-=1.5').to('#sparkleGrowGroup', 1, {
                        scale: 1.5,
                        transformOrigin: '50% 50%'
                    }, '-=1.5').to('#sparkleMoveGroup', 1, {
                        scale: 1.2,
                        transformOrigin: '50% 50%'
                    }, '-=1.5').staggerTo('#sparkleGrowGroup circle', 2, {
                        attr: { r: 0 },
                        cycle: {
                            fill: function (i) {
                                return sparkleGrowColors[i];
                            }
                        }
                    }, 0, '-=0.9').staggerTo('#sparkleMoveGroup circle', 0.8, {
                        attr: { r: 0 },
                        cycle: {
                            fill: function (i) {
                                return sparkleMoveColors[i];
                            }
                        }
                    }, 0, '-=2').addCallback(setUndoLike).set('.brokenHeartGroup', { alpha: 1 }).set('#pinkHeart', { alpha: 0 }).to([
                        '#breakLineL',
                        '#breakLineR'
                    ], 3, { drawSVG: '0% 100%' }).to(['#brokenHeartL'], 4, {
                        rotation: -90,
                        transformOrigin: '110% 100%',
                        ease: Power2.easeIn
                    }, '-=1.5').to(['#brokenHeartR'], 4, {
                        rotation: 90,
                        transformOrigin: '10% 100%',
                        ease: Power2.easeIn
                    }, '-=4').to('#greyHeart', 3, {
                        scale: 1,
                        ease: Power4.easeInOut
                    }, '-=1.6').set([
                        '#breakLineL',
                        '#breakLineR'
                    ], { drawSVG: '0% 0%' }, '-=3').to([
                        '#brokenHeartL',
                        '#brokenHeartR'
                    ], 0.3, { alpha: 0 }, '-=2');
            
                    heartSVG.onclick = function () {
                        if (tl.time() === 0) {
                            tl.play(0);
                        } else {
                            tl.play();
                        }
                        hit.onmouseout();
                    };
            
                    hit.onmouseover = function () {
                        if (tl.time() === 0) {
                            TweenMax.set('.likePopup', { alpha: 1 });
                        } else {
                            TweenMax.set('.undoLikePopup', { alpha: 1 });
                        }
                    };
            
                    function setUndoLike() {
                        tl.pause();
                        TweenMax.set('.undoLikePopup', { alpha: 1 });
                    }
            
                    function goBack() {
                        tl.pause(0);
                        TweenMax.delayedCall(0.4, hit.onmouseover);
                    }
            
                    hit.onmouseout = function () {
                        TweenMax.set([
                            '.likePopup',
                            '.undoLikePopup'
                        ], { alpha: 0 });
                    };
            
                    tl.timeScale(4);
                </script>
                <!-- 좋아요 끝 -->
                
                <button class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#board-detail-like" aria-expanded="false" aria-controls="board-detail-like" id="board-detail-like-btn">좋아요 ${brdLike} </button>
                
                <label for="board-detail-comment-btn" class="board-detail-chat-icon">
                    <ion-icon name="chatbox-ellipses-outline"></ion-icon>
                </label>
                
                <button class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#board-detail-comment" aria-expanded="false" aria-controls="board-detail-comment" id="board-detail-comment-btn">댓글 nn개</button>
                
                <a href="#" style="color:black"><ion-icon name="alert-circle-outline" id="reportIcon"></ion-icon></a>

                <div class="collapse multi-collapse" id="board-detail-like">
                    <div class="card card-body" id="board-detail-like-body">
                        좋아요 누른 사람
                    </div>
                </div>
                <div class="collapse multi-collapse" id="board-detail-comment">
                    <div class="card card-body" id="board-detail-comment1">
                        <div class="comment-bar">
                            <div class="comment-writer">writer1</div>
                            <a href="#" class="comment-writer-profile"><img src="#"></a>
                            <ion-icon name="lock-closed-outline" id="comment-lock"></ion-icon>
                            <div class="comment-write-date">2021년 x월 x일 00시 00분</div>
                            <a href="#" style="color:black" class="comment-delete"><ion-icon name="close-outline" id="comment-delete"></ion-icon></a>
                            <a href="#" style="color:black" class="comment-modify"><ion-icon name="create-outline" id="comment-modify"></ion-icon></a>
                            <a href="#" style="color:black" class="comment-report"><ion-icon name="alert-circle-outline" id="comment-report"></ion-icon></a>
                        </div>
                        <div class="comment-content-area">댓글 내용</div>
                    </div>
                    <div class="card card-body" id="board-detail-comment2">
                        <div class="comment-bar">
                            <div class="comment-writer">writer1</div>
                            <a href="#" class="comment-writer-profile"><img src="#"></a>
                            <ion-icon name="lock-closed-outline" id="comment-lock"></ion-icon>
                            <div class="comment-write-date">2021년 x월 x일 00시 00분</div>
                            <a href="#" style="color:black" class="comment-delete"><ion-icon name="close-outline" id="comment-delete"></ion-icon></a>
                            <a href="#" style="color:black" class="comment-modify"><ion-icon name="create-outline" id="comment-modify"></ion-icon></a>
                            <a href="#" style="color:black" class="comment-report"><ion-icon name="alert-circle-outline" id="comment-report"></ion-icon></a>
                        </div>
                        <div class="comment-content-area">댓글 내용</div>
                    </div>
                    <div class="card card-body" id="board-detail-comment3">
                        <div class="comment-bar">
                            <div class="comment-writer">writer1</div>
                            <a href="#" class="comment-writer-profile"><img src="#"></a>
                            <ion-icon name="lock-closed-outline" id="comment-lock"></ion-icon>
                            <div class="comment-write-date">2021년 x월 x일 00시 00분</div>
                            <a href="#" style="color:black" class="comment-delete"><ion-icon name="close-outline" id="comment-delete"></ion-icon></a>
                            <a href="#" style="color:black" class="comment-modify"><ion-icon name="create-outline" id="comment-modify"></ion-icon></a>
                            <a href="#" style="color:black" class="comment-report"><ion-icon name="alert-circle-outline" id="comment-report"></ion-icon></a>
                        </div>
                        <div class="comment-content-area">댓글 내용</div>
                    </div>
                    <div class="card card-body" id="board-detail-comment4">
                        <div class="comment-bar">
                            <div class="comment-writer">writer1</div>
                            <a href="#" class="comment-writer-profile"><img src="#"></a>
                            <ion-icon name="lock-closed-outline" id="comment-lock"></ion-icon>
                            <div class="comment-write-date">2021년 x월 x일 00시 00분</div>
                            <a href="#" style="color:black" class="comment-delete"><ion-icon name="close-outline" id="comment-delete"></ion-icon></a>
                            <a href="#" style="color:black" class="comment-modify"><ion-icon name="create-outline" id="comment-modify"></ion-icon></a>
                            <a href="#" style="color:black" class="comment-report"><ion-icon name="alert-circle-outline" id="comment-report"></ion-icon></a>
                        </div>
                        <div class="comment-content-area">댓글 내용</div>
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination pagination-sm justify-content-center">
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </li>
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </a>
                          </li>
                        </ul>
                      </nav>
                </div>
            </div>

            <textarea class="board-detail-comment-write-area" id="board-detail-comment-write-area"  name="board-detail-comment-write-area" placeholder="댓글 내용을 작성해주세요."></textarea>

            <div class="board-detail-public-area">
                <div class="public-area custom-control custom-switch custom-switch-lg m-0" id="board-detail-comment-public-btn">
                    <input class="custom-control-input custom-control-input-success" id="write-public" type="checkbox" checked>
                    <label class="custom-control-label" for="write-public">댓글 전체 공개</label>
                </div>
                
                <div class="board-detail-comment-confirm-btn">
                    <button class="btn btn-secondary">댓글 등록</button>
                </div>
            </div>
            
            <div class="board-detail-btn-area">
                <div class="board-detail-write-btn">
                    <a href="#" class="btn btn-secondary" type="button">글쓰기</a>
                </div>

                <div class="board-detail-modify-btn">
                    <a href="#" class="btn btn-secondary" type="button">수정</a>
                </div>

                <div class="board-detail-delete-btn">
                    <button class="btn btn-secondary">삭제</button>
                </div>

            </div>

            <br>

            <div class="board-table">
                <table class="table table-hover table-sm">
                    <thead>
                      <tr>
                        <th></th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>좋아요</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>게시글1</td>
                        <td><a href="#" style="color: black;">제목1</a></td>
                        <td><a href="#" style="color: black;">Mark</a></td>
                        <td>날짜1</td>
                        <td>1회</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>게시글2</td>
                        <td><a href="#" style="color: black;">제목2</a></td>
                        <td><a href="#" style="color: black;">Mark</a></td>
                        <td>날짜2</td>
                        <td>2회</td>
                        <td>2</td>
                      </tr>
                      <tr>
                        <td>게시글3</td>
                        <td><a href="#" style="color: black;">제목3</a></td>
                        <td><a href="#" style="color: black;">Mark</a></td>
                        <td>날짜3</td>
                        <td>3회</td>
                        <td>3</td>
                      </tr>
                    </tbody>
                  </table>
            </div>

            <div class="page-btn-area">
                <ul class="pagination justify-content-end" id="pagebtn">
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous" style="color: black;">
                      <span aria-hidden="true">&laquo; 이전</span>
                    </a>
                  </li>
                  
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next" style="color: black;">
                      <span aria-hidden="true">다음 &raquo;</span>
                    </a>
                  </li>
                </ul>
                <a href="#" class="goToBoard" style="color: black;">전체글 보기</a>
            </div>
        </form>
    </div>

    <br>

	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


</body>
</html>
