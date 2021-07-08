package edu.kh.coja.blog.model.vo;

import java.sql.Date;

public class BlogPost {
	
	private int pstNo ;
	private String pstTitle ;
	private String pstCnt;
	private int pstCount;
	private Date pstCreateDt;
	private Date pstModifyDt;
	private String pstStatus;
	private String pstBox;
	private int pstWarn;
	
	
	
	
	
	
	
	
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






	public BlogPost(int pstNo, String pstTitle, String pstCnt, int pstCount, Date pstCreateDt, Date pstModifyDt,
			String pstStatus, String pstBox, int pstWarn) {
		super();
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
	
	
	

}
