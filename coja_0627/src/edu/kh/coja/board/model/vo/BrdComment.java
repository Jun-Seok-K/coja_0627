package edu.kh.coja.board.model.vo;

import java.sql.Date;

public class BrdComment {
	private int brdCmtNo;
	private String brdCmtCnt;
	private Date brdCmtDt;
	private String brdCmtPublic;
	private int brdNo;
	private int memNo;
	private String memNick;
	
	public BrdComment() { }

	public int getBrdCmtNo() {
		return brdCmtNo;
	}

	public void setBrdCmtNo(int brdCmtNo) {
		this.brdCmtNo = brdCmtNo;
	}

	public String getBrdCmtCnt() {
		return brdCmtCnt;
	}

	public void setBrdCmtCnt(String brdCmtCnt) {
		this.brdCmtCnt = brdCmtCnt;
	}

	public Date getBrdCmtDt() {
		return brdCmtDt;
	}

	public void setBrdCmtDt(Date brdCmtDt) {
		this.brdCmtDt = brdCmtDt;
	}

	public String getBrdCmtPublic() {
		return brdCmtPublic;
	}

	public void setBrdCmtPublic(String brdCmtPublic) {
		this.brdCmtPublic = brdCmtPublic;
	}

	public int getBrdNo() {
		return brdNo;
	}

	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	@Override
	public String toString() {
		return "brdComment [brdCmtNo=" + brdCmtNo + ", brdCmtCnt=" + brdCmtCnt + ", brdCmtDt=" + brdCmtDt
				+ ", brdCmtPublic=" + brdCmtPublic + ", brdNo=" + brdNo + ", memNo=" + memNo + ", memNick=" + memNick
				+ "]";
	}
	
	
	
}
