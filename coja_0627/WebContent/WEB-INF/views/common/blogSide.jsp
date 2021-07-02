<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<!-- -------------------------------------아직 기능은 미구현 ---------------------------------------------- -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>블로그 사이드 메뉴</title>
<style>
/* userInfoArea div와 contentArea div를 감싸는 div */
#contentContainer {
	/* background-color: gray */
	margin: auto;
	width: 1200px;
}

/* 유저정보 div */
#userInfoArea {
	/* background-color: lightgray; */
	width: 296px;
	/* height: 1000px; */
	float: left;
	border-right: 1px solid lightgray;
}

/* 회원정보 영역 확인용 css */
#userInfoArea>div {
	/* background-color: gray; */
	
}

/* 프사영역 div */
#profileImg {
	width: 200px;
	height: 200px;
	margin: auto;
	margin-top: 50px;
	border-radius: 50%;
	border: 1px solid lightgray;
	background-color: gray;
}

/* 블로그 소개글 영역 */
#introduceText {
	width: 250px;
	height: 100px;
	margin: auto;
	margin-top: 10px;
}

/* 블로그 소개글이 영역 내에 안정적으로 들어가게 하기위한 css */
#introduceText>span {
	margin: 10px;
}

/* 잔디영역 div */
#grassArea {
	width: 240px;
	height: 150px;
	margin: auto;
	margin-top: 10px;
}

/* 설정버튼 영역 div */
#settingBtnArea {
	width: 240px;
	height: 40px;
	margin: auto;
	margin-top: 10px;
}

/* 카테고리 영역 div */
#categoryArea {
	width: 200px;
	height: 250px;
	margin: auto;
	margin-top: 10px;
}

/* 블로그 검색 영역 div */
#blogSearchArea {
	width: 260px;
	height: 50px;
	margin: auto;
	margin-top: 30px;
	margin-bottom: 30px;
}

/* 검색입력창 */
#blogSearchBox {
	margin: auto;
	border: 2px solid #c7f1ec;
	width: 85%;
	height: 38px;
	font-size: 13px;
}

/* 달력 스타일 시작 */
#cal-top {
	width: 75px;
	margin: auto;
	font-size: 11px;
	text-align: center;
}

.cal {
	text-align: center;
}

th {
	font-size: 5px;
}

tr {
	height: 10px;
}

table.calendar {
	border: 1px solid black;
	display: inline-table;
	text-align: center;
}

table.calendar td {
	vertical-align: top;
	border: 0.5px solid gray;
	width: 100px;
	font-size: 5px;
}

#cal_tab {
	width: 200px;
	margin: auto;
}

td {
	text-overflow: clip;
}

#movePrevMonth {
	width: 10px;
	height: 10px;
	float: left;
}

#moveNextMonth {
	float: right;
}

/* 달력 스타일 끝 */
</style>
</head>

<body>
	<form method="POST" action="${contextPath}/member/blogSideInfo">
		<div id="contentContainer">
			<!-- 유저 정보관련 영역 -->
			<hr>
			<div id="userInfoArea">
				<div id="profileImg">
					<!-- <img src="#">프사 들어갈 자리 -->
				</div>
				<div class="card border-secondary mb-3" id="introduceText">
					<span>블로그 소개글 간략히 들어갈 자리, 줄바꿈 되는지도 확인할 겸 조금 길게 써봄...</span>
				</div>
				<div class="card border-secondary mb-3" id="grassArea">


					<%-- 달력 html 시작 --%>
					<div id="calander">
						<div class="cal_top" id="cal-top">
							<span aria-hidden="true" id="movePrevMonth"><a href="#">&laquo;</a></span>

							<span id="cal_top_year"></span> <span id="cal_top_month"></span>
							<span aria-hidden="true" id="moveNextMonth"><a href="#">&raquo;</a></span>
						</div>
						<div id="cal_tab" class="cal"></div>
					</div>
					<%-- 달력 html 끝 --%>


				</div>
				<div id="settingBtnArea">잔디 펼치기 및 톱니바퀴 버튼 자리</div>
				<div class="card border-secondary mb-3" id="categoryArea">
					<ul>
						<li>java</li>
						<li>java</li>
						<li>java</li>
						<li>java</li>
						<li>java</li>
						<li>java</li>
						<li>java</li>
						<li>java</li>
						<li>java</li>
					</ul>
				</div>
				<div id="blogSearchArea">
					<input type="search" id="blogSearchBox"
						placeholder="  검색할 단어를 입력하세요.">
					<button class="header-search-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path
								d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg>
					</button>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		var today = null;
		var year = null;
		var month = null;
		var firstDay = null;
		var lastDay = null;
		var $tdDay = null;
		var $tdSche = null;

		$(document).ready(function() {
			drawCalendar();
			initDate();
			drawDays();
			$("#movePrevMonth").on("click", function() {
				movePrevMonth();
			});
			$("#moveNextMonth").on("click", function() {
				moveNextMonth();
			});
		});

		//calendar 그리기
		function drawCalendar() {
			var setTableHTML = "";
			setTableHTML += '<table class="calendar">';
			setTableHTML += '<tr><th style="color:tomato">일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th style="color:royalblue">토</th></tr>';
			for (var i = 0; i < 6; i++) {
				setTableHTML += '<tr height="100">';
				for (var j = 0; j < 7; j++) {
					setTableHTML += '<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
					setTableHTML += '    <div class="cal-day"></div>';
					setTableHTML += '    <div class="cal-schedule"></div>';
					setTableHTML += '</td>';
				}
				setTableHTML += '</tr>';
			}
			setTableHTML += '</table>';
			$("#cal_tab").html(setTableHTML);
		}

		//날짜 초기화
		function initDate() {
			$tdDay = $("td div.cal-day")
			$tdSche = $("td div.cal-schedule")
			dayCount = 0;
			today = new Date();
			year = today.getFullYear();
			month = today.getMonth() + 1;
			firstDay = new Date(year, month - 1, 1);
			lastDay = new Date(year, month, 0);
		}

		//calendar 날짜표시
		function drawDays() {
			$("#cal_top_year").text(year + ".");
			$("#cal_top_month").text(month);
			for (var i = firstDay.getDay(); i < firstDay.getDay()
					+ lastDay.getDate(); i++) {
				$tdDay.eq(i).text(++dayCount);
			}
			for (var i = 0; i < 42; i += 7) {
				$tdDay.eq(i).css("color", "tomato");
			}
			for (var i = 6; i < 42; i += 7) {
				$tdDay.eq(i).css("color", "royalblue");
			}

			// 오늘날짜 표시
			$tdDay.eq(today.getUTCDate() + 1).css("background-color", "pink");
		}

		//calendar 월 이동
		function movePrevMonth() {
			month--;
			if (month <= 0) {
				month = 12;
				year--;
			}
			if (month < 10) {
				month = String(month);
			}
			getNewInfo();
		}

		function moveNextMonth() {
			month++;
			if (month > 12) {
				month = 1;
				year++;
			}
			if (month < 10) {
				month = String(month);
			}
			getNewInfo();
		}

		function getNewInfo() {
			for (var i = 0; i < 42; i++) {
				$tdDay.eq(i).text("");
			}
			dayCount = 0;
			firstDay = new Date(year, month - 1, 1);
			lastDay = new Date(year, month, 0);
			drawDays();
		}
	</script>

</body>

</html>