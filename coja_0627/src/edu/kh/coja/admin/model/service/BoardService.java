package edu.kh.coja.admin.model.service;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import edu.kh.coja.admin.model.dao.BoardDAO;
import edu.kh.coja.admin.model.vo.Board;
import edu.kh.coja.member.model.vo.Member;
import edu.kh.coja.admin.model.vo.Pagination;

public class BoardService {

	private BoardDAO dao = new BoardDAO();

	/** 1.  전체 게시글 수 조회 Service (전체 조회)
	 * @param cp
	 * @return pagination
	 * @throws Exception
	 */
	public Pagination getPagination(int cp) throws Exception {
		Connection conn = getConnection();
		// DB에서 전체 회원 수
		int countBoard = dao.getBoardListCount(conn, cp);
		close(conn);
		
		return new Pagination(cp, countBoard);
	}
	
	/** 2. 게시글 목록 조회 service
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> selectBoardList(Pagination pagination) throws Exception {
		
		Connection conn = getConnection();
		
		List<Board> boardList = dao.selectBoardList(conn,pagination);
		
		close(conn);
		
		return boardList;
	}
	
   /** 3.  게시글 수 조회 Service (옵션적용)
    * @param cp
    * @param option
    * @return
    * @throws Exception
    */
	public Pagination getPagination(int cp, String option) throws Exception {
		Connection conn = getConnection();
		
		int countMember = dao.getBoardListCount(conn, cp, option);
	    close(conn);
	    return new Pagination(cp, countMember);
	}


	/** 4.  게시글 목록 조회 Service (옵션적용) 
	 * @param option 
	 * @param pagination 
    * @param pagination
    * @param option
    * @return memberList
    * @throws Exception
    */
	public List<Board> optionBoardList(Pagination pagination, String option) throws Exception {
		
		Connection conn = getConnection();
		List<Board> boardList = dao.optionalBoardList(conn, pagination, option);
		close(conn);
		
		return boardList;
	}
	
	// ------------------------------------------------------------------- 검색 시작
	/** 검색 조건 SQL 조건식
	 * @param searchKey
	 * @param searchValue
	 * @return condition
	 * by 강지애
	 */
	private String createCondition(String searchKey, String searchValue) {
		String condition = null;
		
		switch(searchKey) {
		case "title":  
			condition = " AND BRD_TITLE LIKE '%" + searchValue + "%' ";
			break;
			
		case "content":  
			condition = " AND BRD_CNT LIKE '%" + searchValue + "%' ";
			break;
			
		case "titcont":  
			condition = " AND (BRD_TITLE LIKE '%" + searchValue+ "%' " +
	                  	" OR BRD_CNT LIKE '%" + searchValue+ "%') ";
			break;
		case "writer":  
			condition = " AND MEM_NM LIKE '%" + searchValue + "%' ";
			break;
		}
		
		return condition;
		
	}
	
	/** 5. 전체 게시글 수 Service (검색용)
	 * @param cp
	 * @param searchKey
	 * @param searchValue
	 * @return Pagination
	 * @throws Exception
	 * by 강지애
	 */
	public Pagination getPagination(int cp, String searchKey, String searchValue) throws Exception{
		
		Connection conn = getConnection();
		
		String condition = createCondition(searchKey, searchValue);
			
		int countBoard = dao.getBoardListCount2(conn, cp, condition);
		 System.out.println("페이지네이션 : " + countBoard);
		close(conn);
	
	return new Pagination(cp, countBoard);
	}
	
	/** 6. 전체 게시글 목록 조회 Service (검색용)
	 * @param pagination
	 * @param searchKey
	 * @param searchValue
	 * @return boardList
	 * @throws Exception
	 * by 강지애
	 */
	public List<Board> selectBoardList(Pagination pagination, String searchKey, String searchValue) throws Exception {
		
		Connection conn = getConnection();
		
		String condition = createCondition(searchKey, searchValue);
		
		List<Board> boardList = dao.selectBoardList(conn, pagination, condition);
		close(conn);
		
		return boardList;
	}

//----------------------------------------------------------------------------------------
	
	/** 7. 게시글 상세 조회 Service
	 * @param boardNo
	 * @return board
	 * @throws Exception
	 */
	public Board selectBoard(int boardNo) throws Exception {
			Connection conn = getConnection();
			
			Board board = dao.selectBoard(conn, boardNo);
			
			close(conn);
		
		return board;
	}

	/** 8. 게시글 삭제 Service
	 * @param boardNo
	 * @return result
	 * @throws Exception
	 */
	public int boardDelete(int boardNo) throws Exception {
		Connection conn = getConnection();
		
		int result = dao.boardDelete(conn, boardNo);
		
		if(result > 0)   commit(conn); 
		else 			 rollback(conn); 
		
		return result;
	}
	

		 
}
