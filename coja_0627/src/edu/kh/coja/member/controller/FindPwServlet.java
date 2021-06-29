package edu.kh.coja.member.controller;

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


@WebServlet("/member/findPw")
public class FindPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/findPw.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memID = request.getParameter("id");
		String memEmail = request.getParameter("email");
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/foundPw.jsp");
		try {
			
			// 로그인 Service를 위한 MemberService 객체 생성
			MemberService service = new MemberService();
			
			// 로그인 요청을 처리할 수 있는 서비스 메소드를 호출하고 로그인 결과를 반환 받음.
			String findPw = service.findPw(memID, memEmail);
			
			if(findPw != null) { // 아이디 찾기 성공!
				
				request.setAttribute("findPw", findPw);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "비밀번호를 찾는 과정에서 문제가 발생했습니다.");
			
		}
		view.forward(request,response);
	}
	

}