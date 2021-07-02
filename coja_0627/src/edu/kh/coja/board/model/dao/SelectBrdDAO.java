package edu.kh.coja.board.model.dao;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import edu.kh.coja.board.model.vo.Board;
import edu.kh.coja.board.model.vo.BrdImg;
import edu.kh.coja.board.model.vo.BrdPagination;

public class SelectBrdDAO {

	// 자주 사용하는 JDBC 객체 참조 변수 선언
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 외부 XML 파일에 작성된 SQL 구문을 읽어와 저장할 Properties객체 참조 변수 선언
	private Properties prop = null;

	// 기본 생성자를 이용한 DAO 객체 생성 시 외부 XML파일을 읽어와 prop에 저장
	public SelectBrdDAO() {

		// selectBoard-query.xml 파일의 경로 얻어오기
		String filePath = SelectBrdDAO.class.getResource("/edu/kh/coja/sql/board/selectBoard-query.xml").getPath();

		try {
			prop = new Properties();

			// filePath 변수에 저장된 경로로부터 XML 파일을 읽어와 prop에 저장
			prop.loadFromXML(new FileInputStream(filePath));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 전체 게시글 수 + 카테고리 이름 조회 DAO
	 * 
	 * @param conn
	 * @param cp
	 * @param brdType
	 * @return map
	 * @throws Exception
	 */
	public Map<String, Object> getBrdListCount(Connection conn, String brdType) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		String sql = prop.getProperty("getBrdListCount");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, brdType);
			pstmt.setString(2, brdType);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				map.put("brdListCount", rs.getInt(1));
				map.put("brdTypeNm", rs.getString(2));
			}

		} finally {
			close(rs);
			close(pstmt);
		}
		;

		return map;
	}

	/**
	 * 게시글 목록 조회 DAO
	 * 
	 * @param conn
	 * @param brdPagination
	 * @return brdList
	 * @throws Exception
	 */
	public List<Board> selectBrdList(Connection conn, BrdPagination brdPagination) throws Exception {

		List<Board> brdList = new ArrayList<Board>();

		String sql = prop.getProperty("selectBrdList");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, brdPagination.getBrdType());

			// 조회할 범위를 지정할 변수 선언
			int brdStartRow = (brdPagination.getBrdCurrentPage() - 1) * brdPagination.getBrdLimit();
			int brdEndRow = brdStartRow + brdPagination.getBrdLimit() - 1;

			pstmt.setInt(2, brdStartRow);
			pstmt.setInt(3, brdEndRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 조회한 한 행의 정보를 board에 set
				Board board = new Board();

				board.setBrdNo(rs.getInt(""));
				board.setBrdTypeNm(rs.getString(""));
				board.setBrdTitle(rs.getString(""));
				board.setMemNick(rs.getString(""));
				board.setBrdReadCount(rs.getInt(""));
				board.setBrdCreateDt(rs.getDate(""));

				// 1) board의 brdImgUrl, brdImgNm에 set할 수 있는 List 객체부터 생성
				List<String> brdImgUrl = new ArrayList<String>();
				List<String> brdImgNm = new ArrayList<String>();

				// 2) 생성된 리스트에 DB 조회 결과를 추가
				brdImgUrl.add(rs.getString(""));
				brdImgNm.add(rs.getString(""));

				// 3) 리스트를 board에 set
				board.setBrdImgUrl(brdImgUrl);
				board.setBrdImgNm(brdImgNm);

				// set 완료된 board를 boardList에 추가
				brdList.add(board);
			}

		} finally {
			close(rs);
			close(pstmt);
		}

		return brdList;
	}

	
	/** 게시글 상세 조회 DAO
	 * @param conn
	 * @param brdNo
	 * @return board
	 * @throws Exception
	 */
	public Board selectBrd(Connection conn, int brdNo) throws Exception{
		Board board = null;
		
		String sql = prop.getProperty("selectBrd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, brdNo);
			
			rs = pstmt.executeQuery();
			
			board = new Board();
			
			// board에 필드 중 brdImgList에 값을 저장할 수 있도록 List 객체 하나를 생성하여 세팅
			board.setBrdImgList(new ArrayList<BrdImg>());
			
			
			boolean flag = true; // 아래 반복문 첫 반복을 하고 있을 때 true, 아닐 때 false를 나타내는 신호
			
			while(rs.next()) {
				if(flag) {
					board.setBrdNo(rs.getInt(""));
					board.setBrdType(rs.getString(""));
					board.setBrdTitle(rs.getString(""));
					board.setMemNick(rs.getString(""));
					board.setBrdReadCount(rs.getInt(""));
					board.setBrdCreateDt(rs.getDate(""));
					
					board.setBrdCnt(rs.getString(""));
					board.setMemNo(rs.getInt(""));
					board.setBrdModifyDt(rs.getDate(""));
					flag = false;
				}
				
				// 조회된 파일 관련 정보를 저장할 객체 선언(경로, 이름, 레벨)
				BrdImg brdImg = new BrdImg();
				brdImg.setBrdImgUrl( rs.getString("") );
				brdImg.setBrdImgNm( rs.getString("") );
				brdImg.setBrdImgLv( rs.getInt("") );
				
				// 값 세팅이 완료된 BrdImg 객체를
				// board의 brdImgList에 추가
				board.getBrdImgList().add(brdImg);
			}
			
		}finally {
			
			close(rs);
			close(pstmt);
		}
		
		return board;
	}


	/** 게시글 조회수 증가 DAO
	 * @param conn
	 * @param brdNo
	 * @return result
	 * @throws Exception
	 */
	public int increaseBrdReadCount(Connection conn, int brdNo) throws Exception{
		
		int result = 0;
		
		String sql = prop.getProperty("increaseBrdReadCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, brdNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
