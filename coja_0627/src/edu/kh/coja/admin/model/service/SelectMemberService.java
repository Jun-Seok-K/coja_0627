package edu.kh.coja.admin.model.service;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import edu.kh.coja.admin.model.dao.SelectMemberDAO;
import edu.kh.coja.admin.model.vo.Carousel;
import edu.kh.coja.admin.model.vo.Pagination;
import edu.kh.coja.admin.model.vo.Reports;
import edu.kh.coja.member.model.vo.Member;

public class SelectMemberService {

	private SelectMemberDAO dao = new SelectMemberDAO();

	/**
	 * 페이징 처리 객체 생성용 Service
	 * 
	 * @param cp
	 * @return pagination
	 * @throws Exception 설화
	 */
	public Pagination getPagination(int cp) throws Exception {
		Connection conn = getConnection();
		// DB에서 전체 회원 수
		int countMember = dao.getMemberListCount(conn, cp);
		close(conn);
		return new Pagination(cp, countMember);
	}

	/**
	 * 전체 멤버 조회 Service
	 * 
	 * @param pagination
	 * @return memberList
	 * @throws Exception 설화
	 */
	public List<Member> selectMemberList(Pagination pagination) throws Exception {

		Connection conn = getConnection();
		List<Member> memberList = dao.selectMemberList(conn, pagination);
		close(conn);

		return memberList;
	}

	/**
	 * 옵셥있는 멤버리스트 조회 Service
	 * 
	 * @param pagination
	 * @param option
	 * @return memberList
	 * @throws Exception 설화
	 */
	public List<Member> optionalMemberList(Pagination pagination, String option) throws Exception {

		Connection conn = getConnection();
		List<Member> memberList = dao.optionalMemberList(conn, pagination, option);
		close(conn);

		return memberList;
	}

	/**
	 * 옵션 회원리스트 페이지네이션 Service
	 * 
	 * @param cp
	 * @param option
	 * @return
	 * @throws Exception 설화
	 */
	public Pagination getPagination(int cp, String option) throws Exception {
		Connection conn = getConnection();
		// DB에서 option에 따라 검색된 회원 수
		int countMember = dao.getMemberListCount(conn, cp, option);
		close(conn);
		return new Pagination(cp, countMember);
	}

	/**
	 * 회원 상태 변경(admin) Service
	 * 
	 * @param memberStatus
	 * @return result
	 * @throws Exception 설화
	 */

	public int updateStatus(Member member) throws Exception {
		Connection conn = getConnection();

		int result = dao.updateStatus(conn, member);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);
		return result;
	}

///////////////////////////
	/**
	 * 게시글 전체조회 Service
	 * 
	 * @param cp
	 * @param rptType
	 * @return 가을
	 */

	public Pagination getPagination(int cp, int rptType) throws Exception {
		Connection conn = getConnection();

// DB에서 전체 게시글 수 + 게시판 이름을 얻어옴
		int listCount = dao.getListCount(conn, cp, rptType);

		close(conn);

		return new Pagination(cp, listCount);

	}

	/**
	 * 게시글 목록 조회 Service
	 * 
	 * @param pagination
	 * @return boardList
	 * @throws Exception 가을
	 */

	public List<Reports> selectReports(Pagination pagination) throws Exception {
		Connection conn = getConnection();

		List<Reports> reportsList = dao.selectReportsList(conn, pagination);

		close(conn);

		return reportsList;

	}

	/**
	 * 고객센터 상세 조회 Service
	 * 
	 * @param rptNo
	 * @return
	 * @throws Exception
	 */

	public Reports selectBoard(int rptNo) throws Exception {
		Connection conn = getConnection();

		Reports reports = dao.selectBoard(conn, rptNo);

		close(conn);

		return reports;
	}

}
