package edu.kh.coja.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import edu.kh.coja.admin.model.service.MainConfService;
import edu.kh.coja.admin.model.vo.Brd;
import edu.kh.coja.admin.model.vo.Carousel;
import edu.kh.coja.blog.model.vo.PopularPstTb;
import edu.kh.coja.board.model.vo.Board;

@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = null;
		RequestDispatcher view = null; //

		MainConfService service = new MainConfService();

		try {
			// 캐러셀 가져와서 넣기
			List<Carousel> crsList = service.carouselShow();
			request.setAttribute("crsList", crsList);

			// 블로그 인기글 가져와서 넣기
			List<PopularPstTb> pstList = service.selectBlogPostList();
			request.setAttribute("pstList", pstList);
			
			// 게시판 최신글 가져와서 넣기
			List<Brd> recentBrdList = service.selectBrdList();
			request.setAttribute("recentBrdList", recentBrdList);

			
			path = "/WEB-INF/views/main.jsp";
			view = request.getRequestDispatcher(path);
			view.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MainConfService service = new MainConfService();

		String popMenu = request.getParameter("popMenu");
		System.out.println(popMenu);
		List<PopularPstTb> pstList = null;

		try {
			request.setAttribute("pstList", pstList);

			if (popMenu.equals("allPop")) {
				pstList = service.selectBlogPostList();
			} else {
				pstList = service.optionalBlogPostList(popMenu);
			}
			
			new Gson().toJson(pstList, response.getWriter());

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
