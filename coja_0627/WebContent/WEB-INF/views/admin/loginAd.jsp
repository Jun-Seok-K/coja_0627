<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />

<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.83.1">
  <title>Signin Template · Bootstrap v5.0</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>


  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <style>
    /* ------------border 영역 주석 제거하면 영역 확인 가능 */
    div {
      /* border: 1px solid black; */
      box-sizing: border-box;
    }


    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    html,
    body {
      height: 100%;
    }

    body {
      display: flex;
      align-items: center;
      padding-top: 40px;
      padding-bottom: 40px;
      background-color: #f5f5f5;
    }

    .form-signin {
      width: 100%;
      max-width: 330px;
      padding: 15px;
      margin: auto;
    }

    .form-signin .checkbox {
      font-weight: 400;
    }

    .form-signin .form-floating:focus-within {
      z-index: 2;
    }

    .form-signin input[type="email"] {
      margin-bottom: -1px;
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }

    .form-signin input[type="password"] {
      margin-bottom: 10px;
      border-top-left-radius: 0;
      border-top-right-radius: 0;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
    

    <main class="form-signin">
      <form method="POST" action="login" onsubmit="return loginValidate();">
        <img class="mb-4" src="logo.png">
        <h1 class="h3 mb-3 fw-normal">Coja Admin Page</h1>

        <div class="form-floating">
          <input type="text" class="form-control" id="id" name="id" placeholder="Administrator ID">
          <label for="floatingInput"></label>
        </div>
        <div class="form-floating">
          <input type="password" class="form-control" id="password" name="password" placeholder="Password">
          <label for="floatingPassword"></label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit">login</button>
      </form>
    </main>
    
    	<script>
		// 로그인 수행 시 아이디/비밀번호가 작성 되었는지 확인하는 유효성 검사
		function loginValidate() {

			if ($("#id").val().trim().length == 0) {

				swal({
					"icon" : "warning",
					"title" : "아이디를 입력해주세요",
					"button" : "확인"

				}).then(function() {
					// 아이디 입력창으로 포커스 이동
					$("#id").focus();
				});

				// 제출되지 않도록 submit 기본 이벤트 제거
				return false;
			}

			if ($("#password").val().trim().length == 0) {

				swal({
					"icon" : "warning",
					"title" : "비밀번호를 입력해주세요",
					"button" : "확인"

				}).then(function() {
					// 아이디 입력창으로 포커스 이동
					$("#password").focus();
				});

				// 제출되지 않도록 submit 기본 이벤트 제거
				return false;
			}
		}
	</script>
	

  </body>

</html>