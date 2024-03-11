package com.ys.movie.search;

public class SearchVO {

	private String keyword;
	private int tag_no;
	private int start;
	private int end;
	private int page;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getTag_no() {
		return tag_no;
	}

	public void setTag_no(int tag_no) {
		this.tag_no = tag_no;
	}

	public void setStartEnd(int page, int count) {
		start = 1 + (page - 1) * count;
		end = page * count;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "SearchVO [keyword=" + keyword + ", tag_no=" + tag_no + ", start=" + start + ", end=" + end + ", page="
				+ page + "]";
	}

}
