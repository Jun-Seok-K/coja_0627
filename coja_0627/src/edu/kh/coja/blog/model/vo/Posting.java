package edu.kh.coja.blog.model.vo;

import java.sql.Date;
import java.util.List;

public class Posting {

	private int pstNo;
	private String pstTitle;
	private String pstCnt;
	private int pstCount;
	private Date pstCreateDt;
	private Date pstModifyDt;
	private String pstStatus;
	private String pstBox;
	private int pstWarn;
	private int memNo;
	private int pstCtNo;
	
	private String memNm;
	private String ctNm;
	
	private List<String> filePath;
	private List<String> fileName;
	
	public Posting() { }

	public Posting(int pstNo, String pstTitle, String pstCnt, int pstCount, Date pstCreateDt, Date pstModifyDt,
			String pstStatus, String pstBox, int pstWarn, int memNo, int pstCtNo, String memNm, String ctNm,
			List<String> filePath, List<String> fileName) {
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
		this.memNo = memNo;
		this.pstCtNo = pstCtNo;
		this.memNm = memNm;
		this.ctNm = ctNm;
		this.filePath = filePath;
		this.fileName = fileName;
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

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getPstCtNo() {
		return pstCtNo;
	}

	public void setPstCtNo(int pstCtNo) {
		this.pstCtNo = pstCtNo;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public String getCtNm() {
		return ctNm;
	}

	public void setCtNm(String ctNm) {
		this.ctNm = ctNm;
	}

	public List<String> getFilePath() {
		return filePath;
	}

	public void setFilePath(List<String> filePath) {
		this.filePath = filePath;
	}

	public List<String> getFileName() {
		return fileName;
	}

	public void setFileName(List<String> fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "Posting [pstNo=" + pstNo + ", pstTitle=" + pstTitle + ", pstCnt=" + pstCnt + ", pstCount=" + pstCount
				+ ", pstCreateDt=" + pstCreateDt + ", pstModifyDt=" + pstModifyDt + ", pstStatus=" + pstStatus
				+ ", pstBox=" + pstBox + ", pstWarn=" + pstWarn + ", memNo=" + memNo + ", pstCtNo=" + pstCtNo
				+ ", memNm=" + memNm + ", ctNm=" + ctNm + ", filePath=" + filePath + ", fileName=" + fileName + "]";
	}
	
	
	
}
