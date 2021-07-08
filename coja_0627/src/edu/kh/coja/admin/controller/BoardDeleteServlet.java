package edu.kh.coja.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.coja.admin.model.service.BoardService;

@WebServlet("/admin/board/boardDelete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("보드넘버는 "+ request.getParameter("boardNo"));
		System.out.println("doPost run");
		HttpSession session = request.getSession();
		
		try {
			int result = new BoardService().boardDelete( boardNo );
			request.getRequestDispatcher("/WEB-INF/views/admin/boardList.jsp").forward(request, response);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
			request.setAttribute("errorMsg", "게시글 삭제 과정에서 오류 발생");
			
			RequestDispatcher view 
				= request.getRequestDispatcher("/WEB-INF/views/common/error.jsp");
			
			view.forward(request, response);			
		}
		
		
	}

}
