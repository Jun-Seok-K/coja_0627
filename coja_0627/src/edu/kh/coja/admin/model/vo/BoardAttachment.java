package edu.kh.coja.admin.model.vo;

import java.sql.Date;

public class BoardAttachment {
	private int boardImgNo;
	private String boardImgUrl;
	private String boardImgNm;
	private int boardNo;
	private int boardImgLevel;
	
	
	public BoardAttachment() {}


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


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getBoardImgLevel() {
		return boardImgLevel;
	}


	public void setBoardImgLevel(int boardImgLevel) {
		this.boardImgLevel = boardImgLevel;
	}


	@Override
	public String toString() {
		return "BoardAttachment [boardImgNo=" + boardImgNo + ", boardImgUrl=" + boardImgUrl + ", boardImgNm="
				+ boardImgNm + ", boardNo=" + boardNo + ", boardImgLevel=" + boardImgLevel + "]";
	}
	
	

	
}


