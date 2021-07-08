package edu.kh.coja.blog.model.dao;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import edu.kh.coja.blog.model.vo.Blog;
import edu.kh.coja.blog.model.vo.Pagination;
import edu.kh.coja.blog.model.vo.Posting;

public class SelectBlogDAO {

	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Properties prop = null;

	public SelectBlogDAO() {
		String filePath = SelectBlogDAO.class.getResource("/edu/kh/coja/sql/blog/selectBlog-query.xml").getPath();

		try {
			prop = new Properties();

			// filePath 변수에 저장된 경로로부터 XML 파일을 읽어와 prop에 저장
			prop.loadFromXML(new FileInputStream(filePath));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 전체 포스팅 수 + 블로그 카테고리 조회 DAO
	 * 
	 * @param conn
	 * @param cp
	 * @param blogType
	 * @param memNo
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getListCount(Connection conn, int cp, int blogType, int memNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			String sql = prop.getProperty("getListCount");

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, blogType);
			pstmt.setInt(2, blogType);
			pstmt.setInt(3, memNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				map.put("listCount", rs.getInt(1));
				map.put("categoryName", rs.getString(2));
			}

		} finally {
			close(rs);
			close(pstmt);

		}

		return map;
	}

	

	/**
	 * 포스팅 목록조회 DAO
	 * 
	 * @param conn
	 * @param pagination
	 * @param memNo
	 * @return postingList
	 * @throws Exception
	 */
	public List<Posting> selectPostingList(Connection conn, Pagination pagination, int memNo) throws Exception {
		List<Posting> postingList = new ArrayList<Posting>();

		String sql = prop.getProperty("selectPostingList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);

			int startRow = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int endRow = startRow + pagination.getLimit() - 1;
			pstmt.setInt(2, pagination.getBlogType());
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				Posting posting = new Posting();

				posting.setPstNo(rs.getInt("PST_NO"));
				posting.setCtNm(rs.getString("PST_CT_NM"));
				posting.setPstTitle(rs.getString("PST_TITLE"));
				posting.setPstCreateDt(rs.getDate("PST_CREATE_DT"));
				posting.setPstModifyDt(rs.getDate("PST_MODIFY_DT"));
				posting.setPstBox(rs.getString("PST_BOX"));
				posting.setPstCount(rs.getInt("PST_COUNT"));

				postingList.add(posting);
			}

		} finally {
			close(rs);
			close(pstmt);

		}
		return postingList;
	}

	/**
	 * 포스팅 상세조회 DAO
	 * 
	 * @param conn
	 * @param pstNo
	 * @return posting
	 * @throws Exception
	 */
	public Posting selectPosting(Connection conn, int pstNo) throws Exception {
		Posting posting = null;

		String sql = prop.getProperty("selectPosting");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pstNo);

			rs = pstmt.executeQuery();

			posting = new Posting();

			if (rs.next()) {
				posting.setPstNo(rs.getInt("PST_NO"));
				posting.setCtNm(rs.getString("PST_CT_NM"));
				posting.setPstTitle(rs.getString("PST_TITLE"));
				posting.setMemNm(rs.getString("MEM_NM"));
				posting.setPstCnt(rs.getString("PST_CNT"));
				posting.setPstCount(rs.getInt("PST_COUNT"));
				posting.setPstCreateDt(rs.getDate("PST_CREATE_DT"));
				posting.setPstModifyDt(rs.getDate("PST_MODIFY_DT"));
				posting.setPstBox(rs.getString("PST_BOX"));
			}

		} finally {
			close(rs);
			close(pstmt);
		}

		return posting;
	}

	public int increaseReadCount(Connection conn, int pstNo) throws Exception {
		int result = 0;

		try {
			String sql = prop.getProperty("increaseReadCount");

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pstNo);

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);

		}
		return result;
	}

	
	/**
	 * 전체 포스팅 수 + 블로그 카테고리 조회 DAO (검색용)
	 * 
	 * @param conn
	 * @param cp
	 * @param blogType
	 * @return map
	 * @throws Exception
	 */
	public Map<String, Object> getListCount(Connection conn, int cp, int blogType, String condition) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			String sql = prop.getProperty("getListCountForSearch") + condition + ")";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, blogType);
			pstmt.setInt(2, blogType);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				map.put("listCount", rs.getInt(1));
				map.put("categoryName", rs.getString(2));
			}

		} finally {
			close(rs);
			close(pstmt);

		}

		return map;
	}
	
	
	// 검색용
	public List<Posting> selectPostingList(Connection conn, Pagination pagination, String condition) throws SQLException {
		List<Posting> postingList = new ArrayList<Posting>();

		String sql = prop.getProperty("selectPostingList1") + condition + prop.getProperty("selectPostingList2");;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pagination.getBlogType());

			int startRow = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int endRow = startRow + pagination.getLimit() - 1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				Posting posting = new Posting();

				posting.setPstNo(rs.getInt("PST_NO"));
				posting.setCtNm(rs.getString("PST_CT_NM"));
				posting.setPstTitle(rs.getString("PST_TITLE"));
				posting.setPstCreateDt(rs.getDate("PST_CREATE_DT"));
				posting.setPstModifyDt(rs.getDate("PST_MODIFY_DT"));
				posting.setPstBox(rs.getString("PST_BOX"));
				posting.setPstCount(rs.getInt("PST_COUNT"));

				postingList.add(posting);
			}

		} finally {
			close(rs);
			close(pstmt);

		}
		return postingList;
	}

}
