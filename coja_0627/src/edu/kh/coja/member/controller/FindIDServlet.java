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


@WebServlet("/member/findID")
public class FindIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/findID.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 아이디 찾기 요청 시 전달 받은 파라미터를 변수에 저장
		String memNm = request.getParameter("name");
		String memEmail = request.getParameter("email");
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/foundID.jsp");
		try {
			
			// 로그인 Service를 위한 MemberService 객체 생성
			MemberService service = new MemberService();
			
			// 로그인 요청을 처리할 수 있는 서비스 메소드를 호출하고 로그인 결과를 반환 받음.
			String findID = service.findID(memNm, memEmail);
			
			if(findID != null) { // 아이디 찾기 성공!
				
				request.setAttribute("findID", findID);
			}
			view.forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "아이디 찾는 과정에서 문제가 발생했습니다.");
			
			view.forward(request,response);
		}
	
	}

}
