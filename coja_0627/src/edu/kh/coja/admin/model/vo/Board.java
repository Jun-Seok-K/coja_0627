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
	
	
   private List<String> brdImgUrl;
   private List<String> brdImgNm;

	// 상세조회에 필요한 필드
	private String boardContent;		//글 내용
	private List<BrdImg> brdImgList;	// 게시글에 첨부된 파일(이미지) 목록
	private Timestamp modifyDate;	// 마지막 작성일
	   
	
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

	public String getBoardTypeNm() {
		return boardTypeNm;
	}

	public void setBoardTypeNm(String boardTypeNm) {
		this.boardTypeNm = boardTypeNm;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public Date getBoardCreateDate() {
		return boardCreateDate;
	}

	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}

	public int getBoardWarn() {
		return boardWarn;
	}

	public void setBoardWarn(int boardWarn) {
		this.boardWarn = boardWarn;
	}

	public int getBoardReadCount() {
		return boardReadCount;
	}

	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}

	public Date getBoardModifyDate() {
		return boardModifyDate;
	}

	public void setBoardModifyDate(Date boardModifyDate) {
		this.boardModifyDate = boardModifyDate;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public List<String> getBrdImgUrl() {
		return brdImgUrl;
	}

	public void setBrdImgUrl(List<String> brdImgUrl) {
		this.brdImgUrl = brdImgUrl;
	}

	public List<String> getBrdImgNm() {
		return brdImgNm;
	}

	public void setBrdImgNm(List<String> brdImgNm) {
		this.brdImgNm = brdImgNm;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public List<BrdImg> getBrdImgList() {
		return brdImgList;
	}

	public void setBrdImgList(List<BrdImg> brdImgList) {
		this.brdImgList = brdImgList;
	}

	public Timestamp getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Timestamp modifyDate) {
		this.modifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTypeNm=" + boardTypeNm + ", boardTitle=" + boardTitle + ", memNm="
				+ memNm + ", boardCreateDate=" + boardCreateDate + ", boardWarn=" + boardWarn + ", boardReadCount="
				+ boardReadCount + ", boardModifyDate=" + boardModifyDate + ", memNo=" + memNo + ", brdImgUrl="
				+ brdImgUrl + ", brdImgNm=" + brdImgNm + ", boardContent=" + boardContent + ", brdImgList=" + brdImgList
				+ ", modifyDate=" + modifyDate + "]";
	}






	


	







	
	
	
}
