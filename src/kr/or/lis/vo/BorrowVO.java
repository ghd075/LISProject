package kr.or.lis.vo;

import java.util.Date;

public class BorrowVO {
	
	private int bor_no;
	private Date bor_date;
	private Date return_date;
	private String return_ok;
	private String mno;
	private int b_no;
	private String name;
	
	public int getBor_no() {
		return bor_no;
	}
	
	public void setBor_no(int bor_no) {
		this.bor_no = bor_no;
	}
	
	public Date getBor_date() {
		return bor_date;
	}
	
	public void setBor_date(Date bor_date) {
		this.bor_date = bor_date;
	}
	
	public Date getReturn_date() {
		return return_date;
	}
	
	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}
	
	public String getReturn_ok() {
		return return_ok;
	}
	
	public void setReturn_ok(String return_ok) {
		this.return_ok = return_ok;
	}
	
	public String getMno() {
		return mno;
	}
	
	public void setMno(String mno) {
		this.mno = mno;
	}
	
	public int getB_no() {
		return b_no;
	}
	
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
}
