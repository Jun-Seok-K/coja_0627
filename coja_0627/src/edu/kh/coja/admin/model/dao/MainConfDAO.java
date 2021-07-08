package edu.kh.coja.admin.model.dao;

import static edu.kh.coja.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.kh.coja.admin.model.vo.Brd;
import edu.kh.coja.admin.model.vo.Carousel;
import edu.kh.coja.blog.model.vo.BlogPost;
import edu.kh.coja.blog.model.vo.PopularPstTb;
import edu.kh.coja.board.model.vo.Board;

public class MainConfDAO {
	
	   // 자주 사용하는 JDBC 객체 참조 변수 선언
	   private Statement stmt = null;
	   private PreparedStatement pstmt = null;
	   private ResultSet rs = null;
	   private Properties prop = null;
	   
	   
	   public MainConfDAO() {
		   
	      String filePath = MainConfDAO.class.getResource("/edu/kh/coja/sql/admin/mainConf.xml").getPath();
	      try {
	         prop = new Properties();
	         // filePath 변수에 저장된 경로로부터 XML 파일을 읽어와 prop에 저장
	         prop.loadFromXML(new FileInputStream(filePath));

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	}
	   
	   
		/** 캐러셀 다음 번호 얻어오기 DAO
		 * @param conn
		 * @return
		 * @throws Exception
		 * 설화
		 */
		public int nextCrsNo(Connection conn) throws Exception {
			
			int crsNo = 0;
			String sql = prop.getProperty("nextCrsNo");

			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
					crsNo = rs.getInt(1);
				}
				
			} finally {
				close(rs);
				close(stmt);
			}
			
			System.out.println(crsNo);
			
			return crsNo;
		}

		/** 캐러셀 정보 삽입 DAO
		 * @param conn
		 * @param crs
		 * @return result
		 * @throws Exception
		 * 설화
		 */
		public int insertCarousel(Connection conn, Carousel crs, int memNo) throws Exception {
			
			int result = 0;
			String sql = prop.getProperty("insertCarousel");
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, crs.getCrsURL());
				pstmt.setString(2, crs.getCrsNm());
				pstmt.setInt(3, memNo);
				
				result = pstmt.executeUpdate();
				
			}finally {
				
				close(pstmt);
			}
			return result;
		}
		
		

		/** 캐러셀 조회 DAO
		 * @param conn
		 * @return crsList
		 * @throws Exception
		 * 설화
		 */
		public List<Carousel> selectCarouselList(Connection conn) throws Exception {
			
			List<Carousel> crsList = new ArrayList<Carousel>();
			String sql = prop.getProperty("selectCarouselList");
			
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					Carousel crs = new Carousel(
							rs.getInt("CRS_NO"), rs.getString("CRS_URL"), rs.getString("CRS_NM"),
							rs.getDate("CRS_DT"), rs.getString("CRS_DISPLAY"), rs.getInt("MEM_NO")
							);
					crsList.add(crs);
				}
			} finally {
				close(rs);
				close(stmt);
			}
			
			return crsList;
		}


		/** 캐러셀 상태 변경 DAO
		 * @param conn
		 * @param condition
		 * @return result
		 * @throws Exception
		 * 설화
		 */
		public int carouselStatus(Connection conn, String condition) throws Exception{
			int result = 0;
			String sql = prop.getProperty("carouselStatus") + condition;
			try {
				pstmt = conn.prepareStatement(sql);
				result = pstmt.executeUpdate();
			}finally {
				close(pstmt);
			}
			return result;
		}

		/** 캐러셀 상태 변경 (N으로) DAO
		 * @param conn
		 * @param uncondition 
		 * @return result
		 * @throws Exception
		 * 설화
		 */
		public int carouselStatusN(Connection conn, String uncondition) throws Exception {
			int result = 0 ;
			String sql = prop.getProperty("carouselStatusN") + uncondition;
			try {
				pstmt = conn.prepareStatement(sql);
				result = pstmt.executeUpdate();
			}finally {
				close(pstmt);
			}
			return result;
		}
		
		/** 캐러셀 삭제 DAO
		 * @param conn
		 * @param crsNo
		 * @return result
		 * @throws Exception
		 */
		public int carouselDelete(Connection conn, String crsNo) throws Exception {
			
			int result = 0;
			String sql = prop.getProperty("carouselDelete");
			try {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,crsNo);
				result = pstmt.executeUpdate();
				
			}finally {
				
				close(pstmt);
			}
			
			return result;
		}
		

		/** 메인에 캐러셀 보여주기 (상태 Y인 것 보여주면 됨)
		 * @param conn
		 * @return crsList
		 * @throws Exception
		 */
		public List<Carousel> carouselShow(Connection conn) throws Exception{
			
			List<Carousel> crsList =new ArrayList<Carousel>();
			String sql = prop.getProperty("carouselShow");
			
			try {
				
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					Carousel crs = new Carousel(
							rs.getInt("CRS_NO"), rs.getString("CRS_URL"), rs.getString("CRS_NM"),
							rs.getDate("CRS_DT"), rs.getString("CRS_DISPLAY"), rs.getInt("MEM_NO")
							);
					crsList.add(crs);
				}
			} finally {
				close(rs);
				close(stmt);
				
			}
			
			return crsList;
		}
		/********************캐러셀 끝**************************************************/
		
		/********************인기글 시작************************************************/
		
		/** 블로그 인기글 조회 DAO
		 * @param conn
		 * @return blogPostList
		 * @throws Exception
		 * 설화
		 */
		public List<PopularPstTb> selectBlogPostList(Connection conn) throws Exception{
			
			List<PopularPstTb> blogPostList = new ArrayList<PopularPstTb>();
			String sql = prop.getProperty("blogPostList");
			
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					PopularPstTb post = new PopularPstTb
							(rs.getInt("MEM_NO"), rs.getString("MEM_NM"), rs.getString("BLOG_NM"),
							 rs.getInt("PST_NO"), rs.getString("PST_TITLE"),
							 rs.getString("PST_CNT"), rs.getInt("PST_COUNT"),
							 rs.getDate("PST_CREATE_DT"), rs.getDate("PST_MODIFY_DT"),
							 rs.getString("PST_STATUS"), rs.getString("PST_BOX"),
							 rs.getInt("PST_WARN"));
					
					blogPostList.add(post);
				}
				
				
			}finally {
				close(rs);
				close(stmt);
			}
			
			return blogPostList;
			
		}

		/** 블로그 인기글 조회 DAO(옵션별)
		 * @param conn
		 * @param option
		 * @return optionalBlogPostList
		 * @throws Exception
		 * 설화
		 */
		public List<PopularPstTb> optionalBlogPostList(Connection conn, String option) throws Exception {
			
			List<PopularPstTb> optionalBlogPostList = new ArrayList<PopularPstTb>();
			
			String sql = prop.getProperty("optionalBlogPostList");
			try {
				System.out.println("선택된 옵션 : " + option);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, option);
				
				rs = pstmt.executeQuery();
				
				
				while(rs.next()) {
					PopularPstTb post = new PopularPstTb
							(rs.getInt("MEM_NO"), rs.getString("MEM_NM"), rs.getString("BLOG_NM"),
							 rs.getInt("PST_NO"), rs.getString("PST_TITLE"),
							 rs.getString("PST_CNT"), rs.getInt("PST_COUNT"),
							 rs.getDate("PST_CREATE_DT"), rs.getDate("PST_MODIFY_DT"),
							 rs.getString("PST_STATUS"), rs.getString("PST_BOX"),
							 rs.getInt("PST_WARN"));
					
					optionalBlogPostList.add(post);
				}
						
				
			}finally {
				close(rs);
				close(stmt);
			}
			
			
			return optionalBlogPostList;
		}


		public PopularPstTb selectPopPst(Connection conn, String pstNo) throws Exception{
			
			PopularPstTb pst = null;
			String sql = prop.getProperty("selectPopPst");
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, pstNo);
				
				rs = pstmt.executeQuery();
				
				
				if(rs.next()) {
					pst = new PopularPstTb(
								 rs.getInt("MEM_NO"), rs.getString("MEM_NM"), rs.getString("BLOG_NM"),
								 rs.getInt("PST_NO"), rs.getString("PST_TITLE"),
								 rs.getString("PST_CNT"), rs.getInt("PST_COUNT"),
								 rs.getDate("PST_CREATE_DT"), rs.getDate("PST_MODIFY_DT"),
								 rs.getString("PST_STATUS"), rs.getString("PST_BOX"),
								 rs.getInt("PST_WARN"));
				}
				
			
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return pst;
		}


		/** 인기글 목록에서 삭제 DAO (상태 D로 변경)
		 * @param conn
		 * @param condition
		 * @return result
		 * @throws Exception
		 */
		public int popPstDelete(Connection conn, String condition) throws Exception {
			
			int result = 0 ;
			String sql = prop.getProperty("popPstDelete") + condition;
			try {
				pstmt = conn.prepareStatement(sql);
				result = pstmt.executeUpdate();
			}finally {
				close(pstmt);
			}
			return result;
		}


		/** 메인에 보여질 게시판 최신글 목록 조회
		 * @param conn
		 * @return recentBrdList
		 * @throws Exception
		 */
		public List<Brd> selectBrdList(Connection conn) throws Exception{
			
			List<Brd> recentBrdList = new ArrayList<Brd>();
			String sql = prop.getProperty("selectBrdList");
			try {
				stmt=conn.createStatement();
				rs = stmt.executeQuery(sql);

				
				
				while(rs.next()) {
					Brd b = new Brd(
								 rs.getInt("BRD_NO"), rs.getString("BRD_TITLE"), rs.getInt("BRD_READ_COUNT"), 
								 rs.getTimestamp("BRD_CREATE_DT"),
								 rs.getString("BRD_TYPE_NM"), rs.getInt("MEM_NO"), rs.getString("MEM_NICK"), 
								 rs.getString("BRD_CNT"));
					
					recentBrdList.add(b);
				}
				System.out.println(recentBrdList);
				
			} finally {
				close(rs);
				close(stmt);
			}
			return recentBrdList;
		}






		
		
		
		

}
