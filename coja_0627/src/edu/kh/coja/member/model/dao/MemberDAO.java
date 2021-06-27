package edu.kh.coja.member.model.dao;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import edu.kh.coja.member.model.vo.Member;

// DAO(Data Access Object) : DB 연결 객체
public class MemberDAO {

	// 자주 사용하는 JDBC 객체 참조 변수 선언
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 외부 XML 파일에 작성된 SQL 구문을 읽어와 저장할 Properties객체 참조 변수 선언
	private Properties prop = null;

	// 기본 생성자를 이용한 DAO 객체 생성 시 외부 XML파일을 읽어와 prop에 저장
	public MemberDAO() {
		// member-query.xml 파일의 경로 얻어오기
		String filePath = MemberDAO.class.getResource("/edu/kh/coja/sql/member/member-query.xml").getPath();

		try {
			prop = new Properties();

			// filePath 변수에 저장된 경로로 부터 XML 파일을 읽어와 prop에 저장
			prop.loadFromXML(new FileInputStream(filePath));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 로그인 DAO
	    * @param conn
	    * @param memberId
	    * @param memberPw
	    * @return loginMember
	    * @throws Exception
	    */
	   public Member login(Connection conn, String memId, String memPw) throws Exception {
	      Member loginMember = null;
	      
	      String sql = prop.getProperty("login");
	      
	      try {
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         // 위치홀더에 알맞은 값 채우기
	         pstmt.setString(1, memId);
	         pstmt.setString(2, memPw);

	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {   
	            int memNo = rs.getInt("MEM_NO");
	            String memNm = rs.getString("MEM_NM");
	            String memNick = rs.getNString("MEM_NICK");
	            String memEmail = rs.getString("MEM_EMAIL");
	            Date memEnrollDt = rs.getDate("MEM_ENROLL_DT");
	            String memWorkExp = rs.getString("MEM_WORK_EXP");
	            int memExpYr = rs.getInt("MEM_EXP_YR");
	            int memWarningPoint = rs.getInt("MEM_WARNING_POINT");
	            String memStatus = rs.getString("MEM_STATUS");
	            String memGrade = rs.getString("MEM_GRADE");
	            
	            loginMember = new Member(memNo, memId, memNm, memNick, memEmail, memEnrollDt, memWorkExp, memExpYr, memWarningPoint, memStatus);
	         }
	         
	      }finally {
	         
	         close(rs);
	         close(pstmt);
	      }
	      
	      return loginMember;
	   }

	/* by Mia */
	/** 회원가입 DAO
	 * @param conn
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Connection conn, Member member) throws Exception {
		
		int result = 0;
		String sql = prop.getProperty("signUp");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getMemId());
			pstmt.setString(2, member.getMemPw());
			pstmt.setString(3, member.getMemNm());
			pstmt.setString(4, member.getMemNick());
			pstmt.setString(5, member.getMemEmail());
			pstmt.setString(6, member.getMemWorkExp());
			pstmt.setInt(7, member.getMemExpYr());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		return result;
	}

	/* by Mia */
	/** 아이디 중복검사 DAO
	 * @param conn
	 * @param id
	 * @return result
	 * @throws Exception
	 */
	public int idDupCheck(Connection conn, String id) throws Exception {
		int result = 0;
		String sql = prop.getProperty("idDupCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int nickNameDupCheck(Connection conn, String nickName) throws Exception {
		int result = 0;
		String sql = prop.getProperty("nickDupCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int emailDupCheck(Connection conn, String email) throws Exception {
		int result = 0;
		String sql = prop.getProperty("emailDupCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
}
