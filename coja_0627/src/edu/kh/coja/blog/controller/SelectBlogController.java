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

import edu.kh.coja.blog.model.service.SelectBlogService;
import edu.kh.coja.blog.model.vo.Blog;
import edu.kh.coja.blog.model.vo.Pagination;
import edu.kh.coja.blog.model.vo.Posting;
import edu.kh.coja.member.model.vo.Member;

@WebServlet("/blog/*")
public class SelectBlogController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = uri.substring((contextPath + "/blog/").length());

		String path = null;
		RequestDispatcher view = null;

		String icon = null;
		String title = null;
		String text = null;

		try {
			SelectBlogService service = new SelectBlogService();

			int cp = request.getParameter("cp") == null ? 1 : Integer.parseInt(request.getParameter("cp"));

			if (command.equals("list")) {
				HttpSession session = request.getSession();

				Member member = (Member)session.getAttribute("loginMember");
				
				System.out.println(member);

				int memNo = member.getMemNo();

				int blogType = Integer.parseInt(request.getParameter("type"));
				
				Pagination pagination = null;
				List<Posting> postingList = null;

				
				if (request.getParameter("sv") == null) {
					pagination = service.getPagination(cp, blogType, memNo);
					postingList = service.selectPostingList(pagination, memNo);

				} else {
					String searchKey = request.getParameter("sk");
					String searchValue = request.getParameter("sv");
					
					pagination = service.getPagination(cp, blogType, searchKey, searchValue);
					postingList = service.selectPostingList(pagination, searchKey, searchValue);

				}

				
				
				
				request.setAttribute("pagination", pagination);
				request.setAttribute("postingList", postingList);

				path = "/WEB-INF/views/blog/postingList.jsp";
				view = request.getRequestDispatcher(path);
				view.forward(request, response);

			}
// --------------상세조회---------------			

			else if (command.contentEquals("view")) {
				int pstNo = Integer.parseInt(request.getParameter("no"));

				Posting posting = service.selectPosting(pstNo);

				request.setAttribute("posting", posting);

				path = "/WEB-INF/views/blog/postingView.jsp";
				view = request.getRequestDispatcher(path);
				view.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
