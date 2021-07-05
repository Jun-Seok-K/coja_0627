package edu.kh.coja.member.model.service;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.sql.Connection;

import edu.kh.coja.member.model.dao.MemberDAO;
import edu.kh.coja.member.model.vo.Member;
import edu.kh.coja.wrapper.EncryptWrapper;

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
	 * @return resultBlog
	 * @throws Exception
	 */
	public int signUp(Member member) throws Exception {
		Connection conn = getConnection();
		Member loginMember = null;
		int resultBlog = 0;
		int result = dao.signUp(conn, member);
		
		
		if (result > 0) {
			commit(conn);
			
			loginMember = dao.selectMember(conn, member.getMemId());
			
			resultBlog = dao.insertBlog(conn, loginMember.getMemNo(), member.getMemNick(), member.getMemId());
			
			if(resultBlog > 0) {
				commit(conn);
				
			}else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		
		close(conn);

		System.out.println("resultBlog : " + resultBlog);
		
		return resultBlog;
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

		if(result > 0) commit(conn);
		else		   rollback(conn);
		
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
	   public int findPw(String id, String email, String tempPw) throws Exception {
		      
		      Connection conn = getConnection();

		      tempPw= EncryptWrapper.getSha512(tempPw);
		      
		      int result = dao.findPw(conn, id, email, tempPw);
		      
		      if (result > 0) {
		         commit(conn);
		         System.out.println("commit 성공");
		      } else {
		         rollback(conn);
		      }

		      close(conn);

		      return result;
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