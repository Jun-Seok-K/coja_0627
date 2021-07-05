package edu.kh.coja.blog.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.coja.blog.model.service.BlogService;
import edu.kh.coja.blog.model.vo.Blog;
import edu.kh.coja.member.model.vo.Member;


@WebServlet("/blog/loginBlog")
public class SelectBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//누가 탈퇴하는지 멤버넘버
		HttpSession session = request.getSession();

		int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		
		try {
			BlogService service = new BlogService();
			
			Blog loginBlog = service.selectBlog(memNo);
			
			System.out.println(loginBlog);
			
			if(loginBlog != null) {
				session.setAttribute("loginBlog", loginBlog);
				
				System.out.println("블로그 상태 : " + loginBlog);
				
			}else {
				session.setAttribute("icon", "warning");
				session.setAttribute("Title", "블로그 조회 실패");
				
				response.sendRedirect(request.getContextPath());
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
