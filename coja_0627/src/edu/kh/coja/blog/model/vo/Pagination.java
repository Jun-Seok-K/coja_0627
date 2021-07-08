package edu.kh.coja.blog.model.vo;


// 페이징 처리 객체
public class Pagination {

	private int currentPage;		
	private int listCount;			
	
	private int limit = 10;			
	private int pageSize = 10;		
	
	private int maxPage;			
	private int startPage;			
	private int endPage;			
	
	private int prevPage;			
	private int nextPage;			
	
	private int blogType;			
	private String categoryName;
	
	
	public Pagination(int currentPage, int listCount, int boardType, String boardName) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.blogType = boardType;
		this.categoryName = boardName;
		
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
		
		makePagination();
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
		
		makePagination();
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

	public int getBlogType() {
		return blogType;
	}

	public void setBlogType(int boardType) {
		this.blogType = blogType;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String boardName) {
		this.categoryName = categoryName;
	}



	@Override
	public String toString() {
		return "Pagination [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
				+ ", pageSize=" + pageSize + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", blogType=" + blogType
				+ ", categoryName=" + categoryName + "]";
	}
	
	
	private void makePagination() {
		maxPage = (int)Math.ceil( (double)listCount/limit );

		startPage = (currentPage - 1) / pageSize * pageSize + 1;		
		
		endPage = startPage + pageSize - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(currentPage<10)	prevPage = 1;
		else				prevPage = (currentPage - 1 ) / pageSize * pageSize ;
		
		nextPage = (currentPage + pageSize - 1) / pageSize * pageSize + 1;
		
		if(nextPage > maxPage) {
			nextPage = maxPage;
		}
		
	}
	
}
