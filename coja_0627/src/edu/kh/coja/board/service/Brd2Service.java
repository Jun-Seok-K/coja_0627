package edu.kh.coja.board.service;

import static edu.kh.coja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import edu.kh.coja.board.model.dao.Brd2DAO;
import edu.kh.coja.board.model.vo.Board;
import edu.kh.coja.board.model.vo.BrdCategory;
import edu.kh.coja.board.model.vo.BrdImg;
import edu.kh.coja.board.model.vo.BrdComment;



public class Brd2Service {
	
	private Brd2DAO dao = new Brd2DAO();

	/** 카테고리 목록 조회 Service
	 * @return brdCategory
	 * @throws Exception
	 */
	public List<BrdCategory> selectBrdCategoryList() throws Exception{
		
		Connection conn = getConnection();
		
		List<BrdCategory> brdCategory = dao.selectBrdCategoryList(conn);
		
		close(conn);
		
		return brdCategory;
	}

	
	/** 게시글 삽입 Service
	 * @param board
	 * @param brdImgList
	 * @return result
	 * @throws Exception
	 */
	public int insertBrd(Board board, List<BrdImg> brdImgList) throws Exception{
		
		Connection conn = getConnection();
		
		// 1. 다음 게시글 번호 얻어오기
		// 왜? 동시 다발적인 INSERT 발생 시 시퀀스.NEXTVAL가 연속으로 이루어져
		// 이후 시퀀스.CURRVAL가 호출될 때 원하는 값을 못얻어 오는 경우가 생기기 때문에...
		int brdNo = dao.nextBrdNo(conn);
		
		int result = 0;
		
		// 2. 얻어온 brdNo가 존재할 경우 board 객체 추가 후 board를 insert
		if(brdNo > 0) {
			board.setBrdNo(brdNo);
			
			// 2.5 > 게시글 내용의 줄바꿈을 <br> 태그로 변환하는 작업 필요
			//		+ 크로스 사이트 스크립팅 방지 처리
			// textarea의 개행문자 : \r\n
			// div의 개행문자 : <br>
			String brdCnt = board.getBrdCnt(); // <script> \r\n
			brdCnt = replaceParameter(brdCnt); // &lt;script&gt;
			brdCnt = brdCnt.replaceAll("\r\n", "<br>"); // &lt;script&gt; <br>
			board.setBrdCnt(brdCnt);
			
			result = dao.insertBrd(conn, board);
			
			// 3. 게시글 부분 삽입 성공 시 파일 정보 삽입
			if(result > 0) {
				
				// brdImgList에서 하나씩 꺼내서 한 행씩 insert
				for(BrdImg brdImg : brdImgList) {
					brdImg.setBrdNo(brdNo); // 게시글 번호 세팅
					
					result = dao.insertBrdImg(conn, brdImg);
					
					if(result == 0) { // insert 실패 시 바로 rollback 후 남은 구문은 수행하지 않음.
						rollback(conn);
						break;
					}
				}
				
				if(result > 0) {
					commit(conn);
					// 게시글 삽입 성공 -(다음 화면)-> 작성한 글 (상세조회 -> 게시글 번호 필요!)
					result = brdNo;
					// result에 brdNo를 담아 상세조회로 이동할 때 사용하게 함.
				}else {
					rollback(conn); // 없으면 자동 commit 일어나는 문제 발생
				}
				
			}else {
				rollback(conn);
			}
		}
	
		close(conn);
		
		return result;
	}
	

	// 크로스 사이트 스크립트 방지 메소드
	private String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
	}
	
	
	/** 게시글 수정 Service
	 * @param board
	 * @param brdImgList
	 * @return result
	 * @throws Exception
	 */
	public int updateBrd(Board board, List<BrdImg> brdImgList) throws Exception {
		
		Connection conn = getConnection();
		
		
		// 게시글, 첨부파일 DAO를 분리해서 호출
		
		// 크로스 사이트 스크립팅 방지 + 개행 문자 처리
		board.setBrdCnt( replaceParameter( board.getBrdCnt()) );
		board.setBrdTitle( replaceParameter( board.getBrdTitle()) );
		board.setBrdCnt( board.getBrdCnt().replaceAll("\r\n", "<br>"));
		
		// 게시글 수정
		int result = dao.updateBrd(conn, board);
		
		if(result > 0) { // 게시글 수정 성공 시
			
			// 파일 정보를 atList에서 꺼내서 하나씩 꺼내서 DAO를 호출
			for(BrdImg brdImg : brdImgList) {
				
				result = dao.updateBrdImg(conn, brdImg);
				
				// updateAttachment() 수행 결과가 0인 경우
				// == 기존에 해당 레벨에 첨부 파일이 없었다.
				// --> 없으면 insert를 진행하면 된다.
				
				if( result == 0 ) {
					result = dao.insertBrdImg(conn, brdImg);
				
					if( result == 0 ) { // insert가 안된 경우
						break;
					}
				}
			}
	
			// 반복문 종류 후 result가 0보다 큰 경우
			// == 첨부 파일의 수정, 삽입 모두 성공한 경우
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
	
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

	/** 댓글 목록 조회 Service
	 * @param brdNo 
	 * @return list
	 * @throws Exception
	 */
	public List<BrdComment> selectList(int brdNo) throws Exception{
		Connection conn = getConnection();
		
		List<BrdComment> list = dao.selectList(conn, brdNo);
		
		close(conn);
		
		return list;
	}

	/** 댓글 삽입 Service
	 * @param brdComment
	 * @return result
	 * @throws Exception
	 */
	public int insertBrdComment(BrdComment brdComment) throws Exception{
		Connection conn = getConnection();
		
		// 크로스 사이트 스크립팅 방지 처리
		brdComment.setBrdCmtCnt( replaceParameter(brdComment.getBrdCmtCnt()) );
		// 개행 문자 변경
		brdComment.setBrdCmtCnt( brdComment.getBrdCmtCnt().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")  );
		
		int result = dao.insertBrdComment(conn, brdComment);
		
		if(result > 0) 	commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}

	/** 댓글 수정 Service
	 * @param brdComment
	 * @return result
	 * @throws Exception
	 */
	public int updateBrdComment(BrdComment brdComment) throws Exception{
		
		Connection conn = getConnection();
		
		// 크로스 사이트 스크립팅 방지 처리
		brdComment.setBrdCmtCnt( replaceParameter(brdComment.getBrdCmtCnt()) );
		// 개행 문자 변경
		brdComment.setBrdCmtCnt( brdComment.getBrdCmtCnt().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")  );
		
		
		int result = dao.updateBrdComment(conn, brdComment);
		
		if(result > 0) 	commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
		
	}

	/** 댓글 삭제 Service
	 * @param brdCmtNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteBrdComment(int brdCmtNo) throws Exception{
		Connection conn = getConnection();
		
		int result = dao.deleteBrdComment(conn, brdCmtNo);
		
		if(result > 0) 	commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}

	
}