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

@WebServlet("/member/signUpCoja")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// get방식 요청을 받아서 처리하는 메소드 (header.jsp에 가면 회원가입은 a태그로 감싸져 있음. a태그는 get방식을 씀)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입 화면을 응답해주는 메소드
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/signUpCoja.jsp");
		view.forward(request, response);
	}

	// post 방식 요청을 처리하는 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입 페이지에서 가입하기 버튼을 눌렀을 때 요청을 받고 응답하는 메소드
		
		// 2. 전달 받은 파라미터를 모두 변수에 저장
		String memId = request.getParameter("id");
		String memPw = request.getParameter("pw1");
		String memNm = request.getParameter("name");
		String memNick = request.getParameter("nickName");
		String memEmail = request.getParameter("email");
		String memWorkExp = request.getParameter("workExp");
		int memExpYr = Integer.parseInt(request.getParameter("expYr"));
		
		// 중간확인
		/*
		System.out.println(memId);
		System.out.println(memPw);
		System.out.println(memNm);
		System.out.println(memNick);
		System.out.println(memEmail);
		System.out.println(memWorkExp);
		System.out.println(memExpYr);
		*/
		
		// 파라미터를 하나의 Member객체에 담기
		Member member = new Member(memId, memPw, memNm, memNick, memEmail, memWorkExp, memExpYr);
		
		// 숙제 : 입력받은 회원정보를 DB의 MEMBER 테이블에 INSERT하고 결과를 Servlet까지 반환하기
		
		
		//DB랑 연결하면 에러 가능성 높으니 try-catch로 감싸고 시간
		try {
			
			// 1) 회원가입 Service 호출 후 결과 반환 받기
			
			/// 정석적이고 코드를 다 쓰는 방법이라 가독성이 높지만 아래처럼 하면 코드 줄일 수 있음
			// MemberService service = new MemberService();
			// int result = service.signUp(member);

			int result = new MemberService().signUp(member);
			
			// 2) 반환 받은 결과에 따라 응답 화면 제어
	         String icon = null;
	         String title = null;
	         String text = null;
			
			if(result > 0) { // 회원가입 성공
				icon = "success";
				title = "회원 가입 성공";
				text = "회원 가입을 환영합니다!";
			}else { // 회원가입 실패
				icon = "error";
				title = "회원 가입 실패";
				text = "회원 가입 중 문제가 발생했습니다. \n 문제가 지속될 경우 고객센터 문의 바랍니다.";
			}
			
			/// 위의 값들을 넣을 때 request가 좋을까 session이 좋을까?
			/// redirect 하면 기존에 있던 request와 response를 폐기를 시킴! 그래서 session을 이용
			// session에 값 세팅 
			HttpSession session = request.getSession();
			session.setAttribute("icon", icon);
			session.setAttribute("title", title);
			session.setAttribute("text", text);
		
			// 메인페이지로 돌아간다 : redirect
			// 메인 페이지를 응답하는 요청주소로 재요청하기
			response.sendRedirect( request.getContextPath() );
			
			/// 메인페이지로 이동 -> 로그인 모달창 띄우려면 어떻게?
			/// 로그인 모달창 :  #modal-container-1
			
		}catch (Exception e){
			e.printStackTrace();
			
			// 자바 또는 DB에서 오류 발생 시 500 에러가 발생함 
			// -> 응답화면에 어떤 서비스 이용 과정에서 오류가 발생했다는 메세지 출력
			
			request.setAttribute("errorMsg", "회원 가입 과정에서 문제가 발생했습니다.");
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/error.jsp");
			view.forward(request,response);
			
		}
		
	}
}
