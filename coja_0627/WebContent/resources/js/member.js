
/// 이 코드에는 jQ가 포함 되어있음 -> sign.jsp 보면 헤더에 jq코드를 쓸 수 있게 작성되어있음
/// -> 이 부분 전에 작성하면 안되고, 안전하게 body태그 끝나기 바로 전에 삽입하자.

// 회원 가입 유효성 검사 (이클립스의 signUp.jsp 옆에 켜놓고 보면서 하기)
// 각 유효성 검사 결과를 저장할 객체
		
const checkObj = {
    "id": false,
    "pw1": false,
    "pw2": false,
    "name": false,
    "nickName": false,
    "email": false,
    "workExp": false,
    "expYr": false
};

// 아이디가 입력될 때 마다 유효성 검사
// 조건 : 영어, 숫자 6~14글자

$("#id").on("input",function(){

    // 아이디가 입력되는 경우 hidden타입 태그의 값을 false로 변경 -> 얘는 팝업창으로 검사할 때만 필욜하니까 ajax 후 주석처리 한다. + 제일 밑에 validate()도
    //$("#idDup").val(false);

    // 정규표현식 객체 생성
    const regExp = /^[a-zA-Z\d]{6,12}$/;

    // 입력된 아이디(양쪽 공백 제거)를 얻어와 inputId 변수에 저장
    const inputId = $("#id").val().trim();

    // jsp파일 보면 이런게 있음 <span id="checkId">&nbsp;</span>
    // 입력된 아이디가 정규식에 일치하는 경우 == 유효한 값인 경우
    if( regExp.test(inputId) ){
        
        //$("#checkId").text("유효한 아이디 입니다.").css("color","green");
        //checkObj.id = true;

        /// 여그는 ajax -> 중복이다 아니다만 쓰면 됨 / ajax 전엔 바로 위에 주석 아니었음
        // Ajax를 이용하여 비동기적으로 아이디 중복검사를 진행

        // jQuery를 이용한 Ajax
        // $.ajax({url : "주소" , 선택속성});

        /*$.ajax({
            url : "idDupCheck" , 
            data : { "id" : inputId },  
            type : "post",      

            success : function(){}, 
            error : function(){}  
        });*/

        $.ajax({
            url : "idDupCheck" , // 요청 주소(필수!)  ///->  상대경로로 요청 (idDupCheckServlet 임)
            data : { "id" : inputId },  // 전달하려는 값(파라미터)  /// key(id)값으로 value(inputId)를 전달하겠다
            type : "post",      // 데이터 전달 방식 /// idDupCheck에서 POST 방식일 때에만 아이디 유효성 검사하니까

            success : function(result){
                // 매개변수 result : 서버에서 비동기로 전달 받은 응답 데이터

                console.log(result);  /// -> 0이나 1 나옴

                if(result>0){ // 아이디가 중복되는 경우
                    $("#checkId").text("이미 사용중인 아이디 입니다.").css("color","red");
                    checkObj.id = false;
                    
                }else { // 아이디가 중복되지 않는 경우
                    $("#checkId").text("사용 가능한 아이디 입니다.").css("color","green");
                    checkObj.id = true;
                }
                
            }, // 비동기 통신 성공 시 동작
            error : function(e){
                // 매개변수 e : 예외 발생 시 Exception 객체를 전달 받을 변수 (서버에서 에러가 나면 여기서 에러메세지를 보여줄 수 있음)

                console.log("ajax 통신 실패"); 
                console.log(e); 

            }  // 비동기 통신 실패 시 동작 
        });         

    } else {

        $("#checkId").text("영어, 숫자 6~12글자로 작성").css("color","red");

        checkObj.id = false;
    }
});

// 이름 유효성 검사
// 조건 : 한글 두 글자 이상 5글자 이하 ->  /^[가-힣]{2,5}$/;

$("#name").on("input",function(){
    const regExp = /^[가-힣]{2,5}$/;

    // 이벤트 핸들러 내부에 작성된 this == 이벤트가 발생한 요소 == $("#name")
    // const inputName = $("#name").val().trim();
    const inputName = $(this).val().trim();

    if ( regExp.test(inputName) ){
        $("#checkName").text("유효한 이름입니다.").css("color","green");
        checkObj.name = true;
        
    }else{
        $("#checkName").text("이름은 2~5글자 사이로 한글로만 입력할 수 있습니다.").css("color","red");     
        checkObj.name = false;
    }
});


// 닉네임 유효성 및 중복 검사
$("#nickName").on("input",function(){

    const regExp = /^[a-zA-Z가-힣0-9]{2,10}$/;

    const inputNickName = $("#nickName").val().trim();

    if( regExp.test(inputNickName) ){
        
        $.ajax({
            url : "nickNameDupCheck" , // 요청 주소(필수!)  ///->  상대경로로 요청 (idDupCheckServlet 임)
            data : { "nickName" : inputNickName },  // 전달하려는 값(파라미터)  /// key(id)값으로 value(inputId)를 전달하겠다
            type : "post",      // 데이터 전달 방식 /// idDupCheck에서 POST 방식일 때에만 아이디 유효성 검사하니까

            success : function(result){
                // 매개변수 result : 서버에서 비동기로 전달 받은 응답 데이터

                console.log(result);  /// -> 0이나 1 나옴

                if(result>0){ // 아이디가 중복되는 경우
                    $("#checkNickName").text("이미 사용중인 닉네임 입니다.").css("color","red");
                    checkObj.nickName = false;
                    
                }else { // 아이디가 중복되지 않는 경우
                    $("#checkNickName").text("사용 가능한 닉네임 입니다.").css("color","green");
                    checkObj.nickName = true;
                }
                
            }, // 비동기 통신 성공 시 동작
            error : function(e){
                // 매개변수 e : 예외 발생 시 Exception 객체를 전달 받을 변수 (서버에서 에러가 나면 여기서 에러메세지를 보여줄 수 있음)

                console.log("ajax 통신 실패"); 
                console.log(e); 

            }  // 비동기 통신 실패 시 동작 
        });         

    } else {

        $("#checkNickName").text("한글,영어,숫자 2~12글자로 작성").css("color","red");

        checkObj.nickName = false;
    }
});        

// 닉네임 유효성 및 중복 검사
$("#email").on("input",function(){

    const regExp = /^[\w]{3,}@[\w]+(\.[\w]+){1,3}$/;
	const inputEmail = $("#email").val().trim();

    if( regExp.test(inputEmail) ){
        
        $.ajax({
            url : "emailDupCheck" , // 요청 주소(필수!)  ///->  상대경로로 요청 (idDupCheckServlet 임)
            data : { "email" : inputEmail },  // 전달하려는 값(파라미터)  /// key(id)값으로 value(inputId)를 전달하겠다
            type : "post",      // 데이터 전달 방식 /// idDupCheck에서 POST 방식일 때에만 아이디 유효성 검사하니까

            success : function(result){
                // 매개변수 result : 서버에서 비동기로 전달 받은 응답 데이터

                console.log(result);  /// -> 0이나 1 나옴

                if(result>0){ // 아이디가 중복되는 경우
                    $("#checkEmail").text("가입된 이메일 입니다.").css("color","red");
                    checkObj.email = false;
                    
                }else { // 아이디가 중복되지 않는 경우
                    $("#checkEmail").text("사용 가능한 이메일 입니다.").css("color","green");
                    checkObj.email = true;
                }
                
            }, // 비동기 통신 성공 시 동작
            error : function(e){
                // 매개변수 e : 예외 발생 시 Exception 객체를 전달 받을 변수 (서버에서 에러가 나면 여기서 에러메세지를 보여줄 수 있음)

                console.log("ajax 통신 실패"); 
                console.log(e); 

            }  // 비동기 통신 실패 시 동작 
        });         

    } else {

        $("#checkEmail").text("이메일을 정확하게 입력하십시오").css("color","red");

        checkObj.email = false;
    }
});        

// 비밀번호 유효성 검사
// 조건 : 영어, 숫자, 특수문자( # - _ ) 6~20 글자

$("#pw1").on("input",function(){
    
    const regExp = /^[a-zA-Z0-9\#\-\_]{6,20}$/;
    
    const inputPw1 = $(this).val().trim();
    
    if(regExp.test(inputPw1)){
        $("#checkPw1").text("유효한 비밀번호입니다.").css("color","green");

        checkObj.pw1 = true;
    }else{
        $("#checkPw1").text("비밀번호 형식이 올바르지 않습니다.").css("color","red");
        
        checkObj.pw1 = false;
    }
});


// 비밀번호, 비밀번호 확인 일치 여부 판단
/// 선택자에 pw1을 넣어야, 두 개 일치 판단 후 1에 다른 값을 더 입력해도 일치로 뜸
$("#pw1, #pw2").on("input", function(){ 
    
    const pw1 = $("#pw1").val();
    const pw2 = $("#pw2").val();
    
    
    if( pw1.trim() == "" && pw2.trim() == ""){ // 둘다 비었을 때
        $("#checkPw1").html("&nbsp;");  // &nbsp; == 띄어쓰기 
        $("#checkPw2").html("&nbsp;");
        
        checkObj.pw2 = false;
        
    }else if (pw1 == pw2) {
        $("#checkPw2").text("비밀번호 일치").css("color","green");
        
        checkObj.pw2 = true;
        
    }else{
        $("#checkPw2").text("비밀번호 불일치").css("color","red");
        
        checkObj.pw2 = false;
    }

});


// 회원 가입 버튼 클릭 시 전체 유효성 검사 여부 확인
function validate(){

    // 아이디 중복 검사를 진행했는지 확인
    // -> 얘는 팝업창으로 검사할 때만 필욜하니까 ajax 후 주석처리 한다. + 중복검사 버튼도 없애라! signUp.jsp에서
    /*
    if( $("#idDup").val() != "true" ){ // 중복 검사를 안한 경우
        swal("아이디 중복 검사를 진행해 주세요").then(function(){
            $("#idDupCheck").focus(); // 중복 검사 버튼으로 포커스 이동
        });

        return false; // submit 이벤트 제거 
    };
    */

    //checkObj에 작성된 속성들이 모두 true인지 확인

    // 객체 내 속성을 순차접근하는 반복문 : for in 구문
    for(const key in checkObj){
        if(!checkObj[key] ){ // false 값을 가진 속성이 있을 경우 == 유효성 검사를 제대로 통과하지 못함
            let msg;
            switch (key) {
            case "id":
               msg = "아이디가 유효하지 않습니다.";
               break;
            case "pw1":
               msg = "비밀번호가 유효하지 않습니다.";
               break;
            case "pw2":
               msg = "비밀번호가 일치하지 않습니다. ";
               break;
            case "name":
               msg = "이름이 유효하지 않습니다.";
               break;
            case "nickName":
               msg = "닉네임이 유효하지 않습니다. ";
               break;
            case "email":
               msg = "이메일이 유효하지 않습니다.";
                  break;
            }

            // msg에 담긴 내용을 출력

            swal(msg).then(function(){

                const selector = "#" + key ; // id 선택자를 selector에 저장

                $(selector).focus();
                // 유효하지 않은 값을 입력한 부분으로 포커스 이동

            });

            return false; // submit 이벤트 제거(회원가입 실행 막기)

        }
    }
}


