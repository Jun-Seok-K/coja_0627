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

public class MemberDAO {

	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Properties prop = null;

	public MemberDAO() {
		String filePath = MemberDAO.class.getResource("/edu/kh/coja/sql/member/member-query.xml").getPath();

		try {
			prop = new Properties();

			prop.loadFromXML(new FileInputStream(filePath));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 로그인 DAO
	 * 
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

			if (rs.next()) {
				int memNo = rs.getInt("MEM_NO");
				String memNm = rs.getString("MEM_NM");
				String memNick = rs.getNString("MEM_NICK");
				String memEmail = rs.getString("MEM_EMAIL");
				Date memEnrollDt = rs.getDate("MEM_ENROLL_DT");
				String memWorkExp = rs.getString("MEM_WORK_EXP");
				int memExpYr = rs.getInt("MEM_EXP_YR");
				int memWarningPoint = rs.getInt("MEM_WARN");
				String memStatus = rs.getString("MEM_STATUS");
				String memGrade = rs.getString("MEM_GRADE");

				loginMember = new Member(memNo, memId, memNm, memNick, memEmail, memEnrollDt, memWorkExp, memExpYr,
						memWarningPoint, memStatus);
			}

		} finally {

			close(rs);
			close(pstmt);
		}

		return loginMember;
	}

	/* by Mia */
	/**
	 * 회원가입 DAO
	 * 
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

		} finally {
			close(pstmt);
		}
		return result;
	}

	/* by Mia */
	/**
	 * 아이디 중복검사 DAO
	 * 
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

			if (rs.next()) {
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

			if (rs.next()) {
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

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	/**
	 * 회원정보 update DAO
	 * 
	 * @param conn
	 * @param memNick
	 * @param memWorkExp
	 * @param memExpYr
	 * @return result
	 * @throws Exception
	 */
	public int updateMember(Connection conn, int memNo, String memNick, String memWorkExp, int memExpYr)
			throws Exception {
		int result = 0;

		try {
			String sql = prop.getProperty("updateMember");

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNick);
			pstmt.setString(2, memWorkExp);
			pstmt.setInt(3, memExpYr);
			pstmt.setInt(4, memNo);

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * 비밀번호 변경 DAO
	 * 
	 * @param conn
	 * @param currentPw
	 * @param newPw1
	 * @param memNo
	 * @return result
	 * @throws Exception 작성자_강지애
	 */
	public int pwUpdate(Connection conn, String currentPw, String newPw1, int memNo) throws Exception {

		int result = 0;

		String sql = prop.getProperty("pwUpdate");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPw1);
			pstmt.setString(2, currentPw);
			pstmt.setInt(3, memNo);

			result = pstmt.executeUpdate();

		} finally {

			close(pstmt);

		}

		return result;
	}

	/**
	 * 아이디 찾기
	 * 
	 * @param conn
	 * @param memNm
	 * @param memEmail
	 * @return findID
	 * @throws Exception 설화
	 */
	public String findID(Connection conn, String name, String email) throws Exception {

		String findID = null;
		String sql = prop.getProperty("findID");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				findID = rs.getString(1);
			}

		} finally {
			close(rs);
			close(pstmt);
		}
		return findID;

	}

	/**
	 * 비번찾기 DAO
	 * 
	 * @param conn
	 * @param id
	 * @param email
	 * @return result
	 * @throws Exception 설화
	 */
	public int findPw(Connection conn, String id, String email, String tempPw) throws Exception {

		int result = 0;
		String sql = prop.getProperty("findPw");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tempPw);
			pstmt.setString(2, id);
			pstmt.setString(3, email);

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}

		return result;
	}

	
	// 회원탈퇴 dao
	/**
	 * @param conn
	 * @param memberNo
	 * @return result
	 * @throws Exception 가을
	 */
	public int secession(Connection conn, int memberNo) throws Exception {

		int result = 0;
		String sql = prop.getProperty("secession");
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);

		}
		return result;

	}

	/**
	 * 회원가입 후 블로그 생성 DAO
	 * 
	 * @param conn
	 * @param memNo
	 * @param memId
	 * @return resultBlog
	 * @throws Exception
	 */
	public int insertBlog(Connection conn, int memNo, String memId, String memNick) throws Exception {
		int resultBlog = 0;

		String sql = prop.getProperty("insertBlog");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, memNick + "의 블로그");
			pstmt.setString(3, memId);
			pstmt.setString(4, "블로그 소개글을 입력해주세요.");

			resultBlog = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}

		return resultBlog;
	}

	/**
	 * 회원가입 된 회원의 정보 조회
	 * 
	 * @param conn
	 * @param memId
	 * @return member
	 * @throws Exception by 준석
	 */
	public Member selectMember(Connection conn, String memId) throws Exception {
		Member member = null;

		String sql = prop.getProperty("selectMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int memNo = rs.getInt("MEM_NO");

				member = new Member();
				member.setMemNo(memNo);
			}

		} finally {
			close(rs);
			close(pstmt);

		}

		return member;
	}

}
