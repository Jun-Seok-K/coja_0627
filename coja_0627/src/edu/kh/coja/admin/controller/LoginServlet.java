package edu.kh.coja.admin.controller;

import java.io.IOException;

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

@WebServlet("/admin/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/loginAd.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("id");
		String memPw = request.getParameter("password");
		
		
		try {
			
			MemberService service = new MemberService();
		
			Member loginMember = service.login(memId, memPw);
			
			HttpSession session = request.getSession();
			
			if(loginMember != null) { // 로그인 성공
				
				session.setAttribute("loginMember", loginMember);
				session.setMaxInactiveInterval(1800); // 초 단위로 작성
				
			}else { // 로그인 실패
				
				session.setAttribute("icon", "error");
				session.setAttribute("title", "로그인 실패");
				session.setAttribute("text", "아이디 또는 비밀번호가 일치하지 않습니다.");
			}
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/main.jsp");
			view.forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
