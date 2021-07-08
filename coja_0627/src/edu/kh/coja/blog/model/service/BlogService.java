package edu.kh.coja.blog.model.service;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import edu.kh.coja.blog.model.dao.BlogDAO;
import edu.kh.coja.blog.model.vo.Blog;
import edu.kh.coja.blog.model.vo.PostCt;

public class BlogService {

	private BlogDAO dao = new BlogDAO();


	/** 블로그 조회 Service
	 * @param blogNo
	 * @return loginBlog
	 * @throws Exception
	 * by 준석
	 */
	public Blog selectBlog(int memNo) throws Exception{
		Connection conn = getConnection();
		
		Blog loginBlog = dao.selectBlog(conn, memNo);
		
		close(conn);
		
		return loginBlog;
	}


	/** 블로그 update Servie
	 * @param blog
	 * @return result
	 * @throws Exception
	 * by 준석
	 */
	public int updateBlog(Blog blog) throws Exception{
		Connection conn = getConnection();
		
		int result = dao.updateBlog(conn, blog);
	
		if(result > 0) {
			commit(conn);
		
		}else {
			rollback(conn);
		}
		
		close(conn);
			
		return result;
	}


	/** 회원별 카테고리 리스트 조회
	 * @return categoryList
	 * @throws Exception
	 * by 준석
	 */
	public List<PostCt> selectCategory() throws Exception{
		Connection conn = getConnection();
		
		List<PostCt> categoryList = dao.selectCategory(conn);
		
		close(conn);
		
		return categoryList;
	}

	
	
	
	
	
	
	
}
