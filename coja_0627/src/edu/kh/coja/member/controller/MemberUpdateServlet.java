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

@WebServlet("/member/update")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		Member loginMember = (Member) session.getAttribute("loginMember");

		int memNo = loginMember.getMemNo();

		String memNick = request.getParameter("memNick");
		String memWorkExp = request.getParameter("memWorkExp");
		int memExpYr = Integer.parseInt(request.getParameter("memExpYr"));
		
		try {
			int result = new MemberService().updateMember(memNo, memNick, memWorkExp, memExpYr);
			
			// System.out.println(result);
			
			String icon = null;
			String title = null;
			String text = null;

			if (result > 0) { // 성공
				icon = "success";
				title = "회원정보 수정 완료";
				text = "회원정보가 수정되었습니다.";

				session = request.getSession();

				loginMember.setMemNick(memNick);
				loginMember.setMemWorkExp(memWorkExp);
				loginMember.setMemExpYr(memExpYr);

			} else { // 실패 시
				icon = "error";
				title = "회원정보 수정 실패";
				text = "회원정보 수정 중 문제가 발생했습니다. \n문제가 지속될 경우 고객센터로 문의 바랍니다.";
			}

			session.setAttribute("icon", icon);
			session.setAttribute("title", title);
			session.setAttribute("text", text);
			
			response.sendRedirect("myPage");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "회원정보 수정 과정에서 문제가 발생했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/error.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
