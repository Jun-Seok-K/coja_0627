package edu.kh.coja.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import edu.kh.coja.admin.model.service.ReplyService;
import edu.kh.coja.admin.model.vo.Reply;



@WebServlet("/admin/reply/*")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = uri.substring((contextPath + "/reply/").length());
		
		try {
			
			ReplyService service = new ReplyService();
			
			// 댓글 목록 조회 (ajax)
			if(command.equals("list")) {
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				List<Reply> list = service.selectList(boardNo);
				
				
				Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm").create();
				gson.toJson(list, response.getWriter());
				
			}
			
			// 댓글 삭제 Controller
			else if(command.equals("deleteReply")) {
				int replyNo = Integer.parseInt(request.getParameter("replyNo"));
				System.out.println(replyNo);
				int result = service.deleteReply(replyNo);
				
				response.getWriter().print(result);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		
		}
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	
	
	
	
	
	
	
	

}
