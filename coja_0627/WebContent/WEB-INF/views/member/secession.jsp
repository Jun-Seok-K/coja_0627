<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴약관 동의</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<!-- sweetalert API추가 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
    <style>

        /*---------------------------------------------------------------------------------------content 시작*/

        /* -----------background-color 주석 제거하면 영역 확인 가능 */
        .content {
            /* background-color: tomato; */
            width: 1200px;
            margin: auto;
        }
        .con-terms{
            width:1000px;
            margin:auto;
        }
        .terms-title{
            margin-top : 50px;
            font-size: 40px;
            font-weight: bold;
        }
        .terms-content{
            margin-top : 30px;
            font-size: 20px;

        }
        .terms-button{
            margin-top : 30px;
            margin-bottom : 50px;
            text-align: center;
        }

    </style>

</head>

<body>
    <!-- 영역구문선--------------------------------------------------------------------------------- -->

    <div class="content">
    
    <jsp:include page="../common/headerMain.jsp"></jsp:include>
        <div class="con-terms">
            <div class="terms-title">
                <span>회원탈퇴 약관</span>
            </div>
            <div class="terms-content">
            				<!-- post로 탈퇴요청보낸다  ,onsubmit :제출이 되었을때 -->

                <div>
                    회원 탈퇴 시 주의사항<br>
                    
                    1)탈퇴한 아이디로는 다시 가입할 수 없으며,<br>
                    아이디 및 데이터는 복구할 수 없으므로 회원탈퇴 시 신중히 진행해 주시길 부탁드립니다.<br>
                    <br>
                    2) 회원정보 및 개인형 서비스의 데이터는 지체없이 파기 절차가 진행되어 복구할 수 없습니다.<br>
                    <br>
                    3) 게시판형 서비스에 등록한 게시물은 탈퇴 후에도 남아 있으므로 <br>
                    아이디 탈퇴 전 반드시 비공개 처리하거나 삭제해 주시기 바랍니다.<br>
                    <br>
                    4) 동일한 수단으로 실명인증한 아이디가 여러개인 경우<br>
                    1개의 아이디를 탈퇴해도 다른 아이디는 계속해서 사용 가능합니다.<br>
                    </div>
            </div>
            <div class="terms-button">
				<form method="POST" action="secession" onsubmit="return secessionValidate();" 
					class="form-horizontal" role="form">
                    <label><input type="checkbox" name="signin" id="agree">동의</label>
                    <!-- <label><input type="radio" name="signin" >미동의</label> -->
                    <br>

                    <button type="submit">탈퇴하기</button>
                    <button type="reset">취소</button>
                </form>
            </div>


        </div>
        
    </div>

    <!-- ===============================영역구분선=============================== -->


   
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<script>
		function secessionValidate(){
			
			if( !$("#agree").prop("checked") ){
				swal({"icon" : "info", "title" : "약관 동의를 체크해주세요."})
				return false;
			
			}else{
				/*swal("탈퇴하시겠습니까?", {
				  buttons: {
				    cancel: "아니요",
				    defeat: "예",
				  },
				})
				.then(function(value) {
					
					if(value == null){
				  		return false;
				  	}else{
				  		return true;
				  	}
				});*/
				
				if( !confirm("탈퇴하시겠습니까?") ){
					return false;
					
			}
		}
		}
	</script>
<script>

</script>







</body>
</html>