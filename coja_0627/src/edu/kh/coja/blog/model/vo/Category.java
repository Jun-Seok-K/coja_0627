package edu.kh.coja.blog.model.vo;

public class Category {

	private int ctNo;
	private String ctStatus;
	private int memNo;
	private String ctNm;
	
	public Category() { }

	public Category(int ctNo, String ctStatus, int memNo, String ctNm) {
		super();
		this.ctNo = ctNo;
		this.ctStatus = ctStatus;
		this.memNo = memNo;
		this.ctNm = ctNm;
	}
	
	public Category(int ctNo, String ctNm) {
		super();
		this.ctNo = ctNo;
		this.ctNm = ctNm;
	}

	public int getCtNo() {
		return ctNo;
	}

	public void setCtNo(int ctNo) {
		this.ctNo = ctNo;
	}

	public String getCtStatus() {
		return ctStatus;
	}

	public void setCtStatus(String ctStatus) {
		this.ctStatus = ctStatus;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getCtNm() {
		return ctNm;
	}

	public void setCtNm(String ctNm) {
		this.ctNm = ctNm;
	}

	@Override
	public String toString() {
		return "Category [ctNo=" + ctNo + ", ctStatus=" + ctStatus + ", memNo=" + memNo + ", ctNm=" + ctNm + "]";
	}
	
}
