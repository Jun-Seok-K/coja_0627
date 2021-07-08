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
import edu.kh.coja.admin.model.service.ReplyService;
import edu.kh.coja.admin.model.vo.Board;
import edu.kh.coja.admin.model.vo.Reply;

@WebServlet("/admin/board/boardView")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt( request.getParameter("boardNo") );
		
		try {
			
			BoardService service = new BoardService();
			
			Board board = service.selectBoard(boardNo);
			List<Reply> rList = new ReplyService().selectList(boardNo);
			
			
			request.setAttribute("board", board);
			request.setAttribute("rList", rList);
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/boardView.jsp");
			
			view.forward(request, response);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
