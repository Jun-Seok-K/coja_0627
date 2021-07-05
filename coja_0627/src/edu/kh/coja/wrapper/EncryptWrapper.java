package edu.kh.coja.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {

   // HttpServletRequestWrapper 라는 클래스가 있음
   // -> 사용자 요청을 감싸서 요청데이터 가공을 하는 객체 (ex. request에 담긴 비번을 가공한다)
   // -> Wrapper로 지정된 클래스에서 상속을 받아야 한다. 

   
   // HttpServletRequestWrapper를 상속 받으면 반드시 매개변수있는 생성자를 만들어야 한다
   public EncryptWrapper(HttpServletRequest request) {
      super(request);

   }
   
   /// HttpServletRequest의 자식으로 HttpServletRequestWrapper 이가 있음. EncryptWrapper가 HttpServletRequestWrapper 상속받음
   // 파라미터로 전달 받은 값 중 비밀번호를 얻어와 암호화를 진행
   // request.getParameter() 오버라이딩 필요
   
   @Override
   public String getParameter(String key) {
      
      // 매개변수 key == input 태그의 name 속성값
      
      String value = null; // 
      
      
      /// key 값이 "memberPw" 또는 "pwd1" 으로 넘어왔을 때 value 값은 
      switch(key) {
      case "pw1" :
      case "memPw" :
      case "currentPw" :
      //case "currentPwd" : // 비번 변경 부분의 현재비번...
      //case "newPwd1" : // 비번 변경 부분의 새 비번...
         // 비밀번호는 암호화 
         value = getSha512( super.getParameter(key) ); break;
      default : 
         // 비밀번호가 아닌애들은 그냥 반환
         value = super.getParameter(key);
      }
      return value;
   }

   /** SHA-512 해쉬 함수를 이용하여 문자열 암호화를 진행하는 메소드
    * @param pwd
    * @return encPwd
    */
   public static String getSha512(String pwd) {
      
      // 1. 암호화된 비밀번호를 저장할 변수 선언
      String encPwd = null;
      
      // 2. 해쉬 함수를 수행하는 객체를 저장할 변수 선언
      // 해쉬 함수 : 특정 값을(/문자열 같은) 여러 단계의 연산을 거쳐 일정 길이의 무작위 값을 얻어내는 함수
      MessageDigest md = null;
      
      /// try-catch 필요 -> getInstance에 마우스 올리면 관련 익셉션 나옴
      try {
         // 3. SHA-512 방식의 해쉬함수를 수행할 수 있는 객체를 얻어옴
         md = MessageDigest.getInstance("SHA-512");
         
         // 4. MessageDigest를 이용해 문자열 암호를 하기 위해 byte 배열로 변환
         byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
         
         // 5. md 객체에 바이트로 변환된 비밀번호를 전달하여 암호화를 수행
         md.update(bytes); /// 값을 주면 md가 오 값이 넘어왔군. 암호화해서 내가 가지고 있을게!
         
         // 6. md 객체에서 암호화된 내용을 꺼내옴
         // Base64 : 바이트 코드를 문자열로 바꾸는 라이브러리(자바가 기본적으로 포함하고 있음)
         encPwd = Base64.getEncoder().encodeToString(md.digest());
         // md.digest() : 암호화된 코드를 꺼내옴
         /// Base64.getEncoder().encodeToString -> String 배열로 바꾸는 작업 왜? md.dgest()의 반환형이 String[] 임
         
         System.out.println("암호화 전 : " + pwd);
         System.out.println("암호화 후 : " + encPwd);
         
      } catch (NoSuchAlgorithmException e) {
         // SHA-512 해쉬함수가 없는 경우 발생
         e.printStackTrace();
      }
      
      return encPwd;
   }
   
   
   

}