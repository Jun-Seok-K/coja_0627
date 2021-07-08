package edu.kh.coja.admin.model.vo;

import java.sql.Date;
import java.util.List;

public class Reports {
	
	// semi 프로젝트의 Board vo 참고해서 만들면 됨....
	// readCount, modifyDt, boardStatus만 뺴고....
	private int rptNo;
	private String memNm;
	private String rptTitle;
	private String rptCnt;
	private Date rptCreateDt;
	private String rptTypeNo;
	private int memNo;
	
	// 목록 조회 시 하나만 조회되지만,
	// 상세 조회 시 여러 개가 조회 될 수 있기 때문에 List로 선언
	private List<String> reportsFilePath;
	private List<String> reportsFileName;
	
	// 상세조회에 필요한 필드
	// 삽입 시 필요한 필드 추가
	private int categoryCode;
	
	public Reports() {}
	



	public Reports(String memNm, String rptTitle, String rptCnt, Date rptCreateDt, String rptTypeNo, int memNo) {
		super();
		this.memNm = memNm;
		this.rptTitle = rptTitle;
		this.rptCnt = rptCnt;
		this.rptCreateDt = rptCreateDt;
		this.rptTypeNo = rptTypeNo;
		this.memNo = memNo;
	}




	public int getRptNo() {
		return rptNo;
	}

	public void setRptNo(int rptNo) {
		this.rptNo = rptNo;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public String getRptTitle() {
		return rptTitle;
	}

	public void setRptTitle(String rptTitle) {
		this.rptTitle = rptTitle;
	}

	public String getRptCnt() {
		return rptCnt;
	}

	public void setRptCnt(String rptCnt) {
		this.rptCnt = rptCnt;
	}

	public Date getRptCreateDt() {
		return rptCreateDt;
	}

	public void setRptCreateDt(Date rptCreateDt) {
		this.rptCreateDt = rptCreateDt;
	}

	public String getRptTypeNo() {
		return rptTypeNo;
	}

	public void setRptTypeNo(String rptTypeNo) {
		this.rptTypeNo = rptTypeNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public List<String> getReportsFilePath() {
		return reportsFilePath;
	}

	public void setReportsFilePath(List<String> reportsFilePath) {
		this.reportsFilePath = reportsFilePath;
	}

	public List<String> getReportsFileName() {
		return reportsFileName;
	}

	public void setReportsFileName(List<String> reportsFileName) {
		this.reportsFileName = reportsFileName;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	@Override
	public String toString() {
		return "Reports [rptNo=" + rptNo + ", memNm=" + memNm + ", rptTitle=" + rptTitle + ", rptCnt=" + rptCnt
				+ ", rptCreateDt=" + rptCreateDt + ", rptTypeNo=" + rptTypeNo + ", memNo=" + memNo
				+ ", reportsFilePath=" + reportsFilePath + ", reportsFileName=" + reportsFileName + ", categoryCode="
				+ categoryCode + "]";
	}
	
	

	

	
	
	
	}