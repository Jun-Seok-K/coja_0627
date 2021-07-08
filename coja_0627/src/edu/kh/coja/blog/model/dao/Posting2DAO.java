package edu.kh.coja.blog.model.dao;


import static edu.kh.coja.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.kh.coja.blog.model.vo.PostCt;
import edu.kh.coja.blog.model.vo.Posting;

public class Posting2DAO {
	
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Properties prop = null;
	
	public Posting2DAO() {
		
		String filePath = Posting2DAO.class.getResource("/edu/kh/coja/sql/blog/blog2-query.xml").getPath();
		
		try {
			prop = new Properties();
			
			prop.loadFromXML(new FileInputStream(filePath));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	/** 카테고리 리스트 조회 DAO
	 * @param conn
	 * @return
	 * @throws Exception
	 */
	public List<PostCt> selectCategoryList(Connection conn) throws Exception{
		List<PostCt> category = new ArrayList<PostCt>();
		
		String sql = prop.getProperty("selectCategoryList");
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				PostCt ca = new PostCt();
				
				ca.setPstCtNo(rs.getInt("PST_CT_NO"));
				ca.setPstCtNm(rs.getString("PST_CT_NM"));
				
				category.add(ca);
			}
			
		}finally {
			close(stmt);
			
		}
		
		return category;
	}

	public int nextPstNo(Connection conn) throws Exception{
		
		int pstNo = 0;
		
		String sql = prop.getProperty("nextPstNo");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				pstNo = rs.getInt(1);
			}
		}finally {
			close(rs);
			close(stmt);
		
		}
		return pstNo;
	}

	/** 포스팅 삽입 DAO 임시-설화
	 * @param conn
	 * @param posting
	 * @param pstType
	 * @return result
	 * @throws Exception
	 */
	public int insertPosting(Connection conn, Posting posting, int pstType) throws Exception{
		
		int result = 0;
		
		String sql =prop.getProperty("insertPosting");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, posting.getPstNo());
			pstmt.setString(2, posting.getPstTitle());
			pstmt.setString(3, posting.getPstCnt());
			pstmt.setString(4, posting.getPstBox());
			pstmt.setInt(5, posting.getMemNo());
			pstmt.setInt(6, posting.getPstCtNo());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

}
