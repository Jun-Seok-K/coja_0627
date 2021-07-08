package edu.kh.coja.admin.model.dao;

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

import edu.kh.coja.admin.model.vo.Carousel;
import edu.kh.coja.admin.model.vo.Pagination;
import edu.kh.coja.member.model.vo.Member;


public class SelectMemberDAO {
	
	   // 자주 사용하는 JDBC 객체 참조 변수 선언
	   private Statement stmt = null;
	   private PreparedStatement pstmt = null;
	   private ResultSet rs = null;
	   private Properties prop = null;

	   public SelectMemberDAO() {
	      String filePath = SelectMemberDAO.class.getResource("/edu/kh/coja/sql/admin/admin-query.xml").getPath();
	      try {
	         prop = new Properties();
	         // filePath 변수에 저장된 경로로부터 XML 파일을 읽어와 prop에 저장
	         prop.loadFromXML(new FileInputStream(filePath));

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }

	   /** 전체 회원수 조회 DAO 
	 * @param conn
	 * @param cp
	 * @param boardType
	 * @return map
	 * @throws Exception
	 */
	public int getMemberListCount(Connection conn, int cp) throws Exception {
		int countMember = 0;
		
		String sql = prop.getProperty("memberListCount");
		try {
			
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				countMember = rs.getInt(1);
			}
		} finally {
			close(rs);
			close(stmt);
		}
		System.out.println(countMember);
		return countMember;
		
	}
	
	/** 전체 회원 조회 DAO
	 * @param conn
	 * @param pagination
	 * @return memberList
	 * @throws Exception
	 */
	public List<Member> selectMemberList(Connection conn, Pagination pagination) throws Exception {
		
		List<Member> memberList = new ArrayList<Member>();
		String sql = prop.getProperty("memberList");
		try {
			pstmt=conn.prepareStatement(sql);
			int startRow = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int endRow = startRow + pagination.getLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				Member member = new Member
						(rs.getInt("MEM_NO"), rs.getString("MEM_ID"), 
						rs.getString("MEM_PW"), rs.getString("MEM_NM"), 
						rs.getString("MEM_NICK"), rs.getString("MEM_EMAIL"), 
						rs.getDate("MEM_ENROLL_DT"), rs.getString("MEM_WORK_EXP"), 
						rs.getInt("MEM_EXP_YR"), rs.getInt("MEM_WARN"), 
						rs.getString("MEM_STATUS"), rs.getString("MEM_GRADE"));
					
					memberList.add(member);
				
			}
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return memberList;
	}

	public List<Member> optionalMemberList(Connection conn, Pagination pagination, String option) throws Exception {

		List<Member> memberList = new ArrayList<Member>();
		System.out.println("option : " + option);
		String sql = prop.getProperty(option);
		try {
			pstmt=conn.prepareStatement(sql);
			int startRow = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int endRow = startRow + pagination.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				Member member = new Member
						(rs.getInt("MEM_NO"), rs.getString("MEM_ID"), 
						rs.getString("MEM_PW"), rs.getString("MEM_NM"), 
						rs.getString("MEM_NICK"), rs.getString("MEM_EMAIL"), 
						rs.getDate("MEM_ENROLL_DT"), rs.getString("MEM_WORK_EXP"), 
						rs.getInt("MEM_EXP_YR"), rs.getInt("MEM_WARN"), 
						rs.getString("MEM_STATUS"), rs.getString("MEM_GRADE"));
				
				memberList.add(member);
			}
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return memberList;
	}

	public int getMemberListCount(Connection conn, int cp, String option) throws Exception {
		
		int countMember = 0;
		
		String sql = prop.getProperty(option+"Count");
		try {
			
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				countMember = rs.getInt(1);
			}
		} finally {
			close(rs);
			close(stmt);
		}
		System.out.println(countMember);
		return countMember;
	}


	/** 회원 상태 변경 DAO
	 * @param conn
	 * @param member
	 * @return result
	 * @throws Exception
	 * 설화
	 */
	public int updateStatus(Connection conn, Member member) throws Exception{
		
		int result = 0;
		
		String sql = prop.getProperty("updateStatus");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getMemStatus());
			pstmt.setInt(2, member.getMemNo());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		
		return result;
		
		
	}

	
	
	

}
