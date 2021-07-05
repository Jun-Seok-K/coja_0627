package edu.kh.coja.board.controller;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;

import edu.kh.coja.board.model.vo.Board;
import edu.kh.coja.board.model.vo.BrdCategory;
import edu.kh.coja.board.model.vo.BrdComment;
import edu.kh.coja.board.model.vo.BrdImg;
import edu.kh.coja.board.service.Brd2Service;
import edu.kh.coja.board.service.SelectBrdService;
import edu.kh.coja.common.MyFileRenamePolicy;
import edu.kh.coja.member.model.vo.Member;


@WebServlet("/board2/*") 
public class Board2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI(); // 요청 주소 				ex) /coja/board/list
		String contextPath = request.getContextPath(); // 최상위 주소 	ex) /coja
		String command = uri.substring( (contextPath + "/board/").length() ); // list
		// uri에서 contextPath + "/board/" 만큼을 앞에서부터 잘라낸 후 나머지를 command 저장
		
		
		String path = null; // 응답화면 주소 또는 경로
		RequestDispatcher view = null; // 요청 위임 객체 저장 참조 변수
		
		// sweetalert용 변수
		String icon = null;
		String title = null;
		String text = null;
		
		try {
			
			Brd2Service service = new Brd2Service();
			
			// 현재 페이지 저장
			int cp = request.getParameter("cp") == null ? 1 : Integer.parseInt(request.getParameter("cp")) ;
			
			
			// 게시글 등록 화면 전환 Controller
			if(command.equals("brdInsertForm")) {
				
				// 카테고리 목록 조회
				List<BrdCategory> brdCategory = service.selectBrdCategoryList();
				
				request.setAttribute("brdCategory", brdCategory);
				
				path = "/WEB-INF/views/board/brdInsert.jsp";
				view = request.getRequestDispatcher(path);
				view.forward(request, response);
			}
			
			// 게시글 삽입 Controller
			else if(command.equals("insert")) {
				
				// categoryCode, boardTitle, memberNo(Session)
				// 이미지 : img0~3, boardContent			
				
				HttpSession session = request.getSession();
				int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
				
				System.out.println(memNo);
				
				// 1. 전송되는 파일의 크기 제한 수치를 지정
				// 1KB == 1024Byte
				// 1MB == 1024KB
				
				int maxSize = 1024 * 1024 * 20;	// 20MB
				
				// 2. 업로드 되는 파일이 실제로 저장될 서버 경로
				String root = session.getServletContext().getRealPath("/");
				System.out.println("root : " + root);
				
				String brdImgUrl = "resources/images/board/";
				
				// 실제 저장 경로
				System.out.println("실제 저장 경로 : " + root + brdImgUrl);
				
				// 3. 저장되는 파일명 변환 작업
				
				// 4. MultiPartRequest 객체 생성
				MultipartRequest mpRequest 
					= new MultipartRequest(request, root+brdImgUrl, maxSize, "UTF-8", new MyFileRenamePolicy());
								// 기존 요청 관련 객체, 파일 실제 저장 경로, 용량제한, 요청 중 파일이 아닌 파라미터의 문자 인코딩, 파일명 변경 객체
				
				// 5. 전달 받은 파라미터 중 첨부파일(이미지)를 다루는 방법
				
				// 5-1. DB에 이미지 정보를 모아서 전달할 List 생성
				List<BrdImg> brdImgList = new ArrayList<BrdImg>();
				
				// 5-2. MultipartRequest에서 이미지 정보를 모두 얻어옴
				Enumeration<String> images = mpRequest.getFileNames();
				
				// 5-3. 얻어온 파일 정보를 반복 접근하여 brdList에 순서대로 담기
				while(images.hasMoreElements()) {
					// Enumeration.hasMoreElements() : 다음 접근할 요소(값)이 있으면 true
					
					String name = images.nextElement(); // 다음 요소(값) 얻어오기
					System.out.println("input type=file의 name 속성값 : " + name);
					System.out.println("변경된 파일명 : " + mpRequest.getFilesystemName(name));
					System.out.println("변경전 파일명 : " + mpRequest.getOriginalFileName(name));
					

					// 전달된 파일의 변경된 이름이 있을 경우
					// == 업로드된 파일이 있다면
					if(mpRequest.getFilesystemName(name) != null) {
						
						// 파일 정보 저장용 객체 생성
						BrdImg brdImg = new BrdImg();
						// 파일 경로, 변경된 파일명, 파일 레벨, 게시글 번호
						
						brdImg.setBrdImgUrl(brdImgUrl); // 웹상 접근 경로만 저장
						brdImg.setBrdImgNm(mpRequest.getFilesystemName(name));
						brdImg.setBrdImgLv( Integer.parseInt( name.substring("img".length()) ) );
						
						// 저장 완료된 BrdImg 객체를 brdImgList에 추가
						brdImgList.add(brdImg);
					} // end if
				} // end while
				
				for(BrdImg brdImg : brdImgList) {
					System.out.println(brdImg);
				}
				
				
				// 6. 파일 외에 게시글 관련 정보를 MultipartRequest에서 얻어오기
				String brdTitle = mpRequest.getParameter("brdTitle");
				String brdCnt = mpRequest.getParameter("brdCnt");
				String brdType = mpRequest.getParameter("brdType");
				
				// 7. 게시글 관련 정보를 Board 객체에 저장하기
				// + 회원 번호 (누가 썼는가?)
				Board board = new Board();
				board.setBrdTitle(brdTitle);
				board.setBrdCnt(brdCnt);
				board.setBrdType(brdType);
				board.setMemNo(memNo);
				
				// 8. 게시글 정보와 이미지를 삽입하는 Service 호출
				int result = service.insertBrd(board, brdImgList);
				// result = brdNo 또는 0
						
				// 9. 삽입 결과에 따른 결과 화면 제어
				if(result > 0) {
					icon = "success";
					title = "게시글 등록 성공";
					
					path = "../board/view?no=" + result + "&cp=1";
					
				}else {
					icon = "error";
					title = "게시글 등록 실패";
					
					// insertForm
					path = request.getHeader("referer");
				}
				
				session.setAttribute("icon", icon);
				session.setAttribute("title", title);
				response.sendRedirect(path);
			}
			
			
			// 게시글 수정 화면 전환 Controller
			else if(command.equals("brdUpdateForm")) {
				
				// 게시글 수정 화면에 수정하려는 게시글의 내용이 미리 작성되어 있어야 함
				// --> 게시글 상세 조회 + 카테고리 목록 조회
				
				// 카테고리 목록 조회
				List<BrdCategory> brdCategory = service.selectBrdCategoryList();
				
				// 게시글 상세조회 (게시글 번호 필요)
				int brdNo = Integer.parseInt(request.getParameter("brdNo"));
				Board board = new SelectBrdService().selectBrd(brdNo);
				
				// 게시글 내용에 있는 개행문자 <br> --> \r\n으로 변경 (원래는 Service에 작성하는게 좋음)
				board.setBrdCnt( board.getBrdCnt().replaceAll("<br>", "\r\n"));
				
				request.setAttribute("brdCategory", brdCategory);
				request.setAttribute("board", board);
				
				path = "/WEB-INF/views/board/brdUpdate.jsp";
				view = request.getRequestDispatcher(path);
				view.forward(request, response);
			}
			
			// 게시글 수정 Controller
			else if(command.equals("update")) {
				
				// MultipartRequest 객체를 만들기 위한 값 준비
				int maxSize = 1024 * 1024 * 20; // 20MB 용량 제한
				
				// 실제 서버 저장 경로 + 웹상 접근 경로
				HttpSession session = request.getSession();
				
				String root = session.getServletContext().getRealPath("/"); // WebContent의 실제 경로
				String brdImgUrl = "resources/images/"; // 웹상 접근 경로 (1/2)
				
				MultipartRequest mpRequest 
					= new MultipartRequest(request, root + brdImgUrl, maxSize, "UTF-8", new MyFileRenamePolicy());
				
				// 게시글 수정에 사용되는 파라미터(게시글 번호, 제목, 내용, 카테고리, 이미지...)
				int brdNo = Integer.parseInt( mpRequest.getParameter("brdNo") );
				String brdTitle = mpRequest.getParameter("brdTitle");
				String brdCnt = mpRequest.getParameter("brdCnt");
				String brdType = mpRequest.getParameter("brdType");
				
				Board board = new Board();
				board.setBrdNo(brdNo);
				board.setBrdTitle(brdTitle);
				board.setBrdCnt(brdCnt);
				board.setBrdType(brdType);
				
				// 첨부파일(이미지) 정보를 List에 담기
				List<BrdImg> brdImgList = new ArrayList<BrdImg>();
				
				// 전달 받은 파라미터 중 type이 file인 요소의  name 속성 값을 모두 반환
				Enumeration<String> images = mpRequest.getFileNames();
				
				while(images.hasMoreElements()) { // 다음 name 속성 값이 있으면
					
					String name = images.nextElement(); // name 하나 얻어오기
					System.out.println("name : " + name);
					System.out.println("변경 전 : " + mpRequest.getOriginalFileName(name));
					System.out.println("변경 후 : " + mpRequest.getFilesystemName(name));
					
					// 업도드된 파일이 있을 때
					if( mpRequest.getFilesystemName(name) != null) {
						BrdImg brdImg = new BrdImg();
						
						brdImg.setBrdImgUrl(brdImgUrl);
						brdImg.setBrdImgNm(mpRequest.getFilesystemName(name));
						
						// 파일 레벨 brdImg에 세팅하기
						brdImg.setBrdImgLv( Integer.parseInt( name.substring("img".length()) ));
						brdImg.setBrdNo(brdNo);
						
						brdImgList.add(brdImg);
					}
				}
				
				System.out.println(board);
				for(BrdImg brdImg : brdImgList) {
					System.out.println(brdImg);
				}
				
				// 게시글 수정 Service 호출
				int result = service.updateBrd(board, brdImgList);
				
				// 수정 성공 -> 수정된 게시글 상세 조회 화면
									// brdNo, cp
				
				// 수정 실패 -> 수정하던 페이지로 이동
				
				cp = Integer.parseInt(mpRequest.getParameter("cp"));
				
				if(result > 0) {
					icon = "success";
					title = "게시글 수정 성공";
					path = "../board/view?no="+brdNo+"&cp="+cp;
				}else {
					icon = "error";
					title = "게시글 수정 실패";
					path = request.getHeader("referer");
				}
				
				session.setAttribute("icon", icon);
				session.setAttribute("title", title);
				response.sendRedirect(path);
			}
			
			
			// 댓글 목록 조회 (ajax)
			else if(command.equals("brdCmtList")) {
				int brdNo = Integer.parseInt(request.getParameter("brdNo"));
				
				List<BrdComment> list = service.selectList(brdNo);
				
				
				Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm").create();
				gson.toJson(list, response.getWriter());
				
			}
			
			
			// 댓글 삽입 Controller
			else if(command.equals("insertBrdComment")) {
				int memNo = Integer.parseInt(request.getParameter("memNo"));
				int brdNo = Integer.parseInt(request.getParameter("brdNo"));
				String brdCmtCnt = request.getParameter("brdCmtCnt");
				
				BrdComment brdComment = new BrdComment();

				brdComment.setMemNo(memNo);
				brdComment.setBrdNo(brdNo);
				brdComment.setBrdCmtCnt(brdCmtCnt);
				
				
				int result = service.insertBrdComment(brdComment);
				
				// response.getWriter() : 클라이언트에게 응답할 수 있는 스트림을 얻어옴
				response.getWriter().print(result);
			}
			
			
			// 댓글 수정 Controller
			else if(command.equals("updateBrdComment")) {
				int brdCmtNo = Integer.parseInt(request.getParameter("brdCmtNo"));
				String brdCmtCnt = request.getParameter("brdCmtCnt");
				
				BrdComment brdComment = new BrdComment();

				brdComment.setBrdCmtNo(brdCmtNo);
				brdComment.setBrdCmtCnt(brdCmtCnt);
				

				int result = service.updateBrdComment(brdComment);
				
				response.getWriter().print(result);
			}
			
			
			// 댓글 삭제 Controller
			else if(command.equals("deleteBrdComment")) {
				int brdCmtNo = Integer.parseInt(request.getParameter("brdCmtNo"));
				
				int result = service.deleteBrdComment(brdCmtNo);
				
				response.getWriter().print(result);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
