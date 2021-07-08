package edu.kh.coja.admin.model.service;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import edu.kh.coja.admin.model.dao.MainConfDAO;
import edu.kh.coja.admin.model.vo.Brd;
import edu.kh.coja.admin.model.vo.Carousel;
import edu.kh.coja.blog.model.vo.BlogPost;
import edu.kh.coja.blog.model.vo.PopularPstTb;
import edu.kh.coja.board.model.vo.Board;
import edu.kh.coja.member.model.vo.Member;

public class MainConfService {
	
	private MainConfDAO dao = new MainConfDAO();
	
	
	/** 캐러셀 삽입 Service
	 * @param crsList
	 * @param memNo
	 * @return 
	 * @throws Exception
	 * 설화
	 */
	public int insertCarousel(List<Carousel> crsList, int memNo) throws Exception {
		
		Connection conn = getConnection();
		
		int crsNo = dao.nextCrsNo(conn);
		
		int result = 0;
		for(Carousel crs : crsList) {
			crs.setCrsNo(crsNo);
			result = dao.insertCarousel(conn, crs, memNo);
			
			}
		if(result > 0) {
			commit(conn);
		
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/** 캐러셀 리스트 조회 Service
	 * @return crsList
	 * @throws Exception
	 */
	public List<Carousel> selectCarouselList() throws Exception {
		
		Connection conn = getConnection();
		List<Carousel> crsList = dao.selectCarouselList(conn);
		close(conn);
		
		return crsList;
	}


	/** 캐러셀 상태 업데이트 Service
	 * @param condition
	 * @param uncondition 
	 * @return result
	 * @throws Exception
	 */
	public int carouselStatus(String condition, String uncondition) throws Exception{
		
		Connection conn = getConnection();
		
		int result = dao.carouselStatus(conn, condition);
		
		if(result > 0) { // y성공
			result = dao.carouselStatusN(conn, uncondition);
			
			if(result>0) { // y성공 후 n성공
				commit(conn);
			}
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	

	/** 캐러셀 삭제 Service
	 * @param crsNo
	 * @return result
	 * @throws Exception
	 */
	public int carouselDelete(String crsNo) throws Exception{
		
		Connection conn = getConnection();
		
		int result = dao.carouselDelete(conn, crsNo);
		
		if(result>0) {
			commit(conn);
		}else rollback(conn);
		
		return result;
	}
	
	


	
	
	/********************캐러셀 끝**************************************************/
	
	/********************인기글 시작************************************************/

	
	
	/** 인기글 top10 조회 
	 * @return blogPostList
	 * @throws Exception
	 * 설화
	 */
	public List<PopularPstTb> selectBlogPostList() throws Exception {
		
		Connection conn = getConnection();
		
		List<PopularPstTb> blogPostList = dao.selectBlogPostList(conn);
		close(conn);
		
		
		return blogPostList;

	}

	/** 과목별 인기글 top10 조회 
	 * @return blogPostList
	 * @throws Exception
	 * 설화
	 */
	public List<PopularPstTb> optionalBlogPostList(String option) throws Exception {
		
		Connection conn = getConnection();
		List<PopularPstTb> optionalBlogPostList = null;
		
		if(option.equals("allpop")) {
			optionalBlogPostList = dao.selectBlogPostList(conn);
		} else {
			optionalBlogPostList = dao.optionalBlogPostList(conn, option);
			close(conn);
		}
		return optionalBlogPostList ;
	}

	/** 인기글 상세조회
	 * @param pstNo
	 * @return 
	 */
	public PopularPstTb selectPopPst(String pstNo) throws Exception {
		Connection conn = getConnection();
		PopularPstTb pst = dao.selectPopPst(conn, pstNo);
		
		close(conn);
		
		return pst;
	}

	/** 인기글 목록에서 삭제 Service (상태 D로 변경)
	 * @param condition
	 * @return result
	 * @throws Exception
	 */
	public int popPstDelete(String condition) throws Exception{
		
		Connection conn = getConnection();
		int result = dao.popPstDelete(conn, condition);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result ;
		
	}

	
	/** 메인에 보여질 캐러셀리스트 가져오기 Service
	 * @return crsList
	 * @throws Exception
	 */
	public List<Carousel> carouselShow() throws Exception{
		
		Connection conn = getConnection();
		List<Carousel> crsList = dao.carouselShow(conn);
		close(conn);
		
		return crsList;
	}

	/** 메인에 조회될 최신 게시글 리스트 조회
	 * @return
	 * @throws Exception
	 * 설화
	 */
	public List<Brd> selectBrdList() throws Exception {
		
		Connection conn = getConnection();
		List<Brd> recentBrdList = dao.selectBrdList(conn);
		close(conn);
		
		return recentBrdList ;
		
	}




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
