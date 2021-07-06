package edu.kh.coja.admin.model.dao;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.kh.coja.admin.model.vo.Board;
import edu.kh.coja.admin.model.vo.Pagination;

public class BoardDAO {

	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Properties prop = null;

	public BoardDAO() {
		prop = new Properties();

		try {
			String filePath = BoardDAO.class.getResource("/edu/kh/coja/sql/admin/board-query.xml").getPath();

			prop.loadFromXML(new FileInputStream(filePath));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 전체 게시글 수 조회 DAO 
	* @param conn
	* @param cp
	* @param boardType
	* @return map
	* @throws Exception
	*/
	public int getBoardListCount(Connection conn, int cp) throws Exception {
	      int countBoard = 0;
	      
	      String sql = prop.getProperty("boardListCount");
	      
	      try {
	         
	         stmt = conn.createStatement();
	         rs=stmt.executeQuery(sql);
	         
	         if(rs.next()) {
	            countBoard = rs.getInt(1);
	         }
	         
	      } finally {
	         close(rs);
	         close(stmt);
	      }
	      
	      System.out.println("count : " + countBoard);
	      return countBoard;
	}
	
	/**
	 * 전체 게시글 목록 조회 DAO
	 * @param conn
	 * @param pagination
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> selectBoardList(Connection conn, Pagination pagination) throws Exception {

		List<Board> boardList = new ArrayList<Board>();
		String sql = prop.getProperty("boardList");

		try {
			pstmt=conn.prepareStatement(sql);
			int startRow = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
	        int endRow = startRow + pagination.getLimit() - 1;
	        pstmt.setInt(1, startRow);
	        pstmt.setInt(2, endRow);
	        rs = pstmt.executeQuery();

			// 4) 반환 받은 결과를 결과 저장용 변수에 저장

			while (rs.next()) {
				Board b = new Board(
						rs.getInt("BRD_NO"), 
						rs.getString("BRD_TYPE_NM"), 
						rs.getString("BRD_TITLE"), 
						rs.getString("MEM_NM"), 
						rs.getDate("BRD_CREATE_DT"), 
						rs.getInt("BRD_WARN"),
						rs.getString("BRD_CNT"));
				boardList.add(b);
			}
		} finally {

			// 5) 사용한 JDBC 자원 반환
			close(rs);
			close(stmt);
		}
		// 6) 결과를 Service로 반환
		return boardList;
	}
	
	/** 옵션적용 게시물 목록 조회 DAO
	 * @param conn
	 * @param pagination
	 * @param option
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> optionalBoardList(Connection conn, Pagination pagination, String option) throws Exception {
		
		List<Board> boardList = new ArrayList<Board>();
		
	    String sql = prop.getProperty(option);
	    try {
	       pstmt=conn.prepareStatement(sql);
	       int startRow = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
	       int endRow = startRow + pagination.getLimit() - 1;
	         
	       pstmt.setInt(1, startRow);
	       pstmt.setInt(2, endRow);
	       rs = pstmt.executeQuery();
	       while(rs.next()) {
	            
	          Board board = new Board
	               (rs.getInt("BRD_NO"), rs.getString("BRD_TYPE_NM"), 
	                rs.getString("BRD_TITLE"), rs.getString("MEM_NM"), 
	                rs.getDate("BRD_CREATE_DT"), rs.getInt("BRD_WARN"),
	                rs.getString("BRD_CNT"));
	            
	          boardList.add(board);
	       }
	    }finally {
	       close(rs);
	       close(pstmt);
	    }
	      
	    return boardList;
	   }

	/** 옵션 적용 게시글 수 DAO
	 * @param conn
	 * @param cp
	 * @param option
	 * @return countBoard
	 * @throws Exception
	 */
	public int getMemberListCount(Connection conn, int cp, String option) throws Exception {
		
		int countBoard = 0;
		
		String sql = prop.getProperty(option+"Count");
		
		try {
	         
	         stmt = conn.createStatement();
	         rs=stmt.executeQuery(sql);
	         if(rs.next()) {
	            countBoard = rs.getInt(1);
	         }
	      } finally {
	         close(rs);
	         close(stmt);
	      }
	      return countBoard;
	}
	
	/** 게시글 상세조회 DAO
	 * @param conn
	 * @param boardNo
	 * @return board
	 * @throws Exception
	 */
	public Board selectBoard(Connection conn, int boardNo) throws Exception {
		
		Board board = null;
		
		String sql = prop.getProperty("selectBoard"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board(
						rs.getInt("BRD_NO"), 
						rs.getString("MEM_NM"),
						rs.getString("BRD_TITLE"), 
						rs.getDate("BRD_CREATE_DT"), 
						rs.getString("BRD_TYPE_NM"),
						rs.getString("BRD_CNT"),
						rs.getInt("BRD_WARN"),
						rs.getInt("BRD_READ_COUNT"),
						rs.getDate("BRD_MODIFY_DT"),
						rs.getInt("MEM_NO")); 
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return board;
	}

	/** 게시물 삭재 DAO
	 * @param conn
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	public int boardDelete(Connection conn, int boardNo) throws Exception {
		
		int result = 0;
		System.out.println("dao"+boardNo);
		String sql = prop.getProperty("boardDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


}
