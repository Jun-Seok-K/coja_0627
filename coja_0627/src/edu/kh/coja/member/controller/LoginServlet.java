package edu.kh.coja.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.coja.member.model.service.MemberService;
import edu.kh.coja.member.model.vo.Member;

@WebServlet("/member/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1. POST 방식 전송 값은 한글이 깨짐 -> 문자 인코딩 변경
		/* request.setCharacterEncoding("UTF-8"); */
		
		// 2. 로그인 요청 시 전달 받은 파라미터를 변수에 저장
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		
		String save = request.getParameter("save");
		
		try {
			
			// 로그인 Service를 위한 MemberService 객체 생성
			MemberService service = new MemberService();
			
			// 로그인 요청을 처리할 수 있는 서비스 메소드를 호출하고 로그인 결과를 반환 받음.
			Member loginMember = service.login(memId, memPw);
			
			// 세션을 얻어와 변수에 저장
			HttpSession session = request.getSession();
			
			// 서비스 수행 결과에 따른 View 연결 처리
			if(loginMember != null) { // 로그인 성공
				
				// session에 로그인 정보 추가
				session.setAttribute("loginMember", loginMember);
				
				// 30분 후 세션 만료
				session.setMaxInactiveInterval(1800); // 초 단위로 작성
								
				// 1) Cookie 객체 생성
				Cookie cookie = new Cookie("saveId", memId);
				
				// 2) 아이디 저장이 체크된 경우
				if(save != null) {
					cookie.setMaxAge(60 * 60 * 24 * 7); // 초 단위
					
				} else {
					// 3) 아이디 저장이 체크되지 않은 경우
					// -> 아이디가 저장된 쿠키 제거
					cookie.setMaxAge(0); // 만료 기간 0초 == 쿠키 제거
				}
				
				// 4) 쿠키가 사용될 수 있는 유효한 경로(디렉토리 또는 주소)를 설정
				cookie.setPath( request.getContextPath() );
			
				// 5) response에 Cookie를 담아서 클라이언트로 전달
				response.addCookie(cookie);					
				
			}else { // 로그인 실패
				
				session.setAttribute("icon", "error");
				session.setAttribute("title", "로그인 실패");
				session.setAttribute("text", "아이디 또는 비밀번호가 일치하지 않습니다.");

			}
			
			response.sendRedirect(request.getContextPath());
						
		}catch (Exception e) {
			e.printStackTrace();
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}