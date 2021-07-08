package edu.kh.coja.admin.model.vo;

import java.sql.Timestamp;
import java.util.List;


public class Brd {

	private int brdNo;
	private String brdTitle;
	private int brdReadCount;
	private Timestamp brdCreateDt;
	private Timestamp brdModifyDt;
	private String brdType;
	private String brdTypeNm;
	private int memNo;
	private String memNick;
	private int brdLike;
	private int chk; // 로그인한 회원이 좋아요를 눌렀는지 안눌렀는지 확인 
	private int brdCmtCount;
	
	
	// 상세 조회 시 여러 개가 조회 될 수 있기 때문에 List로 선언
	private List<String> brdImgUrl;
	private List<String> brdImgNm;
	
	
	// 상세조회에 필요한 필드
	private String brdCnt;		//글 내용
	//private List<BrdImg> brdImgList;	// 게시글에 첨부된 파일(이미지) 목록
	private String memImgUrl; // 작성자 프로필 사진
	
	
	public Brd() {}
	
	
	
	
	
	


	public Brd(int brdNo, String brdTitle, int brdReadCount, Timestamp brdCreateDt,  String brdTypeNm,
			int memNo, String memNick, String brdCnt) {
		super();
		this.brdNo = brdNo;
		this.brdTitle = brdTitle;
		this.brdReadCount = brdReadCount;
		this.brdCreateDt = brdCreateDt;
		this.brdTypeNm = brdTypeNm;
		this.memNo = memNo;
		this.memNick = memNick;
		this.brdCnt = brdCnt;
	}








	public int getBrdNo() {
		return brdNo;
	}


	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}


	public String getBrdTitle() {
		return brdTitle;
	}


	public void setBrdTitle(String brdTitle) {
		this.brdTitle = brdTitle;
	}


	public int getBrdReadCount() {
		return brdReadCount;
	}


	public void setBrdReadCount(int brdReadCount) {
		this.brdReadCount = brdReadCount;
	}


	public Timestamp getBrdCreateDt() {
		return brdCreateDt;
	}


	public void setBrdCreateDt(Timestamp brdCreateDt) {
		this.brdCreateDt = brdCreateDt;
	}


	public Timestamp getBrdModifyDt() {
		return brdModifyDt;
	}


	public void setBrdModifyDt(Timestamp brdModifyDt) {
		this.brdModifyDt = brdModifyDt;
	}


	public String getBrdType() {
		return brdType;
	}


	public void setBrdType(String brdType) {
		this.brdType = brdType;
	}


	public String getBrdTypeNm() {
		return brdTypeNm;
	}


	public void setBrdTypeNm(String brdTypeNm) {
		this.brdTypeNm = brdTypeNm;
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


	public int getBrdLike() {
		return brdLike;
	}


	public void setBrdLike(int brdLike) {
		this.brdLike = brdLike;
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


	public String getBrdCnt() {
		return brdCnt;
	}


	public void setBrdCnt(String brdCnt) {
		this.brdCnt = brdCnt;
	}

/*
	public List<BrdImg> getBrdImgList() {
		return brdImgList;
	}


	public void setBrdImgList(List<BrdImg> brdImgList) {
		this.brdImgList = brdImgList;
	}
*/

	public String getMemImgUrl() {
		return memImgUrl;
	}


	public void setMemImgUrl(String memImgUrl) {
		this.memImgUrl = memImgUrl;
	}


	public int getChk() {
		return chk;
	}


	public void setChk(int chk) {
		this.chk = chk;
	}


	public int getBrdCmtCount() {
		return brdCmtCount;
	}


	public void setBrdCmtCount(int brdCmtCount) {
		this.brdCmtCount = brdCmtCount;
	}


	@Override
	public String toString() {
		return "Board [brdNo=" + brdNo + ", brdTitle=" + brdTitle + ", brdReadCount=" + brdReadCount + ", brdCreateDt="
				+ brdCreateDt + ", brdModifyDt=" + brdModifyDt + ", brdType=" + brdType + ", brdTypeNm=" + brdTypeNm
				+ ", memNo=" + memNo + ", memNick=" + memNick + ", brdLike=" + brdLike + ", chk=" + chk
				+ ", brdCmtCount=" + brdCmtCount + ", brdImgUrl=" + brdImgUrl + ", brdImgNm=" + brdImgNm + ", brdCnt="
				+ brdCnt 
				//+ ", brdImgList=" + brdImgList 
				+ ", memImgUrl=" + memImgUrl + "]";
	}



	



}
