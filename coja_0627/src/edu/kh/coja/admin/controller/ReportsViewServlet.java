package edu.kh.coja.admin.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.coja.admin.model.service.SelectMemberService;
import edu.kh.coja.admin.model.vo.Reports;
import edu.kh.coja.board.model.vo.Board;

/**
 * Servlet implementation class ReportsViewServlet
 */
@WebServlet("/admin/reports/view")
public class ReportsViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rptNo = Integer.parseInt(request.getParameter("no"));
		
		try {
			
			SelectMemberService service = new SelectMemberService();
		
			Reports reports = service.selectBoard(rptNo);
			
			request.setAttribute("reports", reports);
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/reportsDt.jsp");
			
			view.forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
		 
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
