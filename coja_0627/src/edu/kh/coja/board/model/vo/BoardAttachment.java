package edu.kh.coja.board.model.vo;

import java.sql.Date;

public class BoardAttachment {
	private int boardImgNo;
	private String boardImgUrl;
	private String boardImgNm;
	private Date boardImgDt;
	
	
	public int getBoardImgNo() {
		return boardImgNo;
	}
	public void setBoardImgNo(int boardImgNo) {
		this.boardImgNo = boardImgNo;
	}
	public String getBoardImgUrl() {
		return boardImgUrl;
	}
	public void setBoardImgUrl(String boardImgUrl) {
		this.boardImgUrl = boardImgUrl;
	}
	public String getBoardImgNm() {
		return boardImgNm;
	}
	public void setBoardImgNm(String boardImgNm) {
		this.boardImgNm = boardImgNm;
	}
	public Date getBoardImgDt() {
		return boardImgDt;
	}
	public void setBoardImgDt(Date boardImgDt) {
		this.boardImgDt = boardImgDt;
	}
	
	
	@Override
	public String toString() {
		return "Attachment [boardImgNo=" + boardImgNo + ", boardImgUrl=" + boardImgUrl + ", boardImgNm=" + boardImgNm
				+ ", boardImgDt=" + boardImgDt + "]";
	}

	
}


