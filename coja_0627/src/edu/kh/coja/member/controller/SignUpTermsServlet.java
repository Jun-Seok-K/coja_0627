package edu.kh.coja.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.coja.member.model.service.MemberService;
import edu.kh.coja.member.model.vo.Member;

@WebServlet("/member/signUpTerms")
public class SignUpTermsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// get방식 요청을 받아서 처리하는 메소드 (header.jsp에 가면 회원가입은 a태그로 감싸져 있음. a태그는 get방식을 씀)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입 화면을 응답해주는 메소드
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/signUpTerms.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
}
