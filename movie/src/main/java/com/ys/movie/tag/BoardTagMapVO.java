package com.ys.movie.tag;

public class BoardTagMapVO {

	private int map_no;
	private int board_no;
	private int tag_no;

	public int getMap_no() {
		return map_no;
	}

	public void setMap_no(int map_no) {
		this.map_no = map_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getTag_no() {
		return tag_no;
	}

	public void setTag_no(int tag_no) {
		this.tag_no = tag_no;
	}

	@Override
	public String toString() {
		return "BoardTagMapVO [map_no=" + map_no + ", board_no=" + board_no + ", tag_no=" + tag_no + "]";
	}

}
