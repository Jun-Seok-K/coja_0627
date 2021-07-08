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
		
		RequestDispatcher view = null;
		
		try {
			
			MemberService service = new MemberService();
		
			Member loginMember = service.loginAdmin(memId, memPw);
			
			HttpSession session = request.getSession();
			
			if(loginMember != null) { // 로그인 성공
				
				session.setAttribute("loginMember", loginMember);
				session.setMaxInactiveInterval(1800); // 초 단위로 작성
				session.setAttribute("icon", "seccess");
				session.setAttribute("title", "관리자 페이지입니다.");
				response.sendRedirect("main/mainConfiguration");
				
			}else { // 로그인 실패
				
				session.setAttribute("icon", "error");
				session.setAttribute("title", "비정상적인 접근입니다.");
				response.sendRedirect(request.getContextPath());
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
