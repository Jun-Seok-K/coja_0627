package edu.kh.coja.admin.model.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;


public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardTypeNm;
	private String memNm;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private int boardWarn;
	private int boardReadCount;
	private int memNo;
	
	
   // 목록 조회 시 하나만 조회되지만,
   // 상세 조회 시 여러 개가 조회 될 수 있기 때문에 List로 선언
   private List<String> boardImgUrl;
   private List<String> boardImgNm;

	// 상세조회에 필요한 필드
	private String boardContent;		//글 내용
	private List<BoardAttachment> boardAtList;	// 게시글에 첨부된 파일(이미지) 목록
	private Timestamp modifyDate;	// 마지막 작성일
	   private List<BoardAttachment> atList; // 게시글에 첨부된 파일 (이미지) 목록
	   
	
	public Board() {}
	
	public Board(int boardNo, String boardTitle, String memNm, Date boardCreateDate, String boardContent) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.memNm = memNm;
		this.boardCreateDate = boardCreateDate;
		this.boardContent = boardContent;
	}

	public Board(int boardNo, String boardTypeNm, String boardTitle, String memNm, Date boardCreateDate, int boardWarn,
			String boardContent) {
		super();
		this.boardNo = boardNo;
		this.boardTypeNm = boardTypeNm;
		this.boardTitle = boardTitle;
		this.memNm = memNm;
		this.boardCreateDate = boardCreateDate;
		this.boardWarn = boardWarn;
		this.boardContent = boardContent;
	}

	
	
	
	public Board(int boardNo, String memNm, String boardTitle, Date boardCreateDate, String boardTypeNm, String boardContent,
			int boardWarn, int boardReadCount, Date boardModifyDate, int memNo) {
		super();
		this.boardNo = boardNo;
		this.memNm = memNm;
		this.boardTitle = boardTitle;
		this.boardCreateDate = boardCreateDate;
		this.boardTypeNm = boardTypeNm;
		this.boardContent = boardContent;
		this.boardWarn = boardWarn;
		this.boardReadCount = boardReadCount;
		this.boardModifyDate = boardModifyDate;
		this.memNo = memNo;
	}

	public int getBoardNo() {
		return boardNo;
	}




	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}




	public String getBoardTitle() {
		return boardTitle;
	}




	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}




	public int getBoardReadCount() {
		return boardReadCount;
	}




	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}




	public Date getBoardCreateDate() {
		return boardCreateDate;
	}




	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}




	public Date getBoardModifyDate() {
		return boardModifyDate;
	}




	public void setBoardModifyDate(Date boardModifyDate) {
		this.boardModifyDate = boardModifyDate;
	}




	public String getBoardTypeNm() {
		return boardTypeNm;
	}




	public void setBoardTypeNm(String boardTypeNm) {
		this.boardTypeNm = boardTypeNm;
	}




	public int getBoardWarn() {
		return boardWarn;
	}




	public void setBoardWarn(int boardWarn) {
		this.boardWarn = boardWarn;
	}




	public int getMemNo() {
		return memNo;
	}




	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}




	public String getMemNm() {
		return memNm;
	}




	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}




	public List<String> getBoardImgUrl() {
		return boardImgUrl;
	}




	public void setBoardImgUrl(List<String> boardImgUrl) {
		this.boardImgUrl = boardImgUrl;
	}




	public List<String> getBoardImgNm() {
		return boardImgNm;
	}




	public void setBoardImgNm(List<String> boardImgNm) {
		this.boardImgNm = boardImgNm;
	}




	public String getBoardContent() {
		return boardContent;
	}




	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}




	public List<BoardAttachment> getBoardAtList() {
		return boardAtList;
	}




	public void setBoardAtList(List<BoardAttachment> boardAtList) {
		this.boardAtList = boardAtList;
	}




	public Timestamp getModifyDate() {
		return modifyDate;
	}




	public void setModifyDate(Timestamp modifyDate) {
		this.modifyDate = modifyDate;
	}




	public List<BoardAttachment> getAtList() {
		return atList;
	}




	public void setAtList(List<BoardAttachment> atList) {
		this.atList = atList;
	}




	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardReadCount=" + boardReadCount
				+ ", boardCreateDate=" + boardCreateDate + ", boardModifyDate=" + boardModifyDate + ", boardTypeNm="
				+ boardTypeNm + ", boardWarn=" + boardWarn + ", memNo=" + memNo + ", memNm=" + memNm + ", boardImgUrl="
				+ boardImgUrl + ", boardImgNm=" + boardImgNm + ", boardContent=" + boardContent + ", boardAtList="
				+ boardAtList + ", modifyDate=" + modifyDate + ", atList=" + atList + "]";
	}




	


	







	
	
	
}
