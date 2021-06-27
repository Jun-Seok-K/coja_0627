package edu.kh.coja.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.coja.member.model.service.MemberService;

@WebServlet("/member/idDupCheck")
public class idDupCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 아이디 중복 검사 팝업창으로 요청 위임
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view 
			= request.getRequestDispatcher("/WEB-INF/views/member/idDupCheck.jsp");
		
		view.forward(request, response);
		
	}
	// DB에 같은 아이디가 있는지 중복 검사 후 결과 반환
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		// ajax를 이용하여 비동기로 중복 검사
		try {
			// DB에서 아이디 중복 검사 수행 후 결과를 반환 받아 저장 (결과는 0또는 1 이니까 int로)
			int result = new MemberService().idDupCheck(id);
			
			// ajax는 화면 전체가 아닌 화면 일부 갱신에 사용되는 데이터만 응답으로 내보낸다. (요청을 비동기로 처리하고 데이터만 돌려보냄)
			
			/// forward / redirect는 화면을 새로 만드는거
			// 응답을 받을 클라이언트와의 연결 스트림
			PrintWriter out = response.getWriter();
			out.print(result);
			
		}catch(Exception e) {
			
		}
		
	}

}

