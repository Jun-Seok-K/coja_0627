package edu.kh.coja.blog.model.vo;

public class PostCt {

	private int pstCtNo;
	private String pstCtNm;
	
	public PostCt() {
		// TODO Auto-generated constructor stub
	}

	public PostCt(int pstCtNo, String pstCtNm) {
		super();
		this.pstCtNo = pstCtNo;
		this.pstCtNm = pstCtNm;
	}

	public int getPstCtNo() {
		return pstCtNo;
	}

	public void setPstCtNo(int pstCtNo) {
		this.pstCtNo = pstCtNo;
	}

	public String getPstCtNm() {
		return pstCtNm;
	}

	public void setPstCtNm(String pstCtNm) {
		this.pstCtNm = pstCtNm;
	}

	@Override
	public String toString() {
		return "PostCt [pstCtNo=" + pstCtNo + ", pstCtNm=" + pstCtNm + "]";
	}
	
}
