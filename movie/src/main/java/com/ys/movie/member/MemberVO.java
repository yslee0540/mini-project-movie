package com.ys.movie.member;

public class MemberVO {

	private int no;
	private int date;
	private String day;
	private String time;
	private String csw;
	private String c1;
	private String c2;
	private String c3;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getCsw() {
		return csw;
	}

	public void setCsw(String csw) {
		this.csw = csw;
	}

	public String getC1() {
		return c1;
	}

	public void setC1(String c1) {
		this.c1 = c1;
	}

	public String getC2() {
		return c2;
	}

	public void setC2(String c2) {
		this.c2 = c2;
	}

	public String getC3() {
		return c3;
	}

	public void setC3(String c3) {
		this.c3 = c3;
	}

	@Override
	public String toString() {
		return "MusicalVO [no=" + no + ", date=" + date + ", day=" + day + ", time=" + time + ", csw=" + csw + ", c1="
				+ c1 + ", c2=" + c2 + ", c3=" + c3 + "]";
	}

}
