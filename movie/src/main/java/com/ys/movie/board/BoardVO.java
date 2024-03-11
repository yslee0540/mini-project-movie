package com.ys.movie.board;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.ys.movie.tag.TagVO;

public class BoardVO {

	private int board_no;
	private String content;
	private String writer;
	private String img;
	private int start;
	private int end;
	private int page;
	private List<String> tag;
	private List<TagVO> tagList;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp date;

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

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public List<String> getTag() {
		return tag;
	}

	public void setTag(List<String> tag) {
		this.tag = tag;
	}

	public List<TagVO> getTagList() {
		return tagList;
	}

	public void setTagList(List<TagVO> tagList) {
		this.tagList = tagList;
	}

	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", content=" + content + ", writer=" + writer + ", img=" + img
				+ ", start=" + start + ", end=" + end + ", page=" + page + ", tag=" + tag + ", tagList=" + tagList
				+ ", date=" + date + "]";
	}

}
