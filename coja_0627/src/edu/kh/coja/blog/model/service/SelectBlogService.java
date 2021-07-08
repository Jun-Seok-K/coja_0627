package edu.kh.coja.blog.model.service;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import edu.kh.coja.blog.model.dao.SelectBlogDAO;
import edu.kh.coja.blog.model.vo.Blog;
import edu.kh.coja.blog.model.vo.Pagination;
import edu.kh.coja.blog.model.vo.Posting;
import edu.kh.coja.common.JDBCTemplate.*;

public class SelectBlogService {

	private SelectBlogDAO dao = new SelectBlogDAO();

	/**
	 * 블로그 포스팅 페이징 처리 객체 생성용 Service
	 * 
	 * @param cp
	 * @param blogType
	 * @param memNo
	 * @return pagination
	 * @throws Exception
	 */
	public Pagination getPagination(int cp, int blogType, int memNo) throws Exception {
		Connection conn = getConnection();

		Map<String, Object> map = dao.getListCount(conn, cp, blogType, memNo);

		close(conn);

		int listCount = map.get("listCount") != null ? (int) map.get("listCount") : 0;

		String categoryName = (String) map.get("categoryName");

		return new Pagination(cp, listCount, blogType, categoryName);
	}

	/**
	 * 포스팅 목록 조회 Service
	 * 
	 * @param pagination
	 * @param memNo
	 * @return postingList
	 * @throws Exception
	 */
	public List<Posting> selectPostingList(Pagination pagination, int memNo) throws Exception {
		Connection conn = getConnection();

		List<Posting> postingList = dao.selectPostingList(conn, pagination, memNo);

		close(conn);

		return postingList;
	}

	/**
	 * 포스팅 상세조회
	 * 
	 * @param pstNo
	 * @return posting
	 * @throws Exception
	 */
	public Posting selectPosting(int pstNo) throws Exception {
		Connection conn = getConnection();

		Posting posting = dao.selectPosting(conn, pstNo);

		if (posting.getPstTitle() != null) {
			int result = dao.increaseReadCount(conn, pstNo);

			if (result > 0) {
				commit(conn);

				posting.setPstCount(posting.getPstCount() + 1);

			} else {

				rollback(conn);
			}

		}

		close(conn);

		return posting;
	}

	// 검색조건에 따른 반환 메소드
	private String createCondition(String searchKey, String searchValue) {
		String condition = null;

		switch (searchKey) {
		case "title":
			condition = " AND PST_TITLE LIKE '%" + searchValue + "%' ";
			break;
		case "content":
			condition = " AND PST_CNT LIKE '%" + searchValue + "%' ";
			break;
		case "titcont":
			condition = " AND (PST_TITLE LIKE '%" + searchValue + "%' " +
						" OR PST_CNT LIKE '%" + searchValue + "%') ";
			break;
		case "writer":
			condition = " AND MEM_NM LIKE '%" + searchValue + "%' ";
			break;
		}

		return condition;
	}

	// 페이징 처리 검색용
	public Pagination getPagination(int cp, int blogType, String searchKey, String searchValue) throws Exception {
		Connection conn = getConnection();

		String condition = createCondition(searchKey, searchValue);

		Map<String, Object> map = dao.getListCount(conn, cp, blogType, condition);

		close(conn);

		int listCount = map.get("listCount") != null ? (int) map.get("listCount") : 0;

		String categoryName = (String) map.get("categoryName");

		return new Pagination(cp, listCount, blogType, categoryName);

	}

	
	/** 게시글목록조회 Service (검색)
	 * @param pagination
	 * @param searchKey
	 * @param searchValue
	 * @return postingList
	 * @throws SQLException
	 */
	public List<Posting> selectPostingList(Pagination pagination, String searchKey, String searchValue) throws SQLException {
		Connection conn = getConnection();

		String condition = createCondition(searchKey, searchValue);
		
		List<Posting> postingList = dao.selectPostingList(conn, pagination, condition);

		close(conn);

		return postingList;
	
	}

}
