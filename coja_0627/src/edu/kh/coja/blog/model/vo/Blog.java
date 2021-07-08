package edu.kh.coja.blog.model.vo;

public class Blog {
	
	private int memNo;
	private String blogNm;
	private String blogAddr;
	private int blogVisit;
	private String blogPublic;
	private String blogIntro;
	private int ctNo;
	private String ctStatus;
	private String ctNm;
	
	
	public Blog() { }


	public Blog(int memNo, String blogNm, String blogAddr, int blogVisit, String blogPublic, String blogIntro, int ctNo,
			String ctStatus, String ctNm) {
		super();
		this.memNo = memNo;
		this.blogNm = blogNm;
		this.blogAddr = blogAddr;
		this.blogVisit = blogVisit;
		this.blogPublic = blogPublic;
		this.blogIntro = blogIntro;
		this.ctNo = ctNo;
		this.ctStatus = ctStatus;
		this.ctNm = ctNm;
	}


	public Blog(int memNo, String blogNm, String blogAddr, String blogIntro) {
		super();
		this.memNo = memNo;
		this.blogNm = blogNm;
		this.blogAddr = blogAddr;
		this.blogIntro = blogIntro;
	}


	public Blog(int memNo, String blogNm, String blogAddr, String blogPublic, String blogIntro) {
		super();
		this.memNo = memNo;
		this.blogNm = blogNm;
		this.blogAddr = blogAddr;
		this.blogPublic = blogPublic;
		this.blogIntro = blogIntro;
	}
	

	public Blog(int memNo, String blogNm, String blogAddr, int blogVisit, String blogPublic, String blogIntro) {
		super();
		this.memNo = memNo;
		this.blogNm = blogNm;
		this.blogAddr = blogAddr;
		this.blogVisit = blogVisit;
		this.blogPublic = blogPublic;
		this.blogIntro = blogIntro;
	}

	
	
	public Blog(int ctNo, String ctNm) {
		super();
		this.ctNo = ctNo;
		this.ctNm = ctNm;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public String getBlogNm() {
		return blogNm;
	}


	public void setBlogNm(String blogNm) {
		this.blogNm = blogNm;
	}


	public String getBlogAddr() {
		return blogAddr;
	}


	public void setBlogAddr(String blogAddr) {
		this.blogAddr = blogAddr;
	}


	public int getBlogVisit() {
		return blogVisit;
	}


	public void setBlogVisit(int blogVisit) {
		this.blogVisit = blogVisit;
	}


	public String getBlogPublic() {
		return blogPublic;
	}


	public void setBlogPublic(String blogPublic) {
		this.blogPublic = blogPublic;
	}


	public String getBlogIntro() {
		return blogIntro;
	}


	public void setBlogIntro(String blogIntro) {
		this.blogIntro = blogIntro;
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


	public String getCtNm() {
		return ctNm;
	}


	public void setCtNm(String ctNm) {
		this.ctNm = ctNm;
	}


	@Override
	public String toString() {
		return "Blog [memNo=" + memNo + ", blogNm=" + blogNm + ", blogAddr=" + blogAddr + ", blogVisit=" + blogVisit
				+ ", blogPublic=" + blogPublic + ", blogIntro=" + blogIntro + ", ctNo=" + ctNo + ", ctStatus="
				+ ctStatus + ", ctNm=" + ctNm + "]";
	}


}
