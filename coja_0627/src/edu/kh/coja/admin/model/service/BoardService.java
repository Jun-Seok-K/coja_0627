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

	/**
	 * 게시글 목록 조회 service
	 * 
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> selectBoardList(Pagination pagination) throws Exception {
		
		Connection conn = getConnection();
		
		List<Board> boardList = dao.selectBoardList(conn,pagination);
		
		close(conn);
		
		return boardList;
	}
	
	/** 페이징 처리 객체 생성용 Service
	 * @param cp
	 * @return pagination
	 * @throws Exception
	 */
	public Pagination getPagination(int cp) throws Exception {
		Connection conn = getConnection();
	      // DB에서 전체 회원 수
	      int countBoard = dao.getBoardListCount(conn, cp);
	      close(conn);
	      System.out.println(countBoard);
		
		return new Pagination(cp, countBoard);
	}


	/** 옵셥있는 멤버리스트 조회 Service
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
	
   /** 옵션 회원리스트 페이지네이션 Service
    * @param cp
    * @param option
    * @return
    * @throws Exception
    */
	public Pagination getPagination(int cp, String option) throws Exception {
		Connection conn = getConnection();
		
		int countMember = dao.getMemberListCount(conn, cp, option);
	    close(conn);
	    return new Pagination(cp, countMember);
	}

	/** 게시글 상세 조회 Service
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

	/** 게시글 삭제 Service
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
