package edu.kh.coja.member.model.service;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.sql.Connection;

import edu.kh.coja.member.model.dao.MemberDAO;
import edu.kh.coja.member.model.vo.Member;

// Service : 비즈니스 로직 처리(데이터 가공, 트랜잭션 처리)
public class MemberService {

	private MemberDAO dao = new MemberDAO();

	/**
	 * 로그인 Service
	 * 
	 * @param memId
	 * @param memPw
	 * @return loginMember
	 * @throws Exception
	 */
	public Member login(String memId, String memPw) throws Exception {

		Connection conn = getConnection();

		Member loginMember = dao.login(conn, memId, memPw);

		close(conn);

		return loginMember;
	}

	/* by Mia */
	/**
	 * 회원가입 Service
	 * 
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Member member) throws Exception {

		// 1) 커넥션 얻어오기
		Connection conn = getConnection();

		// 2) DAO 호출해서 insert 진행 후 결과 반환 받기
		int result = dao.signUp(conn, member);
		/// 흐름대로 하면 여기까지 하고 DAO에 가서 signUp() 만들기

		// 3) 반환 받은 결과에 따라 트랜잭션 처리하기
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		// 4) 사용한 커넥션 반환하기
		close(conn);

		// 5) 결과를 Controller로 반환하기
		return result;
	}

	/**
	 * 아이디 중복검사 Service
	 * 
	 * @param id
	 * @return result
	 * @throws Exception
	 */
	public int idDupCheck(String id) throws Exception {

		Connection conn = getConnection();

		int result = dao.idDupCheck(conn, id);

		close(conn);

		return result;
	}

	/**
	 * 닉네임 중복검사 Service
	 * 
	 * @param nick
	 * @return result
	 * @throws Exception
	 */
	public int nickNameDupCheck(String nickName) throws Exception {
		Connection conn = getConnection();

		int result = dao.nickNameDupCheck(conn, nickName);

		close(conn);

		return result;
	}

	public int emailDupCheck(String email) throws Exception {
		Connection conn = getConnection();

		int result = dao.emailDupCheck(conn, email);

		close(conn);

		return result;
	}

	/**
	 * 회원정보 update Service
	 * 
	 * @param memNick
	 * @param memWorkExp
	 * @param memExpYr
	 * @return result
	 * @throws Exception
	 */
	public int updateMember(int memNo, String memNick, String memWorkExp, int memExpYr) throws Exception {
		Connection conn = getConnection();

		int result = dao.updateMember(conn, memNo, memNick, memWorkExp, memExpYr);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	/**
	 * 비밀번호 변경 Service
	 * 
	 * @param currentPw
	 * @param newPw1
	 * @param memNo
	 * @return result
	 * @throws Exception 작성자_강지애
	 */
	public int pwUpdate(String currentPw, String newPw1, int memNo) throws Exception {
		Connection conn = getConnection();

		int result = dao.pwUpdate(conn, currentPw, newPw1, memNo);

		close(conn);

		return result;
	}

	/**
	 * 아이디찾기 Service
	 * 
	 * @param memNm
	 * @param memEmail
	 * @return findID
	 * @throws Exception 설화
	 */
	public String findID(String name, String email) throws Exception {
		Connection conn = getConnection();

		String findID = dao.findID(conn, name, email);

		close(conn);

		return findID;
	}

	/**
	 * 비밀번호 찾기 Service
	 * 
	 * @param memID
	 * @param memEmail
	 * @return findPw
	 * @throws Exception 설화
	 */
	public String findPw(String id, String email) throws Exception {

		Connection conn = getConnection();

		String findPw = dao.findPw(conn, id, email);

		close(conn);

		return findPw;
	}

	/**
	 * 회원탈퇴 Service
	 * 
	 * @param memNo
	 * @return result
	 * @throws Exception 가을
	 */

	public int secession(int memberNo) throws Exception {

		Connection conn = getConnection();

		int result = dao.secession(conn, memberNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;

	}

}