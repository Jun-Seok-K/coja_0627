package edu.kh.coja.blog.model.service;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import edu.kh.coja.blog.model.dao.Posting2DAO;
import edu.kh.coja.blog.model.vo.PostCt;
import edu.kh.coja.blog.model.vo.Posting;

public class Posting2Service {

	private Posting2DAO dao = new Posting2DAO();
	
	/** 카테고리 목록 조회 Service
	 * @return
	 * @throws Exception
	 */
	public List<PostCt> selectCategoryList() throws Exception{
		Connection conn = getConnection();
				
		List<PostCt> category = dao.selectCategoryList(conn);
		
		close(conn);
		
		return category;
	}

	public int InsertPosting(Posting posting, int pstType) throws Exception{
		
		Connection conn = getConnection();
		int pstNo = dao.nextPstNo(conn);
		
		int result = 0;
		
		if(pstNo > 0) {
			posting.setPstNo(pstNo);
			String pstCnt = posting.getPstCnt();
			pstCnt = pstCnt.replaceAll("\r\n", "<br>");
			posting.setPstCnt(pstCnt);
			
			
			result = dao.insertPosting(conn, posting, pstType);
			
			System.out.println(result);
			
			// 포스팅 삽입 성공
			if(result > 0) {
				commit(conn);
			}else rollback(conn);
					
		}
		
		close(conn);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
