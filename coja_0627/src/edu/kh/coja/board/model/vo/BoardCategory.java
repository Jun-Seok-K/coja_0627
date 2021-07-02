package edu.kh.coja.board.model.vo;

public class BoardCategory {
	
	private int brdType;
	private String brdTypeNm;
	
	public BoardCategory() {}

	
	public int getBrdType() {
		return brdType;
	}

	public void setBrdType(int brdType) {
		this.brdType = brdType;
	}

	public String getBrdTypeNm() {
		return brdTypeNm;
	}

	public void setBrdTypeNm(String brdTypeNm) {
		this.brdTypeNm = brdTypeNm;
	}


	@Override
	public String toString() {
		return "BoardCategory [brdType=" + brdType + ", brdTypeNm=" + brdTypeNm + "]";
	}

}
