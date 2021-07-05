package edu.kh.coja.board.model.dao;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.kh.coja.board.model.vo.Board;
import edu.kh.coja.board.model.vo.BrdCategory;
import edu.kh.coja.board.model.vo.BrdComment;
import edu.kh.coja.board.model.vo.BrdImg;


public class Brd2DAO {

	// 자주 사용하는 JDBC 객체 참조 변수 선언
		private Statement stmt = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		// 외부 XML 파일에 작성된 SQL 구문을 읽어와 저장할 Properties객체 참조 변수 선언
		private Properties prop = null;
		
		
		// 기본 생성자를 이용한 DAO 객체 생성 시 외부 XML파일을 읽어와 prop에 저장
		public Brd2DAO() {
			
			// selectBoard-query.xml 파일의 경로 얻어오기
			String filePath = Brd2DAO.class.getResource("/edu/kh/coja/sql/board/board2-query.xml").getPath();
			
			try {
				prop = new Properties();
				
				// filePath 변수에 저장된 경로로부터 XML 파일을 읽어와 prop에 저장
				prop.loadFromXML(new FileInputStream(filePath));
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}


		/** 카테고리 목록 조회 DAO
		 * @param conn
		 * @return brdCategory
		 * @throws Exception
		 */
		public List<BrdCategory> selectBrdCategoryList(Connection conn) throws Exception{

			List<BrdCategory> brdCategory = new ArrayList<BrdCategory>();
			
			String sql = prop.getProperty("selectBrdCategoryList");
					
			try {
				
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					BrdCategory brdCa = new BrdCategory();
					
					brdCa.setBrdType(rs.getString(1));
					brdCa.setBrdTypeNm(rs.getString(2));
					
					brdCategory.add(brdCa);
				}
				
			}finally {
				close(rs);
				close(stmt);
			}

			return brdCategory;
		}


		/** 다음 게시글 번호 조회 DAO
		 * @param conn
		 * @return brdNo
		 * @throws Exception
		 */
		public int nextBrdNo(Connection conn) throws Exception{
			
			int brdNo = 0;
			
			String sql = prop.getProperty("nextBrdNo");
			
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
					brdNo = rs.getInt(1);
				}
			
			}finally {
				close(rs);
				close(stmt);
			}
			
			return brdNo;
		}


		/** 게시글 삽입 DAO
		 * @param conn
		 * @param board
		 * @return result
		 * @throws Exception
		 */
		public int insertBrd(Connection conn, Board board) throws Exception {

			int result = 0;
			
			String sql = prop.getProperty("insertBrd");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, board.getBrdNo());
				pstmt.setString(2, board.getBrdTitle());
				pstmt.setString(3, board.getBrdCnt());
				pstmt.setString(4, board.getBrdType());
				pstmt.setInt(5, board.getMemNo());
				
				result = pstmt.executeUpdate();
				
			}finally {
				close(pstmt);
			}
			
			return result;
		}


		/** 첨부파일(이미지) 정보 삽입 DAO
		 * @param conn
		 * @param brdImg
		 * @return result
		 * @throws Exception
		 */
		public int insertBrdImg(Connection conn, BrdImg brdImg) throws Exception {

			int result = 0;
			
			String sql = prop.getProperty("insertBrdImg");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, brdImg.getBrdImgUrl());
				pstmt.setString(2, brdImg.getBrdImgNm());
				pstmt.setInt(3, brdImg.getBrdImgNo());
				pstmt.setInt(4, brdImg.getBrdImgLv());
				
				result = pstmt.executeUpdate();
				
			}finally {
				close(pstmt);
			}
			
			return result;
		}
		
		
		/** 게시글 수정 DAO
		 * @param conn
		 * @param board
		 * @return result
		 * @throws Exception
		 */
		public int updateBrd(Connection conn, Board board) throws Exception {
			
			int result = 0;
			
			String sql = prop.getProperty("updateBrd");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, board.getBrdTitle());
				pstmt.setString(2, board.getBrdCnt());
				pstmt.setString(3, board.getBrdType());
				pstmt.setInt(4, board.getBrdNo());
				
				result = pstmt.executeUpdate();
				
			}finally {
				close(pstmt);
			}
			
			return result;
		}
		
		
		
		/** 첨부 파일 수정 DAO
		 * @param conn
		 * @param brdImg
		 * @return result
		 * @throws Exception
		 */
		public int updateBrdImg(Connection conn, BrdImg brdImg) throws Exception {
			
			int result = 0;
			
			String sql = prop.getProperty("updateBrdImg");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, brdImg.getBrdImgNm());
				pstmt.setInt(2, brdImg.getBrdImgNo());
				pstmt.setInt(3, brdImg.getBrdImgLv());
				
				result = pstmt.executeUpdate();
				
			}finally {
				close(pstmt);
			}
			
			return result;
		}
		
		
		/** 댓글 목록 조회 DAO
		 * @param conn
		 * @param brdNo
		 * @return list
		 * @throws Exception
		 */
		public List<BrdComment> selectList(Connection conn, int brdNo) throws Exception{
			
			List<BrdComment> list = new ArrayList<BrdComment>();
			
			String sql = prop.getProperty("selectList");
			
			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, brdNo);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BrdComment brdComment = new BrdComment();
					
					brdComment.setBrdCmtNo(rs.getInt("BRD_CMT_NO"));
					brdComment.setBrdCmtCnt(rs.getString("BRD_CMT_CNT"));
					brdComment.setBrdCmtDt(rs.getDate("BRD_CMT_DT"));
					brdComment.setBrdCmtPublic(rs.getString("BRD_CMT_PUBLIC"));
					brdComment.setBrdNo(rs.getInt("BRD_NO"));
					brdComment.setMemNo(rs.getInt("MEM_NO"));
					brdComment.setMemNick(rs.getString("MEM_NICK"));
					
					list.add(brdComment);
				}
				
				
			}finally {
				close(rs);
				close(pstmt);
			}
			
			
			return list;
		}


		/** 댓글 삽입 DAO
		 * @param conn
		 * @param brdComment
		 * @return result
		 * @throws Exception
		 */
		public int insertBrdComment(Connection conn, BrdComment brdComment) throws Exception{
			
			int result = 0;

			String sql = prop.getProperty("insertBrdComment");
			
			try {

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, brdComment.getBrdCmtCnt());
				pstmt.setString(2, brdComment.getBrdCmtPublic());
				pstmt.setInt(3, brdComment.getBrdNo());
				pstmt.setInt(4, brdComment.getMemNo());
				
				result = pstmt.executeUpdate();
						
			}finally {
				close(pstmt);
			}
			
			return result;
		}


		/** 댓글 수정 DAO
		 * @param conn
		 * @param brdComment
		 * @return result
		 * @throws Exception
		 */
		public int updateBrdComment(Connection conn, BrdComment brdComment) throws Exception {
			int result = 0;

			String sql = prop.getProperty("updateBrdComment");
			
			try {

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, brdComment.getBrdCmtCnt());
				pstmt.setInt(2, brdComment.getBrdCmtNo());
				
				result = pstmt.executeUpdate();
				
			}finally {
				close(pstmt);
			}
			
			return result;
		}


		/** 댓글 삭제 DAO
		 * @param conn
		 * @param brdCmtNo
		 * @return result
		 * @throws Exception
		 */
		public int deleteBrdComment(Connection conn, int brdCmtNo) throws Exception{
			int result = 0;

			String sql = prop.getProperty("deleteBrdComment");
			
			try {

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, brdCmtNo);
				
				result = pstmt.executeUpdate();
				
			}finally {
				close(pstmt);
			}
			
			return result;
		}
}
