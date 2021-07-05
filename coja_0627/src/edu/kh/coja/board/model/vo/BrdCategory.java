package edu.kh.coja.board.model.vo;

public class BrdCategory {
	
	private String brdType;
	private String brdTypeNm;
	
	public BrdCategory() {}

	
	public String getBrdType() {
		return brdType;
	}

	public void setBrdType(String brdType) {
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
