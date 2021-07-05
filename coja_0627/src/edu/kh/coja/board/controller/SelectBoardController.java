package edu.kh.coja.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.coja.board.model.vo.Board;
import edu.kh.coja.board.model.vo.BrdPagination;
import edu.kh.coja.board.service.SelectBrdService;

@WebServlet("/board/*") // /board로 시작하는 요청을 모두 받음
public class SelectBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI(); // 요청 주소
		String contextPath = request.getContextPath(); // 최상위 주소
		String command = uri.substring((contextPath + "/board/").length());
		// uri에서 contextPath + "/board/" 만큼을 앞에서부터 잘라낸 후 나머지를 command 저장

		String path = null; // 응답화면 주소 또는 경로
		RequestDispatcher view = null; // 요청 위임 객체 저장 참조 변수

		// sweetalert용 변수
		String icon = null;
		String title = null;
		String text = null;

		
		try {

			SelectBrdService service = new SelectBrdService();

			// 현재 페이지 저장
			// 삼항 연산자를 이용해서 cp가 없으면 1, 있으면 int형태로 파싱한 cp값을 저장
			int cp = request.getParameter("cp") == null ? 1 : Integer.parseInt(request.getParameter("cp"));

			// 게시글 목록 조회 Controller
			if (command.equals("list")) {

				// 쿼리스트링에 있는 type을 얻어와 저장
				String brdType = request.getParameter("type");

				// 페이징 처리를 위한 여러 정보를 담고있는 객체 brdPagination 생성
				BrdPagination brdPagination = service.getBrdPagination(cp, brdType);

				// brdPagination을 이용하여 게시글 목록에 보여져야할 내용을 DB에서 조회
				List<Board> brdList = service.selectBrdList(brdPagination);

				// brdPagination, brdList를 request에 속성으로 추가한 후 brdList.jsp로 forward
				request.setAttribute("brdPagination", brdPagination);
				request.setAttribute("brdList", brdList);

				path = "/WEB-INF/views/board/brdList.jsp";
				view = request.getRequestDispatcher(path);
				view.forward(request, response);

			}
			
			// 게시글 상세 조회 Controller
			else if(command.equals("view") ) {
				
				int brdNo = Integer.parseInt(request.getParameter("no")); 
				
				Board board = service.selectBrd(brdNo);

				//System.out.println(board);
				
				request.setAttribute("board", board);
				
				path = "/WEB-INF/views/board/brdView.jsp";
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
