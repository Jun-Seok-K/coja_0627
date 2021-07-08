package edu.kh.coja.admin.model.vo;

import java.sql.Date;

public class Carousel {
	
	private int crsNo ;
	private String crsURL;
	private String crsNm;
	private Date crsDt;
	private String crsDisplay;
	private int memNo ;
	
	
	public Carousel() {
	}
	
	public Carousel(int crsNo, String crsURL, String crsNm, Date crsDt, String crsDisplay, int memNo) {
		super();
		this.crsNo = crsNo;
		this.crsURL = crsURL;
		this.crsNm = crsNm;
		this.crsDt = crsDt;
		this.crsDisplay = crsDisplay;
		this.memNo = memNo;
	}





	public int getCrsNo() {
		return crsNo;
	}
	public void setCrsNo(int crsNo) {
		this.crsNo = crsNo;
	}
	public String getCrsURL() {
		return crsURL;
	}
	public void setCrsURL(String crsURL) {
		this.crsURL = crsURL;
	}
	public String getCrsNm() {
		return crsNm;
	}
	public void setCrsNm(String crsNm) {
		this.crsNm = crsNm;
	}
	public Date getCrsDt() {
		return crsDt;
	}
	public void setCrsDt(Date crsDt) {
		this.crsDt = crsDt;
	}
	public String getCrsDisplay() {
		return crsDisplay;
	}
	public void setCrsDisplay(String crsDisplay) {
		this.crsDisplay = crsDisplay;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}



	@Override
	public String toString() {
		return "Carousel [crsNo=" + crsNo + ", crsURL=" + crsURL + ", crsNm=" + crsNm + ", crsDt=" + crsDt
				+ ", crsDisplay=" + crsDisplay + ", memNo=" + memNo + "]";
	}
	
	
	
	
	
	
	

}
