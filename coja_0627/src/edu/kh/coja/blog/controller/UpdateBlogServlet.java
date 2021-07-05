package edu.kh.coja.blog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.coja.blog.model.service.BlogService;
import edu.kh.coja.blog.model.vo.Blog;
import edu.kh.coja.blog.model.vo.Category;
import edu.kh.coja.member.model.vo.Member;


@WebServlet("/blog/updateBlog")
public class UpdateBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();

		Blog loginBlog = (Blog) session.getAttribute("loginBlog");
		
		int memNo = loginBlog.getMemNo();
		
		String blogNm = request.getParameter("blogNm");
		String blogIntro = request.getParameter("blogIntro");
		String blogAddr = request.getParameter("blogAddr");
		String[] ctNmList = request.getParameterValues("ctNm");
		
		Blog blog = new Blog(memNo, blogNm, blogAddr, blogIntro);
		
		try {
			int resultCategory = new BlogService().updateBlog(blog, ctNmList);
			
			String icon = null;
	        String title = null;
	        String text = null;
			
			if(resultCategory > 0) { 
				icon = "success";
				title = "블로그 정보 수정 성공";
				text = "블로그 정보 수정을 완료했습니다.";
			}else { 
				icon = "error";
				title = "블로그 정보 수정 실패";
				text = "블로그 정보 수정을 실패하였습니다.";
			}
			
			session.setAttribute("icon", icon);
			session.setAttribute("title", title);
			session.setAttribute("text", text);	
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/blog/blogSetting.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
