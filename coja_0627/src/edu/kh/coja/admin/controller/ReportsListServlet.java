package edu.kh.coja.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import edu.kh.coja.admin.model.vo.Reports;
import edu.kh.coja.admin.model.service.SelectMemberService;
import edu.kh.coja.admin.model.vo.Pagination;

import edu.kh.coja.board.model.vo.Board;


@WebServlet("/admin/reports/*") //로 시작하는 요청을 모두 받아들임
public class ReportsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//uri : 식별가능 요청주소
		String uri = request.getRequestURI(); // 요청 주소  ex) /semi/board/list
		String contextPath = request.getContextPath(); // contextPath: 최상위 주소  ex) /semi 
		//command : 요청된주소만 뺴와서쓰는  ,substiong : 잘라냄, length  : 길이 -12글자를 잘라내버림 질리네거 남는부분이 커멘드에 들어감
		String command = uri.substring( (contextPath + "/admin/reports/").length() ); // list
		// uri에서 contextPath + "/board/" 만큼을 앞에서 부터 잘라낸 후 나머지를 command 저장
		//프론트엔드사용하기위해서 위에 3가지 꼭 필요앟ㅁ
		
		System.out.println("command : " + command);	
		
		
		String path = null; // 응답화면 주소 또는 경로
		RequestDispatcher view = null; // 요청 위임 객체 저장 참조 변수
		
		// sweetalert용 변수
		String icon = null; //스윗얼러트사용시쓰이는 3가지 변수
		String title = null;
		String text = null;
		
		try {
			//요청을 보낼 서비스 만들기
			SelectMemberService service = new SelectMemberService();
			
			// 현재 페이지 저장
			// 삼항 연산자를 이용해서 cp가 없으면 1, 있으면 int형태로 파싱한 cp값 을 저장
			int cp =  request.getParameter("cp") == null  ?  1 : 
				Integer.parseInt(request.getParameter("cp"))  ;
			
			
			// 게시글 목록 조회 Controller
			if( command.equals("reportsList") ) {
				
				// 쿼리스트링에 있는 type을 얻어와 int로 파싱 후 저장
				int boardType = request.getParameter("type") == null ? 0 : Integer.parseInt(request.getParameter("type"));
				
				// 페이징 처리를 위한 여러 정보를 담고있는 객체 Pagination 생성
				Pagination pagination = service.getPagination(cp,boardType);
				
				
				pagination.setBoardType(boardType);
				// pagination을 이용하여 게시글 목록에 보여져야할 내용을 DB에서 조회
				List<Reports> reportsList= service.selectReports(pagination);
				
				// 요청위임)pagination, boardList를 request에 속성으로 추가한 후 boardList.jsp로 forward
				
				request.setAttribute("pagination", pagination);
				request.setAttribute("reportsList", reportsList);
				
				path = "/WEB-INF/views/admin/reportsList.jsp";
				view = request.getRequestDispatcher(path);
				view.forward(request, response);
	
			}
			else if (command.equals("view")) {
				
			

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
