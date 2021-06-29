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

@WebServlet("/member/pwUpdate")
public class PwUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/pwUpdate.jsp");

		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String currentPw = request.getParameter("currentPw");
		String newPw1 = request.getParameter("pw1");

		HttpSession session = request.getSession();
		int memNo = ((Member) session.getAttribute("loginMember")).getMemNo();
		String memPw = ((Member) session.getAttribute("loginMember")).getMemPw();
		System.out.println(memPw);
		System.out.println(memNo);

		try {
			if (currentPw.equals(newPw1)) {

				session.setAttribute("icon", "error");
				session.setAttribute("title", "비밀번호 수정 실패");
				session.setAttribute("text", "현재 비밀번호와 새로운 비밀번호가 동일합니다.");
				response.sendRedirect("myPage");

			} else{
				int result = new MemberService().pwUpdate(currentPw, newPw1, memNo);

				// sweetalert(성공여부)

				String icon = null;
				String title = null;
				String text = null;

				if (result > 0) {

					session.setAttribute("icon", "success");
					session.setAttribute("title", "비밀번호 수정 성공");
					session.setAttribute("text", "수정을 성공하였습니다.");
					response.sendRedirect("myPage");

				} else {
					session.setAttribute("icon", "error");
					session.setAttribute("title", "비밀번호 변경 실패!");
					session.setAttribute("text", "비밀번호 변경 중 문제가 발생했습니다.");
					response.sendRedirect("myPage");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("errorMsg", "비밀 번호 변경 과정에서 오류 발생");

			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/error.jsp");

			view.forward(request, response);

		}

	}

}
