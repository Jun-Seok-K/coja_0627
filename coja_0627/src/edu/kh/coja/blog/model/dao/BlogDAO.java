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

import edu.kh.coja.blog.model.vo.Blog;
import edu.kh.coja.blog.model.vo.Category;
import edu.kh.coja.member.model.dao.MemberDAO;

public class BlogDAO {
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Properties prop = null;

	public BlogDAO() {
		String filePath = MemberDAO.class.getResource("/edu/kh/coja/sql/blog/blog-query.xml").getPath();

		try {
			prop = new Properties();

			prop.loadFromXML(new FileInputStream(filePath));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	/** 블로그 조회 DAO
	 * @param conn
	 * @param blogNo
	 * @return loginBlog
	 * @throws Exception
	 * by 준석
	 */
	public Blog selectBlog(Connection conn, int memNo) throws Exception{
		Blog loginBlog = null;
		
		String sql = prop.getProperty("selectBlog");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memNo = rs.getInt("MEM_NO");
				String blogNm = rs.getString("BLOG_NM");
				String blogAddr = rs.getString("BLOG_ADDR");
				int blogVisit = rs.getInt("BLOG_VISIT");
				String blogPublic = rs.getString("BLOG_PUBLIC");
				String blogIntro = rs.getString("BLOG_INTRO");
				
				loginBlog = new Blog(memNo, blogNm, blogAddr, blogVisit, blogPublic, blogIntro);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return loginBlog;
	}


	
	
	/** 블로그 update DAO
	 * @param conn
	 * @param blog
	 * @return result
	 * @throws Exception
	 * by 준석
	 */
	public int updateBlog(Connection conn, Blog blog) throws Exception{
		int result = 0;
		
		String sql = prop.getProperty("updateBlog");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, blog.getBlogNm());
			pstmt.setString(2, blog.getBlogIntro());
			pstmt.setString(3, blog.getBlogAddr());
			pstmt.setInt(4, blog.getMemNo());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}


	
	/** 회원별 카테고리 리스트 조회 DAO
	 * @param conn
	 * @param memNo
	 * @return categoryList
	 * @throws Exception
	 */
	public List<Category> selectCategory(Connection conn, int memNo) throws Exception{
		List<Category> categoryList = null;		
		
		String sql = prop.getProperty("selectCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rs = pstmt.executeQuery();
			
			categoryList = new ArrayList<Category>();
			
			while(rs.next()) {
				int ctNo = rs.getInt("CT_NO");
				String ctNm = rs.getString("CT_NM");				
				
				Category category = new Category(ctNo, ctNm);
				
				categoryList.add(category);
			}
			
		}finally {
			close(rs);
			close(pstmt);
			
		}
		
		return categoryList;
	}


	public int updateCategory(Connection conn, String[] ctNmList, int memNo) throws Exception{
		String sql = prop.getProperty("updateCategory");
		
		int resultCategory = 0;
		
		for(int i=0; i<ctNmList.length; i++) {
			
			System.out.println(ctNmList[i]);
		}
		
		try {
			for(int i=1; i<ctNmList.length+1; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ctNmList[i-1]);
				pstmt.setInt(2, memNo);
				pstmt.setInt(3, i);				
				resultCategory = pstmt.executeUpdate();
			}
			
		}finally {
			close(pstmt);
			
		}
		return resultCategory;
	}
	
}
