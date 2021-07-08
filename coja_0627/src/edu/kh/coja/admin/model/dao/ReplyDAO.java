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

import edu.kh.coja.admin.model.vo.Reply;



public class ReplyDAO {

	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Properties prop = null;
	
	
	public ReplyDAO() {
		String filePath 
			= ReplyDAO.class.getResource("/edu/kh/practice/sql/reply-query.xml").getPath();                    
		
		try {
			prop = new Properties();
			
			prop.loadFromXML(new FileInputStream(filePath));
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}


	/** 댓글 목록 조회 DAO
	 * @param conn
	 * @param boardNo
	 * @return list
	 * @throws Exception
	 * by 강지애
	 */
	public List<Reply> selectList(Connection conn, int boardNo) throws Exception{
		
		List<Reply> list = new ArrayList<Reply>();
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				
				reply.setReplyNo(rs.getInt("BRD_CMT_NO"));
				reply.setReplyContent(rs.getString("BRD_CMT_CNT"));
				reply.setCreateDate(rs.getTimestamp("BRD_CMT_DT"));
				reply.setBoardNo(rs.getInt("BRD_NO"));
				reply.setMemberNo(rs.getInt("MEM_NO"));
				reply.setMemberName(rs.getString("MEM_NM"));
				
				list.add(reply);
			}
			
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}


	/** 댓글 삽입 DAO
	 * @param conn
	 * @param reply
	 * @return result
	 * @throws Exception
	 * by 강지애
	 */
	public int insertReply(Connection conn, Reply reply) throws Exception{
		
		int result = 0;

		String sql = prop.getProperty("insertReply");
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reply.getReplyContent());
			pstmt.setInt(2, reply.getMemberNo());
			pstmt.setInt(3, reply.getBoardNo());
			
			result = pstmt.executeUpdate();
					
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	/** 댓글 수정 DAO
	 * @param conn
	 * @param reply
	 * @return result
	 * @throws Exception
	 * by 강지애
	 */
	public int updateReply(Connection conn, Reply reply) throws Exception {
		int result = 0;

		String sql = prop.getProperty("updateReply");
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reply.getReplyContent());
			pstmt.setInt(2, reply.getReplyNo());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	/** 댓글 삭제 DAO
	 * @param conn
	 * @param replyNo
	 * @return result
	 * @throws Exception
	 * by 강지애
	 */
	public int deleteReply(Connection conn, int replyNo) throws Exception{
		int result = 0;

		String sql = prop.getProperty("deleteReply");
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}