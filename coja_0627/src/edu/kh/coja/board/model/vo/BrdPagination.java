package edu.kh.coja.board.model.vo;

public class BrdPagination {

	private int brdCurrentPage;		// 목록상 현재 페이지
	private int brdListCount;		// 게시글 전체 수
	
	private int brdLimit = 10;		// 한 페이지에 보여질 게시글 수
	private int brdPageSize = 10;	// 보여질 페이지 번호 개수
	
	private int brdMaxPage;			// 게시글 목록의 마지막 페이지 번호
	private int brdStartPage;		// 보여지는 페이지 번호 중 시작 번호
	private int brdEndPage;			// 보여지는 페이지 번호 중 끝 번호
	
	private int brdPrevPage;		// 이전 페이지 번호 목록 중 끝 번호
	private int brdNextPage;		// 다음 페이지 번호 목록 중 시작 번호
	

	public BrdPagination(int brdCurrentPage, int brdListCount) {
		super();
		this.brdCurrentPage = brdCurrentPage;
		this.brdListCount = brdListCount;
		
		makeBrdPagination();
	}



	public int getBrdCurrentPage() {
		return brdCurrentPage;
	}




	public void setBrdCurrentPage(int brdCurrentPage) {
		this.brdCurrentPage = brdCurrentPage;
	}




	public int getBrdListCount() {
		return brdListCount;
	}




	public void setBrdListCount(int brdListCount) {
		this.brdListCount = brdListCount;
	}




	public int getBrdLimit() {
		return brdLimit;
	}




	public void setBrdLimit(int brdLimit) {
		this.brdLimit = brdLimit;
	}




	public int getBrdPageSize() {
		return brdPageSize;
	}




	public void setBrdPageSize(int brdPageSize) {
		this.brdPageSize = brdPageSize;
	}




	public int getBrdMaxPage() {
		return brdMaxPage;
	}




	public void setBrdMaxPage(int brdMaxPage) {
		this.brdMaxPage = brdMaxPage;
	}




	public int getBrdStartPage() {
		return brdStartPage;
	}




	public void setBrdStartPage(int brdStartPage) {
		this.brdStartPage = brdStartPage;
	}




	public int getBrdEndPage() {
		return brdEndPage;
	}




	public void setBrdEndPage(int brdEndPage) {
		this.brdEndPage = brdEndPage;
	}




	public int getBrdPrevPage() {
		return brdPrevPage;
	}




	public void setBrdPrevPage(int brdPrevPage) {
		this.brdPrevPage = brdPrevPage;
	}




	public int getBrdNextPage() {
		return brdNextPage;
	}




	public void setBrdNextPage(int brdNextPage) {
		this.brdNextPage = brdNextPage;
	}


	@Override
	public String toString() {
		return "BrdPagination [brdCurrentPage=" + brdCurrentPage + ", brdListCount=" + brdListCount
				+ ", brdLimit=" + brdLimit + ", brdPageSize=" + brdPageSize + ", brdMaxPage=" + brdMaxPage
				+ ", brdStartPage=" + brdStartPage + ", brdEndPage=" + brdEndPage + ", brdPrevPage="
				+ brdPrevPage + ", brdNextPage=" + brdNextPage + "]";
	}




	// 페이징 처리에 필요한 값을 계산하는 메소드
	private void makeBrdPagination() {
		
		// maxPage == 마지막 페이지 == 총 페이지 수
		
		brdMaxPage = (int)Math.ceil( (double)brdListCount / brdLimit );

		// startPage == 페이지 번호 목록 시작 번호
		//	ex) 1, 11, 21, 31, ....
		brdStartPage = (brdCurrentPage - 1) / brdPageSize * brdPageSize + 1;
		
		// endPage == 페이지 번호 목록 끝 번호
		// ex) 10, 20, 30, 40 ....
		brdEndPage = brdStartPage + brdPageSize - 1;
		
		// ** 보여지는 페이지 번호 목록의 끝 번호가 maxPage보다 클 경우
		
		// 현재 페이지 : 52
		// 페이지 번호 목록 : 51 52 53 54 55
		if(brdEndPage > brdMaxPage) {
			brdEndPage = brdMaxPage;
		}
		
		
		// 이전, 다음 페이지 번호 목록으로 이동
		if(brdCurrentPage < 10)	brdPrevPage = 1;
		else					brdPrevPage = (brdCurrentPage - 1) / brdPageSize * brdPageSize;
		
		brdNextPage = (brdCurrentPage + brdPageSize - 1) / brdPageSize * brdPageSize + 1;
		
		if(brdNextPage > brdMaxPage) {
			brdNextPage = brdMaxPage;
		}
	}
}
