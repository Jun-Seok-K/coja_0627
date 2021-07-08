package edu.kh.coja.member.model.vo;

import java.sql.Date;

public class Member {

	private int memNo;
	private String memId;
	private String memPw;
	private String memNm;
	private String memNick;
	private String memEmail;
	private Date memEnrollDt;
	private String memWorkExp;
	private int memExpYr;
	private int memWarningPoint;
	private String memStatus;
	private String memGrade;

	public Member() {
	}

	// 회원가입용 생성자
	public Member(String memId, String memPw, String memNm, String memNick, String memEmail, String memWorkExp,
			int memExpYr) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memNm = memNm;
		this.memNick = memNick;
		this.memEmail = memEmail;
		this.memWorkExp = memWorkExp;
		this.memExpYr = memExpYr;
	}

	public Member(int memNo, String memId, String memPw, String memNm, String memNick, String memEmail,
			Date memEnrollDt, String memWorkExp, int memExpYr, int memWarningPoint, String memStatus, String memGrade) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPw = memPw;
		this.memNm = memNm;
		this.memNick = memNick;
		this.memEmail = memEmail;
		this.memEnrollDt = memEnrollDt;
		this.memWorkExp = memWorkExp;
		this.memExpYr = memExpYr;
		this.memWarningPoint = memWarningPoint;
		this.memStatus = memStatus;
		this.memGrade = memGrade;
	}
	
	//admin 로그인용 
	public Member(int memNo, String memId, String memNm, String memNick, String memEmail, Date memEnrollDt,
			String memWorkExp, int memExpYr, int memWarningPoint, String memStatus, String memGrade) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memNm = memNm;
		this.memNick = memNick;
		this.memEmail = memEmail;
		this.memEnrollDt = memEnrollDt;
		this.memWorkExp = memWorkExp;
		this.memExpYr = memExpYr;
		this.memWarningPoint = memWarningPoint;
		this.memStatus = memStatus;
		this.memGrade = memGrade;
	}
	
	
	
	
	public int getMemNo() {
		return memNo;
	}
	
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public Date getMemEnrollDt() {
		return memEnrollDt;
	}

	public void setMemEnrollDt(Date memEnrollDt) {
		this.memEnrollDt = memEnrollDt;
	}

	public String getMemWorkExp() {
		return memWorkExp;
	}

	public void setMemWorkExp(String memWorkExp) {
		this.memWorkExp = memWorkExp;
	}

	public int getMemExpYr() {
		return memExpYr;
	}

	public void setMemExpYr(int memExpYr) {
		this.memExpYr = memExpYr;
	}

	public int getMemWarningPoint() {
		return memWarningPoint;
	}

	public void setMemWarningPoint(int memWarningPoint) {
		this.memWarningPoint = memWarningPoint;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	public String getMemGrade() {
		return memGrade;
	}

	public void setMemGrade(String memGrade) {
		this.memGrade = memGrade;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPw=" + memPw + ", memNm=" + memNm + ", memNick="
				+ memNick + ", memEmail=" + memEmail + ", memEnrollDt=" + memEnrollDt + ", memWorkExp=" + memWorkExp
				+ ", memExpYr=" + memExpYr + ", memWarningPoint=" + memWarningPoint + ", memStatus=" + memStatus
				+ ", memGrade=" + memGrade + "]";
	}

}
