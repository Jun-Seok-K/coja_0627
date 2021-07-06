package edu.kh.coja.board.model.service;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import edu.kh.coja.board.model.dao.SelectBrdDAO;
import edu.kh.coja.board.model.vo.Board;
import edu.kh.coja.board.model.vo.BrdPagination;

public class SelectBrdService {
	
	private SelectBrdDAO dao = new SelectBrdDAO();

	/** 페이징 처리 객체 생성용 Service
	 * @param cp
	 * @return BrdPagination
	 * @throws Exception
	 */
	public BrdPagination getBrdPagination(int cp) throws Exception {
		
		Connection conn = getConnection();
		
		// DB에서 전체 게시글 수 얻어옴
		int brdListCount = dao.getBrdListCount(conn);
		
		close(conn);
	
		return new BrdPagination(cp, brdListCount);
	}
	
	
	/** 게시글 목록 조회 Service
	 * @param brdPagination
	 * @return brdList
	 * @throws Exception
	 */
	public List<Board> selectBrdList(BrdPagination brdPagination) throws Exception{
		
		Connection conn = getConnection();
		
		List<Board> brdList = dao.selectBrdList(conn, brdPagination);
		
		close(conn);
		
		return brdList;
	}
	
	
	/** 게시글 상세 조회 Service
	 * @param brdNo
	 * @return board
	 * @throws Exception
	 */
	public Board selectBrd(int brdNo) throws Exception{
		Connection conn = getConnection();
		
		Board board = dao.selectBrd(conn, brdNo);
		
		// 게시글이 정상 조회 된 경우
		if(board.getBrdTitle() != null) {
			
			int result = dao.increaseBrdReadCount(conn, brdNo);
			
			if( result > 0 ) {
				commit(conn);
				
				// DB에서 조회수를 증가하기 전에 얻어왔던 값을 1 증가 시킴
				board.setBrdReadCount( board.getBrdReadCount() + 1  );
			}
			
			else				rollback(conn);
		}
		
		
		close(conn);
		
		return board;
	}


	public int brdDelete(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
