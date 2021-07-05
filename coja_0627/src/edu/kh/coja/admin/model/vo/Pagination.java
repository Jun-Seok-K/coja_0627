package edu.kh.coja.admin.model.vo;


// 페이징 처리 객체
public class Pagination {

	private int currentPage;		// 목록상 현재 페이지
	private int listCount;			// 게시글 전체 수
	///위에 두개는 필수!중요
	
	private int limit = 10;			// 한 페이지에 보여질 게시글 (수업에선 임의로 10) 
	private int pageSize = 10;		// 보여질 페이지 번호 개수 (수업에선 임의로 10)
	
	private int maxPage;			// 게시글 목록의 마지막 페이지 번호
	private int startPage;			// 보여지는 페이지 번호 중 시작 번호 ( << < 11 12 13 14 ... 20 > >> 에서 11)
	private int endPage;			// 보여지는 페이지 번호 중 끝 번호 ( 얘는 위에서 20)
	
	private int prevPage;			// 이전 페이지 번호 목록 중 끝 번호 (위에서 10)
	private int nextPage;			// 다음 페이지 번호 목록 중 시작 번호(21)
	
	private int boardType;			// 게시판 타입 번호
	private String boardName;		// 게시판 이름
	
	
	
	/// 11개의 필드 중 4개만 받음... 그럼 나머지는? 밑에 makePagination() 으로 받아낼거양
	public Pagination(int currentPage, int listCount, int boardType, String boardName) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.boardType = boardType;
		this.boardName = boardName;
		
		makePagination(); 
	}

	public Pagination(int currentPage, int listCount) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		
		makePagination();
	}


	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		
		makePagination();
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
		
		makePagination();  // listCount가 변하면 계산 다시 해야하니까!
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
		
		makePagination(); // 얘도 변하면 계산 다시 해야함
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		
		makePagination(); // 얘도
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}



	@Override
	public String toString() {
		return "Pagination [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
				+ ", pageSize=" + pageSize + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", boardType=" + boardType
				+ ", boardName=" + boardName + "]";
	}
	
	
	
	
	// 페이징 처리에 필요한 값을 계산하는 메소드
	private void makePagination() {
		/// 객체안에 들어가는 값들을 저장할 메소드..?
		
		
		// maxPage == 마지막 페이지 == 총 페이지 수
		maxPage = (int)Math.ceil( (double)listCount/limit );
		/// 글 개수가 총 500 일때는 50 나옴 / 499 개일때도 50 / 501개면 51 나옴
		
		
		// startPage == 페이지 번호 목록 시작 번호  ex) 1, 11, 21, 31 .....
		startPage = (currentPage - 1) / pageSize * pageSize + 1;
		// 현재 페이지 : 16
		// 11 12 13 14 15 16 17 18 19 20 
		// (16-1)/10/*10+1 => 11
		
		
		// endPage == 페이지 목록 끝 번호 ex) 10, 20, 30, 40...
		endPage = startPage + pageSize - 1;
		
		// ** 보여지는 페이지 번호 목록의 끝 번호가 maxPage 보다 클 경우		
		// 현재페이지 : 52
		// 페이지 번호 목록 : 51 52 53 ... 60 
		// 끝 페이지 : 55 인 경우...?!!! -> end 페이지는 55까지만 와야하기 때문에 이걸 지정하는 if 문 만들기
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		// 이전, 다음 페이지 번호 목록으로 이동
		if(currentPage<10)	prevPage = 1;	// 이런경우  < 이 화살표 필요가 없음!
		else				prevPage = (currentPage - 1 ) / pageSize * pageSize ;	
		
		nextPage = (currentPage + pageSize - 1) / pageSize * pageSize + 1;
		
		if(nextPage > maxPage) {
			nextPage = maxPage;
		}
		
	}
	
	
	
	
	
}
