package edu.kh.coja.admin.model.vo;

public class BrdImg {
	private int brdImgNo;
	private String brdImgUrl;
	private String brdImgNm;
	private int brdImgLv;
	private int brdNo;
	
	
	public int getBrdImgNo() {
		return brdImgNo;
	}
	public void setBrdImgNo(int brdImgNo) {
		this.brdImgNo = brdImgNo;
	}
	public String getBrdImgUrl() {
		return brdImgUrl;
	}
	public void setBrdImgUrl(String brdImgUrl) {
		this.brdImgUrl = brdImgUrl;
	}
	public String getBrdImgNm() {
		return brdImgNm;
	}
	public void setBrdImgNm(String brdImgNm) {
		this.brdImgNm = brdImgNm;
	}
	public int getBrdImgLv() {
		return brdImgLv;
	}
	public void setBrdImgLv(int brdImgLv) {
		this.brdImgLv = brdImgLv;
	}
	public int getBrdNo() {
		return brdNo;
	}
	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}
	
	
	@Override
	public String toString() {
		return "BoardAttachment [brdImgNo=" + brdImgNo + ", brdImgUrl=" + brdImgUrl + ", brdImgNm=" + brdImgNm
				+ ", brdImgLv=" + brdImgLv + ", brdNo=" + brdNo + "]";
	}
	

}


