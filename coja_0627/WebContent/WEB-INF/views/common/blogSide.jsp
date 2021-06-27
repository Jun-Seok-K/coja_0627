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
    </style>
</head>

<body>
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
                잔디 어떻게 할지 고민...
            </div>
            <div id="settingBtnArea">
                잔디 펼치기 및 톱니바퀴 버튼 자리
            </div>
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
                <input type="search" id="blogSearchBox" placeholder="  검색할 단어를 입력하세요.">
                <button class="header-search-button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                        class="bi bi-search" viewBox="0 0 16 16">
                        <path
                            d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg>
                </button>
            </div>
        </div>
    </div>
    <!-- ===============================영역구분선=============================== -->
    <!-- footer include 자리 -->
</body>

</html>