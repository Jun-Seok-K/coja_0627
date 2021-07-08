package edu.kh.coja.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.coja.member.model.service.MemberService;
import edu.kh.coja.member.model.vo.Member;


@WebServlet("/member/findPw")
public class FindPwServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/findPw.jsp");
      view.forward(request, response);
      
   }

   //POST 방식으로 id와 email을 넘겨 받음 
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String id = request.getParameter("id");
      String email = request.getParameter("email");
      
      // 임시 비번 생성
      String random = null ;
      String random2 = null;
      for(int i = 0 ; i<50 ; i ++ ) {
         int ranNo = (int)(Math.random() * 9000 +1000) ;
         char ranCh = (char)((int)(Math.random() * 25 + 65));
         random = Integer.toString(ranNo) + ranCh;
         int ranNo2 = (int)(Math.random() * 9000 +1000) ;
         char ranCh2 = (char)((int)(Math.random() * 25 + 65));
         random2 = Integer.toString(ranNo2) + ranCh2;
      };
      
      String tempPw = random+random2; // 유저에게 보낼 임의의 컨펌넘버 (랜덤으로 난수 발생해서 실행할 것)
      
      HttpSession session = request.getSession();
      RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/foundPw.jsp");
      
      try {
         
         // 로그인 Service를 위한 MemberService 객체 생성
         MemberService service = new MemberService();
         
         // 로그인 요청을 처리할 수 있는 서비스 메소드를 호출하고 로그인 결과를 반환 받음.
         int result = service.findPw(id, email, tempPw);

         if(result>0) { // 임시비밀번호로 변경 완료
            System.out.println("임시 비번으로 변경 성공");
            request.setAttribute("tempPw", tempPw);
            
            // 이메일 보내기 
               String host = "http://localhost:8080/coja_0627/";
               String from = "miacancun10@gmail.com";
               String to = email;
               System.out.println("to : " + to);

               String subject = "코자에서 회원님의 임시비밀번호를 알려드립니다 .";
               String content = "회원님의 임시 비밀번호는 " + tempPw + "입니다. <br>" 
                           + "임시 비밀번호로 로그인 후 비밀번호를 변경해 주세요. ";

               Properties prop = new Properties();
               prop.setProperty("mail.transport.protocol", "smtp");
               prop.setProperty("mail.host", "smtp.gmail.com");
               prop.setProperty("mail.smtp.port", "465");
               prop.setProperty("mail.smtp.auth", "true");
               prop.setProperty("mail.smtp.socketFactory.port", "465");
               prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
               prop.setProperty("mail.smtp.socketFactory.fallback", "false");
               prop.setProperty("mail.smtp.ssl.enable", "true");
               prop.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
               prop.put("mail.store.protocol", "pop3");

               // 메일 서버 인증 계정 설정
               Authenticator auth = new Authenticator() {
                  protected PasswordAuthentication getPasswordAuthentication() {
                     return new PasswordAuthentication("miacancun10@gmail.com", "lukamilaleo10");
                  }
               };

               Session sess = Session.getDefaultInstance(prop, auth);
               MimeMessage msg = new MimeMessage(sess);
               Address fromAddr = new InternetAddress(from);
               Address toAddr = new InternetAddress(to);
               msg.setFrom(fromAddr);
               msg.addRecipient(Message.RecipientType.TO, toAddr);
               msg.setSubject(subject);
               msg.setContent(content, "text/html;charset=UTF-8");
               Transport.send(msg);

               System.out.println("성공");
            
            view.forward(request,response);
         }
         else {
            System.out.println("임시 비번으로 변경 실패");
            request.setAttribute("tempPw", null);
            view.forward(request,response);
         }
         
      }catch (Exception e) {
         e.printStackTrace();
         request.setAttribute("errorMsg", "비밀번호를 찾는 과정에서 문제가 발생했습니다.");
         
      }
   }
   

}