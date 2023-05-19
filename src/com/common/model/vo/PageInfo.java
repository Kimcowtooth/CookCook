package com.common.model.vo;

public class PageInfo {
	// PageInfo class field
	private int listCount; // 현재 총 게시글 개수
	private int currentPage; // 현재 페이지(즉,사용자가 요청한 페이지)
	private int pageLimit = 10; // 페이지 하단에 보여질 페이징바의 페이지 최대 개수
	private int boardLimit = 10; // 한 페이지에 보여질 게시글의 최대 개수 (몇개 단위씩 보여질건지)
	private int maxPage; // 가장 마지막 페이지가 몇번페이지 인지 (총 페이지 수)
	private int startPage; // 페이지 하단에 보여질 페이징바의 시작수
	private int endPage; // 페이지 하단에 보여질 페이징바의 끝수

	// PageInfo class method

	// 지정한 페이지에 시작 게시글의 ROWNUM 반환 method
	public int startBoard() {
		int startBoard = 0;
		if (boardLimit == 10) {
			startBoard = (currentPage - 1) * 10 + 1;
		}
		return startBoard;
	}

	// 지정한 페이지에 마지막 게시글의 ROWNUM 반환 method
	public int endBoard() {
		int endBoard = 0;
		if (boardLimit == 10) {
			endBoard = currentPage * 10;
			if (endBoard > listCount) {
				return listCount;
			}
		}
		return endBoard;
	}

	// PageInfo class toString
	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}

	// PageInfo class constructor
	// 게시글의 갯수와 현재 게시판 번호를 받는 생성자
	public PageInfo(int listCount, int currentPage) {
		super();
		this.currentPage = currentPage;
		maxPage = (int) Math.ceil((double) listCount / pageLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
	}

	public PageInfo() {
		super();
	}

	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	// Attachment class getter/setter

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
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
}
