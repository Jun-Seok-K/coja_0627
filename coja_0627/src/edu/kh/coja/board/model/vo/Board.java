package edu.kh.coja.board.model.vo;

import java.sql.Date;
import java.util.List;

import edu.kh.coja.board.model.vo.BoardAttachment;

public class Board {

	private int boardNo;
	private String boardTitle;
	private int boardReadCount;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private String boardType;
	private int memNo;
	
	
	// 목록 조회 시 하나만 조회되지만,
	// 상세 조회 시 여러 개가 조회 될 수 있기 때문에 List로 선언
	private List<String> boardFilePath;
	private List<String> boardFileName;
	
	
	// 상세조회에 필요한 필드
	private String boardContent;		//글 내용
	private List<BoardAttachment> boardAtList;	// 게시글에 첨부된 파일(이미지) 목록
	
	
	public Board() {}


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


	public String getBoardType() {
		return boardType;
	}


	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public List<String> getBoardFilePath() {
		return boardFilePath;
	}


	public void setBoardFilePath(List<String> boardFilePath) {
		this.boardFilePath = boardFilePath;
	}


	public List<String> getBoardFileName() {
		return boardFileName;
	}


	public void setBoardFileName(List<String> boardFileName) {
		this.boardFileName = boardFileName;
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


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardReadCount=" + boardReadCount
				+ ", boardCreateDate=" + boardCreateDate + ", boardModifyDate=" + boardModifyDate + ", boardType="
				+ boardType + ", memNo=" + memNo + ", boardFilePath=" + boardFilePath + ", boardFileName="
				+ boardFileName + ", boardContent=" + boardContent + ", boardAtList=" + boardAtList + "]";
	}
	
	
	
	
	
	
}
