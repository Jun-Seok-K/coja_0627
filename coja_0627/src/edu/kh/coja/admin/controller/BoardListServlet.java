package edu.kh.coja.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.coja.admin.model.service.BoardService;
import edu.kh.coja.admin.model.vo.Board;
import edu.kh.coja.admin.model.vo.Pagination;

@WebServlet("/admin/board/*")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uri = request.getRequestURI();          	// 요청 주소          		ex) /semi/board/list  /// board에 요청하면 뒤에 list부분이 계속 변할것
		String contextPath = request.getContextPath();  // 프로그램 최상위 주소   	ex) /semi
		String command = uri.substring( (contextPath + "/board/").length() ); // list 만 남음
		
		String path = null; //응답화면 주소 또는 경로 (forward는 어떻게 할래 redirect는 어떻게 할래)
		RequestDispatcher view = null; // 요청 위임 객체 저장 참조 변수
		  
		
	    String option = request.getParameter("boardOption");
		
		try {
			int cp = request.getParameter("cp") == null ? 1 : Integer.parseInt(request.getParameter("cp"));
			BoardService service = new BoardService();
			
	            Pagination pagination = null;
	            List<Board> boardList = null;
				
				if( request.getParameter("sv") == null ) { // 검색어가 없을 경우
					
					if(option == null) { // 전체 조회
						
						pagination = service.getPagination(cp); // 1
						boardList = service.selectBoardList(pagination); // 2
           
					}else { // 전체, 자유, 공지, 질문 분류해서 조회
						
						pagination = service.getPagination(cp, option); // 3
						boardList = service.optionBoardList(pagination, option); // 4
						
					}
					
				}else { // 검색어가 있을 경우

					String searchKey = request.getParameter("sk");
					String searchValue = request.getParameter("sv");
					
						pagination = service.getPagination(cp, searchKey, searchValue); // 5
	            		boardList = service.selectBoardList(pagination, searchKey, searchValue); // 6
				
				}
				
				request.setAttribute("pagination", pagination);
				request.setAttribute("boardList", boardList);
				
				path = "/WEB-INF/views/admin/boardList.jsp";
				view = request.getRequestDispatcher(path);
				view.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
