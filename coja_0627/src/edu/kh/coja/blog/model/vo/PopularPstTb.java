package edu.kh.coja.blog.model.vo;

import java.sql.Date;

public class PopularPstTb {
	
	private int memNo;
	private String memNm;
	private String blogNm;
	private int pstNo ;
	private String pstTitle ;
	private String pstCnt;
	private int pstCount;
	private Date pstCreateDt;
	private Date pstModifyDt;
	private String pstStatus;
	private String pstBox;
	private int pstWarn;
	
	
	public PopularPstTb() {
	}
	
	public PopularPstTb(int memNo, String memNm, String blogNm, int pstNo, String pstTitle, String pstCnt, int pstCount,
			Date pstCreateDt, Date pstModifyDt, String pstStatus, String pstBox, int pstWarn) {
		super();
		this.memNo = memNo;
		this.memNm = memNm;
		this.blogNm = blogNm;
		this.pstNo = pstNo;
		this.pstTitle = pstTitle;
		this.pstCnt = pstCnt;
		this.pstCount = pstCount;
		this.pstCreateDt = pstCreateDt;
		this.pstModifyDt = pstModifyDt;
		this.pstStatus = pstStatus;
		this.pstBox = pstBox;
		this.pstWarn = pstWarn;
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

	public String getBlogNm() {
		return blogNm;
	}

	public void setBlogNm(String blogNm) {
		this.blogNm = blogNm;
	}

	public int getPstNo() {
		return pstNo;
	}

	public void setPstNo(int pstNo) {
		this.pstNo = pstNo;
	}

	public String getPstTitle() {
		return pstTitle;
	}

	public void setPstTitle(String pstTitle) {
		this.pstTitle = pstTitle;
	}

	public String getPstCnt() {
		return pstCnt;
	}

	public void setPstCnt(String pstCnt) {
		this.pstCnt = pstCnt;
	}

	public int getPstCount() {
		return pstCount;
	}

	public void setPstCount(int pstCount) {
		this.pstCount = pstCount;
	}

	public Date getPstCreateDt() {
		return pstCreateDt;
	}

	public void setPstCreateDt(Date pstCreateDt) {
		this.pstCreateDt = pstCreateDt;
	}

	public Date getPstModifyDt() {
		return pstModifyDt;
	}

	public void setPstModifyDt(Date pstModifyDt) {
		this.pstModifyDt = pstModifyDt;
	}

	public String getPstStatus() {
		return pstStatus;
	}

	public void setPstStatus(String pstStatus) {
		this.pstStatus = pstStatus;
	}

	public String getPstBox() {
		return pstBox;
	}

	public void setPstBox(String pstBox) {
		this.pstBox = pstBox;
	}

	public int getPstWarn() {
		return pstWarn;
	}

	public void setPstWarn(int pstWarn) {
		this.pstWarn = pstWarn;
	}

	
	
	@Override
	public String toString() {
		return "PopularPstTb [memNo=" + memNo + ", memNm=" + memNm + ", blogNm=" + blogNm + ", pstNo=" + pstNo
				+ ", pstTitle=" + pstTitle + ", pstCnt=" + pstCnt + ", pstCount=" + pstCount + ", pstCreateDt="
				+ pstCreateDt + ", pstModifyDt=" + pstModifyDt + ", pstStatus=" + pstStatus + ", pstBox=" + pstBox
				+ ", pstWarn=" + pstWarn + "]";
	}
	
	
	
	
	
	
	
}