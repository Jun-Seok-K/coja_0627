package edu.kh.coja.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.coja.admin.model.service.SelectMemberService;
import edu.kh.coja.admin.model.vo.Pagination;
import edu.kh.coja.member.model.vo.Member;

@WebServlet("/admin/main/*")
public class AdminMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI(); 			// 요청 주소 			ex) /semi/board/list  /// board에 요청하면 뒤에 list부분이 계속 변할것
		String contextPath = request.getContextPath();  // 프로그램 최상위 주소	ex) /semi
		String command = uri.substring( (contextPath + "/admin/main/").length() ); // list 만 남음
		
		String path = null; //응답화면 주소 또는 경로 (forward는 어떻게 할래 redirect는 어떻게 할래)
		RequestDispatcher view = null; // 요청 위임 객체 저장 참조 변수
		
		// sweetalert용 변수
		String icon = null;
		String title = null;
		String text = null;

		
		try {
			int cp = request.getParameter("cp") == null ? 1 :   /// cp에 아무것도 안 적혀있다? 그럼 무조건 첫페이지 
				Integer.parseInt(request.getParameter("cp"));
			
			SelectMemberService service = new SelectMemberService();

			if(command.equals("mainConfiguration")) {
				
				path = "/WEB-INF/views/admin/mainConf.jsp"; /// 404뜨면 여기 확인
				view = request.getRequestDispatcher(path);
				view.forward(request, response); /// 흰색화면 나오면 여기 확인
				
			}else if(command.equals("mainConfiguration")){
				int memNo = Integer.parseInt(request.getParameter("memNo"));
				String memStatus = request.getParameter("memStatus");

				Member member = new Member();
				member.setMemNo(memNo);
				member.setMemStatus(memStatus);
				
				int result = service.updateStatus(member);
				
				response.getWriter().print(result);
				//int result = service.memberStatusUpdate(memNo, memStatus);
				
				/*if(result>0) { //회원 상태 변경 성공
				   session.setAttribute("icon", "success");
				   session.setAttribute("title", "회원 상태 변경 성공");
					
				}else { //회원 상태 변경 실패
		            session.setAttribute("icon", "error");
		            session.setAttribute("title", "회원 상태 변경 실패");
				}
				path = "/WEB-INF/views/admin/memberList.jsp"; /// 404뜨면 여기 확인
				view = request.getRequestDispatcher(path);
				view.forward(request, response); /// 흰색화면 나오면 여기 확인*/
			}

		}catch (Exception e){
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
