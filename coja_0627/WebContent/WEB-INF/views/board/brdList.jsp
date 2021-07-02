<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 게시글 목록 조회</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <style>
        /* content(B,C,D행) --------------------------------------------------------------------------- 시작 
                
        /* content B) 게시글 목록 스타일 (B행) */

        .board_list_wrap {
            width: 1200px;
            height: 700px;
            box-sizing: border-box;
            margin: auto;
            /* border: 2px solid red; */
        }

        .board_list {
            width: 1200px;
            height: 700px;
            border-bottom: 5px solid grey;
            font-size: 18px;
            text-align: center;
            /* border: 2px solid red; */
        }

        .board_list_head {
            border-top: 2px solid grey;
            border-bottom: 2px solid grey;
            height: 60px;
        }

        .board_list_body {
            height: auto;
        }

        .board_list .category {
            width: 10%;
        }

        .board_list .num {
            width: 5%;
        }

        .board_list .title {
            width: 40%;
        }

        .board_list .writer {
            width: 10%;
        }

        .board_list .date {
            width: 10%;
        }

        .board_list .view {
            width: 5%;
        }

        .board_list .like {
            width: 5%;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* content C) 게시글 페이지 버튼 스타일(C행) */

        .pagebutton {
            width: 1200px;
            height: 70px;
            margin: auto;
            /* border: 1px solid black; */
        }

        .pagebtn {
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }

        .page-link {
            position: relative;
            display: block;
            padding: .5rem .75rem;
            margin-left: -1px;
            line-height: 1.25;
            color: grey;
            background-color: #dee2e6;
            border: 1px solid white;
        }

        .page-link:hover {
            z-index: 2;
            color: #0056b3;
            text-decoration: none;
            background-color: white;
            border-color: #dee2e6
        }

        .page-item.disabled .page-link {
            color: #6c757d;
            pointer-events: none;
            cursor: auto;
            background-color: #dee2e6;
            border-color: white
        }

        .pagination-lg .page-link {
            padding: .75rem 1.5rem;
            font-size: 1.25rem;
            line-height: 1.5
        }


        /* content D) 신고, 검색파트, 글작성 스타일(E행) */

        /* D) 신고, 검색파트, 글작성을 감싸는 전체 div (E행) */
        .searcharea {
            width: 1200px;
            height: 80px;
            margin: auto;
        }

        /* D-1) 신고마크 div(E행1열) */
        .accuse {
            width: 15%;
            height: 100%;
            float: left;
            /* border: 1px solid red */
        }

        /* 신고 마크 */
        .accuse>a>svg {
            transform: translateY(50%);
            /* border: 1px solid red; */
        }

        /* D-2) 게시글 검색창과 버튼영역을 모두 아우르는 div(D행2열) -> 2개의 열로 재분리 */
        .body-searchbox {
            width: 70%;
            height: 100%;
            float: left;
            /* border: 1px solid red; */
        }

        /* D-2-가) 게시글 검색창 div(D행 2열 가열) */
        #search1 {
            width: 70%;
            height: 100%;
            float: left;
            /* border: 1px solid red; */
        }

        /* 게시글 검색 입력창 */
        .body-search-area {
            border: 1px solid grey;
            width: 80%;
            height: 50%;
            font-size: 20px;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }

        /* D-2-나) 게시글 검색 버튼 div(D행 2열 나열) */
        #searchbtn1 {
            width: 30%;
            height: 100%;
            float: left;
            /* border: 1px solid red; */
        }

        /* 게시글 검색 버튼 */
        .body-search-button {
            width: 40%;
            height: 50%;
            cursor: pointer;
            border-style: none;
            border-radius: 10px;
            color: grey;
            font-weight: bolder;
            font-size: 1 rem;
            background-color: #c7f1ec;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
            left: 10px;
        }

        /* 게시글 글작성버튼 스타일(D행 3열) */

        /* D-3) 글작성 버튼 div */
        .writing {
            width: 15%;
            height: 100%;
            float: left;
            /* border: 1px solid red; */
        }

        /* 글작성 버튼 */
        .writingbtn {
            width: 150px;
            height: 50px;
            border-radius: 10px;
            border-style: none;
            background-color: #c7f1ec;
            color: gray;
            font-weight: bolder;
            font-size: 1.25rem;
            transform: translateY(25%);
        }

        /* content 끝 */
    </style>
</head>
<body>

    <!-- contents 시작 -->
    <!-- 1) 게시글 조회 목록 -->
    <div class="board_list_wrap" align="center">
        <table class="board_list">
            <thead class="board_list_head">
                <tr>
                    <th class="num">글번호</th>
                    <th class="category">카테고리</th>
                    <th class="title">제 목</th>
                    <th class="writer">작성자</th>
                    <th class="date">작성일</th>
                    <th class="view">조회수</th>
                    <th class="like">♥</th>
                </tr>
            </thead>

            <%-- 게시글 목록 출력 --%>
            <tbody>
                <c:choose>
						
					<%-- 조회된 게시글 목록이 없는 경우 --%>
					<c:when test="${empty brdList}">
						<tr>
							<td colspan="7">게시글이 존재하지 않습니다.</td>
						</tr>
					</c:when>
							
					<%-- 조회된 게시글 목록이 있을 경우 --%>
					<c:otherwise>
						<c:forEach items="${brdList}" var="board">
							<tr class="item">
								<%-- 글번호 --%>
								<td> ${board.brdNo} </td>
										
								<%-- 카테고리 --%>
								<td> ${board.brdTypeNm} </td>
										
								<%-- 글 제목 --%>
								<td class="boardTitle">
								    <a href="view?no=${board.brdNo}&cp=${pagination.brdCurrentPage}&type=${pagination.brdType}">${board.brdTitle}</a>
								</td>
										
								<%-- 작성자 --%>
								<td> ${board.memNick} </td>
										
								<%-- 조회수 --%>
								<td> ${board.brdReadCount} </td>
										
								<%-- 작성일 --%>
								<td> 
									<fmt:formatDate var="createDate" value="${board.brdCreateDt}"  pattern="yyyy-MM-dd"/>                          
									<fmt:formatDate var="today" value="<%= new java.util.Date() %>"  pattern="yyyy-MM-dd"/>                          
											
									<c:choose>

										<%-- 글 작성일이 오늘이 아닐 경우 --%>
										<c:when test="${brdCreateDt != today}">
											${brdCreateDt}
										</c:when>
												
										<%-- 글 작성일이 오늘일 경우 --%>
										<c:otherwise>
											<fmt:formatDate value="${board.brdCreateDt}"  pattern="HH:mm"/>                          
										</c:otherwise>

									</c:choose>
								</td>
								
								<%-- 좋아요 --%>
								<td> ${board.brdLike} </td>
						</c:forEach>
					</c:otherwise>

				</c:choose>               
            </tbody>
        </table>
    </div>


    <!-- 2) 게시판 pagination -->

    <%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>
    <c:set var="pageURL" value="list?type=${brdPagination.brdType}" />
    <c:set var="prev" value="${pageURL}&cp=${brdPagination.brdPrevPage}" />
    <c:set var="next" value="${pageURL}&cp=${brdPagination.brdNextPage}" />
    
    <div class="pagebutton">
        <nav class="pagebtn" aria-label="Page navigation example">
            <ul class="pagination justify-content-center pagination-lg">
            
                <%-- 현재 페이지가 10페이지 초과인 경우 --%>
                <c:if test="${brdPagination.brdCurrentPage > brdPagination.brdPageSize}">
                    <li class="page-item"><a class="page-link" href="${prev}">&lt;&lt;</a></li>
                </c:if>
                
                <%-- 현재 페이지가 2페이지 초과인 경우 --%>
                <c:if test="${brdPagination.brdCurrentPage > 2}">
                    <li class="page-item"><a class="page-link" href="${pageURL}&cp=${brdPagination.brdCurrentPage - 1}">&lt;</a></li>
                </c:if>
                
                
                <%-- 페이지 목록 --%>
                <c:forEach var="p" begin="${brdPagination.brdStartPage}" end="${brdPagination.brdEndPage}">
                    <c:choose>
                        <c:when test="${p == brdPagination.brdCurrentPage}">
                            <li class="page-item active"><a class="page-link">${p}</a></li>
                        </c:when>
                            
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="${pageURL}&cp=${p}">${p}</a></li>
                        </c:otherwise>
                    </c:choose>					
                </c:forEach>
                
                
                <%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
                <c:if test="${brdPagination.brdCurrentPage < brdPagination.brdNextPage}">
                    <li class="page-item"><a class="page-link" href="${pageURL}&cp=${brdPagination.brdCurrentPage +  1}">&gt;</a></li>
                </c:if>
                
                <%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
                <c:if test="${brdPagination.brdCurrentPage - brdPagination.brdMaxPage + brdPagination.brdPageSize < 0}">
                    <li class="page-item"><a class="page-link" href="${next}">&gt;&gt;</a></li>
                </c:if>

            </ul>
        </nav>
    </div>


    <!-- 검색 영역 -->
    <div class="searcharea">

        <!-- 3) 신고 버튼 (로그인 되어 있을 경우에만 신고 버튼 노출) -->
        <c:if test="${!empty loginMember}">
	        <div class=accuse>
	            <a href="#">
	                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
	                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
	                    <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
	                </svg>
	            </a>
	        </div>
        </c:if>

        <!-- 4) 게시글 검색 -->
        <div class="body-searchbox">
            <form action="#" method="GET" id="boardSearchForm">
                <select name="sk" class="form-control" style="width: 100px; display: inline-block;">
                    <option value="title">글제목</option>
                    <option value="content">내용</option>
                    <option value="titcont">제목+내용</option>
                    <option value="writer">작성자</option>
                </select>

                <div id="search1" align="right">
                    <input type="search" class="body-search-area" id="search-text-area1" placeholder=" 게시글 검색">
                </div>
    
                <div id="searchbtn1" align="left">
                    <button type="button" class="btn btn-secondary body-search-button">검색</button>
                </div>
            </form>
        </div>

        <!-- 5) 게시글 작성 버튼 (로그인 되어 있을 경우에만 글쓰기 버튼 노출) -->
        <c:if test="${!empty loginMember}">
            <div class="writing" align="right">
                <button type="button" class="btn btn-secondary writingbtn" onclick="location.href='../board2/insertForm?type=${brdPagination.brdType}';">글작성</button>
            </div>
        </c:if>

    </div>
    <!-- contents 끝-->

    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
    crossorigin="anonymous"></script>

</body>
</html>