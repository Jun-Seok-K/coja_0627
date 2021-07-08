package edu.kh.coja.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.coja.admin.model.service.SelectMemberService;
import edu.kh.coja.admin.model.vo.Pagination;
import edu.kh.coja.member.model.vo.Member;

@WebServlet("/admin/member/*")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uri = request.getRequestURI(); 			// 요청 주소 			ex) /semi/board/list  /// board에 요청하면 뒤에 list부분이 계속 변할것
		String contextPath = request.getContextPath();  // 프로그램 최상위 주소	ex) /semi
		String command = uri.substring( (contextPath + "/admin/member/").length() ); // list 만 남음
		// uri에서 contextPath + "/board/" 만큼을 앞에서부터 잘라낸 나머지는 command에 저장
		
		String path = null; //응답화면 주소 또는 경로 (forward는 어떻게 할래 redirect는 어떻게 할래)
		RequestDispatcher view = null; // 요청 위임 객체 저장 참조 변수
		
		// sweetalert용 변수
		String icon = null;
		String title = null;
		String text = null;

		
		String option = request.getParameter("memberOption");
/*		System.out.println("==================================");
		System.out.println("선택된 옵션을 보여줘라 : " + option);
		System.out.println("----------------------------------");
*/	
		
		try {
			int cp = request.getParameter("cp") == null ? 1 :   /// cp에 아무것도 안 적혀있다? 그럼 무조건 첫페이지 
				Integer.parseInt(request.getParameter("cp"));
			
			SelectMemberService service = new SelectMemberService();

			if(command.equals("memberList")) {
				
				if(option==null) {
					
					Pagination pagination = service.getPagination(cp);
					List<Member> memberList = service.selectMemberList(pagination);
					
					request.setAttribute("pagination", pagination);
					request.setAttribute("memberList", memberList);
					path = "/WEB-INF/views/admin/memberList.jsp"; /// 404뜨면 여기 확인
					view = request.getRequestDispatcher(path);
					view.forward(request, response); /// 흰색화면 나오면 여기 확인
					
				}
				else{
					Pagination pagination = service.getPagination(cp,option);
					List<Member> memberList = service.optionalMemberList(pagination, option);
					
					request.setAttribute("pagination", pagination);
					request.setAttribute("memberList", memberList);
					
					path = "/WEB-INF/views/admin/memberList.jsp"; /// 404뜨면 여기 확인
					view = request.getRequestDispatcher(path);
					view.forward(request, response); /// 흰색화면 나오면 여기 확인
					
				}
				
			}else if(command.equals("memberStatusUpdate")){
				int memNo = Integer.parseInt(request.getParameter("memNo"));
				String memStatus = request.getParameter("memStatus");

				Member member = new Member();
				member.setMemNo(memNo);
				member.setMemStatus(memStatus);
				
				int result = service.updateStatus(member);
				
				response.getWriter().print(result);

			}

		}catch (Exception e){
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
