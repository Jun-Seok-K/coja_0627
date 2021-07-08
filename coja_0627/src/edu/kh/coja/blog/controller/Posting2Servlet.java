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

import com.oreilly.servlet.MultipartRequest;

import edu.kh.coja.blog.model.service.Posting2Service;
import edu.kh.coja.blog.model.vo.PostCt;
import edu.kh.coja.blog.model.vo.Posting;
import edu.kh.coja.member.model.vo.Member;

@WebServlet("/blog2/*")
public class Posting2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = uri.substring((contextPath + "/blog2/").length());

		String path = null;
		RequestDispatcher view = null;

		String icon = null;
		String title = null;
		String text = null;

		try {
			Posting2Service service = new Posting2Service();

			int cp = request.getParameter("cp") == null ? 1 : Integer.parseInt(request.getParameter("cp"));

			if (command.equals("insertForm")) {

				List<PostCt> category = service.selectCategoryList();

				request.setAttribute("category", category);
				
				path = "/WEB-INF/views/blog/postInsert.jsp";
				view = request.getRequestDispatcher(path);
				view.forward(request, response);
				
			}else if(command.contentEquals("insert")) {
				
				int blogType = Integer.parseInt(request.getParameter("type"));
				
				HttpSession session = request.getSession();
				int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
				
				
				String pstTitle = request.getParameter("pstTitle");
				String pstCnt = request.getParameter("pstCnt");
				int pstCtNo = Integer.parseInt(request.getParameter("pstCtNo"));
				String pstBox = request.getParameter("pstBox");			
				
				String selectBox = null;
				
				if(pstBox == null) {
					switch(pstCtNo) {
					case 1: selectBox = "Java" ;break;
					case 2: selectBox = "DB" ;break;
					case 3: selectBox = "HTML" ;break;
					case 4: selectBox = "CSS" ;break;
					case 5: selectBox = "jQuery" ;break;
					}
					
					pstBox = selectBox;
				}
				
				Posting posting = new Posting();
				posting.setPstTitle(pstTitle);
				posting.setPstCnt(pstCnt);
				posting.setPstCtNo(pstCtNo);
				posting.setPstBox(pstBox);
				posting.setMemNo(memNo);
				
				int result = service.InsertPosting(posting, blogType);
				
				if(result>0) {
					
					icon = "success";
					title = "게시글 등록 성공";
					
					path = request.getContextPath() + "/";
					
				}else {
					
					icon = "error";
					title = "게시글 등록 실패";
					
					path = request.getHeader("referer");
				}
				
				session.setAttribute("icon", icon);
				session.setAttribute("title", title);
				response.sendRedirect(path);
				
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
