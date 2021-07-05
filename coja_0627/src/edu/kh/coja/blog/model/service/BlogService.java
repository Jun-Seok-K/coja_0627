package edu.kh.coja.blog.model.service;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import edu.kh.coja.blog.model.dao.BlogDAO;
import edu.kh.coja.blog.model.vo.Blog;
import edu.kh.coja.blog.model.vo.Category;

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
	 * @param ctNmList 
	 * @return result
	 * @throws Exception
	 * by 준석
	 */
	public int updateBlog(Blog blog, String[] ctNmList) throws Exception{
		Connection conn = getConnection();
		
		int result = dao.updateBlog(conn, blog);
		int resultCategory = 0;
		if(result > 0) {
			resultCategory = dao.updateCategory(conn, ctNmList, blog.getMemNo());
			
			if(resultCategory > 0) {
				commit(conn);
				
			}else {
				close(conn);
			}
			
		}
		
		close(conn);
		
		
		close(conn);
			
		return resultCategory;
	}


	/** 회원별 카테고리 리스트 조회
	 * @param memNo
	 * @return categoryList
	 * @throws Exception
	 * by 준석
	 */
	public List<Category> selectCategory(int memNo) throws Exception{
		Connection conn = getConnection();
		
		List<Category> categoryList = dao.selectCategory(conn, memNo);
		
		close(conn);
		
		return categoryList;
	}

	
	
	
	
	
	
	
}
