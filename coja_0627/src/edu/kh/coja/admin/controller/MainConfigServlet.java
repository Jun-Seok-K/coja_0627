package edu.kh.coja.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import edu.kh.coja.admin.model.service.MainConfService;
import edu.kh.coja.admin.model.service.SelectMemberService;
import edu.kh.coja.admin.model.vo.Carousel;
import edu.kh.coja.admin.model.vo.Pagination;
import edu.kh.coja.blog.model.vo.BlogPost;
import edu.kh.coja.blog.model.vo.PopularPstTb;
import edu.kh.coja.common.MyFileRenamePolicy;
import edu.kh.coja.member.model.vo.Member;

@WebServlet("/admin/main/*")
public class MainConfigServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI(); 			// 요청 주소 			ex) /semi/board/list  /// board에 요청하면 뒤에 list부분이 계속 변할것
		String contextPath = request.getContextPath();  // 프로그램 최상위 주소	ex) /semi
		String command = uri.substring( (contextPath + "/admin/main/").length() ); // list 만 남음
		
		String path = null; //응답화면 주소 또는 경로 (forward는 어떻게 할래 redirect는 어떻게 할래)
		RequestDispatcher view = null; // 요청 위임 객체 저장 참조 변수
		
		// sweetalert용 변수
		String icon = null;
		String title = null;
		String text = null;

		String option = request.getParameter("popularOption");
		
		try {
			int cp = request.getParameter("cp") == null ? 1 :   /// cp에 아무것도 안 적혀있다? 그럼 무조건 첫페이지 
				Integer.parseInt(request.getParameter("cp"));
			
			MainConfService service = new MainConfService();

			if(command.equals("mainConfiguration")) {
				
				// select - option 에 따라서 if/else if 문으로 처리
				
				List<Carousel> crsList = service.selectCarouselList();
				request.setAttribute("crsList", crsList);
				
				if(option==null) {
					List<PopularPstTb> blogPostList = service.selectBlogPostList();
					
					request.setAttribute("blogPostList", blogPostList);
					path = "/WEB-INF/views/admin/mainConfiguration.jsp"; /// 404뜨면 여기 확인
					view = request.getRequestDispatcher(path);
					view.forward(request, response); /// 흰색화면 나오면 여기 확인
				}
				else{
					List<PopularPstTb> optionalBlogPostList = service.optionalBlogPostList(option);
					System.out.println(optionalBlogPostList);
					
					request.setAttribute("blogPostList", optionalBlogPostList);
					path = "/WEB-INF/views/admin/mainConfiguration.jsp"; /// 404뜨면 여기 확인
					view = request.getRequestDispatcher(path);
					view.forward(request, response); /// 흰색화면 나오면 여기 확인
				}
				
				
			}else if(command.equals("mainCarousel")){
				
				HttpSession session = request.getSession();
				
				int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
				
				System.out.println("로그인한 멤버의 넘버 : " + memNo);
				
				int maxSize = 1024*1024*100 ; //20MB로 크기 제한
				String root = session.getServletContext().getRealPath("/");
				System.out.println("root : " + root); /// -> WebContent 폴더의 실제 경로가 나옴
				
				String filePath = "resources/images/";
				System.out.println("실제 저장 경로 : " + root + filePath);
				
				MultipartRequest mpRequest 
            	= new MultipartRequest(request, root+filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
				
				List<Carousel> crsList = new ArrayList<Carousel>();
				
				Enumeration<String> images = mpRequest.getFileNames();
				
				while(images.hasMoreElements()) {
					String name = images.nextElement();
	            	System.out.println("input type=file 의 name 속성값 : " + name);
	            	System.out.println("변경된 파일 명 : " + mpRequest.getFilesystemName(name));
	            	System.out.println("변경전 파일 명 : " + mpRequest.getOriginalFileName(name));
	            	System.out.println("-------------------");
	            	
	            	if(mpRequest.getFilesystemName(name) != null) {
	            		
	            		Carousel crs = new Carousel();
	            		
	            		crs.setCrsURL(filePath);
	            		crs.setCrsNm(mpRequest.getFilesystemName(name));
	            		crs.setMemNo(memNo);
	            		
	            		crsList.add(crs);
	            	}
				}
				
				for(Carousel c : crsList) {
					System.out.println(c);
				}
				
				int result = service.insertCarousel(crsList,memNo);
				
				if(result > 0) {
					System.out.println("캐러셀 삽입 성공");
					
					icon = "success";
					title = "캐러셀 삽입 성공";
					request.setAttribute("crsList", crsList);
					response.sendRedirect("mainConfiguration");
					
				}else {
					System.out.println("캐러셀 삽입 실패");
					
	            	icon = "warning";
	            	title = "캐러셀 등록 실패";
	    			response.sendRedirect("mainConfiguration"); /// 404뜨면 여기 확인
					view = request.getRequestDispatcher(path);
					view.forward(request, response); /// 흰색화면 나오면 여기 확인
				}
				
	            session.setAttribute("icon", icon);
	            session.setAttribute("title", title);
				
			}else if(command.equals("mainCrsUpdate")){
				
				String condition = request.getParameter("condition");
				String uncondition = request.getParameter("uncondition");
				System.out.println(condition);
				System.out.println(uncondition);
				
				int result = service.carouselStatus(condition, uncondition);
				response.getWriter().print(result);
				
				
				
			}else if (command.equals("mainCrsDelete")){
				
				String crsNo = request.getParameter("crsNo");
				System.out.println(crsNo);
				
				int result = service.carouselDelete(crsNo);
				response.getWriter().print(result);
				
			}else if (command.equals("mainPopPstView")) {
				
				String pstNo = request.getParameter("no");
				
				PopularPstTb pst = service.selectPopPst(pstNo);
				
				//댓글은 일단 생략
				request.setAttribute("pst", pst);
				
				path = "/WEB-INF/views/admin/popPstView.jsp";
				view = request.getRequestDispatcher(path);
				view.forward(request, response);
				
				
			}else if (command.equals("mainPopPstDelete")) {
				
				String condition = request.getParameter("condition");
				
				int result = service.popPstDelete(condition);
				
				response.getWriter().print(result);
				
			}
			

		}catch (Exception e){
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
