package com.db.mapper;

import com.db.model.Criteria;

public class PageMakerDTO {

	// 시작
	private int startPage;

	// 끝
	private int endPage;
	// 이전 or 다음 페이지 존재유무
	private boolean prev, next;
	// 전체 게시물 수
	private int total;
	// 페이지와 페이지 게시물 표시수 정보
	private Criteria cri;

	// 생성자
	public PageMakerDTO(Criteria cri, int total) {

		this.cri = cri;
		this.total = total;
		// 마지막
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

		// 시작
		this.startPage = this.endPage - 9;

		// 전체 마지막
		int realEnd = (int) (Math.ceil(total * 1.0 / cri.getAmount()));

		// 전체 마지막페이지 값이 마지막페이지(10) 보다 작은경우 보이는 페이지 값으로 조정
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		// 시작페이지 값이 1보다 큰 경우 true
		this.prev = this.startPage > 1;
		// 마지막페이지 값이 1보다 큰 경우 true
		this.next = this.endPage < realEnd;

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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMakerDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}

}
