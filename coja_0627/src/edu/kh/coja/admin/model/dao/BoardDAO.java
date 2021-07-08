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
import edu.kh.coja.admin.model.vo.BrdImg;
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

	/** 1. 전체 게시글 수 조회 DAO (전체 조회)
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
	
	/** 2. 게시글 목록 조회 DAO (전체 조회)
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

			close(rs);
			close(stmt);
		}
		return boardList;
	}
	
	/** 3. 게시글 수 조회 DAO (옵션적용)
	 * @param conn
	 * @param cp
	 * @param option
	 * @return countBoard
	 * @throws Exception
	 */
	public int getBoardListCount(Connection conn, int cp, String option) throws Exception {
		
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
	
	/** 4. 게시글 목록 조회 DAO (옵션적용)
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

	// 옵션 끝 -----------------------------------------------------------------------------------------------------------
	
	// 검색 시작 ----------------------------------------------------------------------------------------------------------

   /** 5. 전체 게시글 수 DAO(검색용)
    * @param conn
    * @param cp
    * @param condition
    * @return countBoard
    * @throws Exception
    * by 강지애
    */

	public  int getBoardListCount2(Connection conn, int cp, String condition) throws Exception {
	     
		int countBoard = 0;
	      
	      String sql = prop.getProperty("getSearchCount") + condition;
	      
	      try {
	         
	         stmt = conn.createStatement();
	         rs = stmt.executeQuery(sql);
	         
	         if(rs.next()) {
	            countBoard = rs.getInt(1);
	         }
	         
	      } finally {
	         close(rs);
	         close(stmt);
	      }
	      
	      return countBoard;
	   }
	
	/** 6. 전체 게시글 목록 조회 DAO (검색용)
	 * @param conn
	 * @param pagination
	 * @param condition
	 * @return boardList
	 * @throws Exception
	 * by 강지애
	 */
	public List<Board> selectBoardList(Connection conn, Pagination pagination, String condition) throws Exception {

		List<Board> boardList = new ArrayList<Board>();
		String sql = prop.getProperty("searchBoardList1") + condition + prop.getProperty("searchBoardList2");

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);

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

			close(rs);
			close(stmt);
		}
		return boardList;
	}
	
	// 검색 끝 ------------------------------------------------------------------------------------------------------------
	
	
	// 상세 조회, 게시글 작성, 게시글 삭제  ----------------------------------------------------------------------------------------

	
	/** 7. 게시글 상세조회 DAO
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
			
			board = new Board();
			
			board.setBrdImgList(new ArrayList<BrdImg>());
			
			boolean flag = true;
			
			while(rs.next()) {
				if(flag) {
					board.setBoardNo( rs.getInt("BRD_NO") );
					board.setMemNm( rs.getString("MEM_NM") );
					board.setBoardTitle( rs.getString("BRD_TITLE") );
					board.setBoardCreateDate( rs.getDate("BRD_CREATE_DT") );
					board.setBoardTypeNm( rs.getString("BRD_TYPE_NM") );
					board.setBoardContent( rs.getString("BRD_CNT") );
					board.setBoardWarn( rs.getInt("BRD_WARN") );
					board.setBoardReadCount( rs.getInt("BRD_READ_COUNT") );
					board.setBoardModifyDate( rs.getDate("BRD_MODIFY_DT") );
					board.setMemNo( rs.getInt("MEM_NO")); 
					
					flag = false;
				}
				
				BrdImg brdImg = new BrdImg();
				brdImg.setBrdImgUrl( rs.getString("BRD_IMG_URL") );
				brdImg.setBrdImgNm( rs.getString("BRD_IMG_NM") );
				brdImg.setBrdImgLv( rs.getInt("BRD_IMG_LEVEL") );
				
				board.getBrdImgList().add(brdImg);
			}
		}finally {
			close(rs);
			close(pstmt);
		}
		return board;
	}

	/** 8. 게시물 삭제 DAO
	 * @param conn
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	public int boardDelete(Connection conn, int boardNo) throws Exception {
		
		int result = 0;
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
