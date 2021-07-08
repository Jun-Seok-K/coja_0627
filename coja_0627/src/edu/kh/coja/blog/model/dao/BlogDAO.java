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
import edu.kh.coja.blog.model.vo.PostCt;
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
		System.out.println(blog.getBlogPublic());
		String sql = prop.getProperty("updateBlog");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, blog.getBlogNm());
			pstmt.setString(2, blog.getBlogIntro());
			pstmt.setString(3, blog.getBlogPublic());
			pstmt.setInt(4, blog.getMemNo());
			
			result = pstmt.executeUpdate();
			
			
			System.out.println(result);
			
			
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}


	
	/** 회원별 카테고리 리스트 조회 DAO
	 * @param conn
	 * @return categoryList
	 * @throws Exception
	 */
	public List<PostCt> selectCategory(Connection conn) throws Exception{
		List<PostCt> categoryList = null;		
		
		String sql = prop.getProperty("selectCategory");
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			categoryList = new ArrayList<PostCt>();
			
			while(rs.next()) {
				int pstCtNo = rs.getInt("PST_CT_NO");
				String pstCtNm = rs.getString("PST_CT_NM");				
				
				PostCt category = new PostCt(pstCtNo, pstCtNm);
				
				categoryList.add(category);
			}
			
		}finally {
			close(rs);
			close(pstmt);
			
		}
		
		return categoryList;
	}

	
}
