package kr.or.lis.vo;

import java.sql.Date;


public class BorrowVO2 {
	
	private int bor_no;

	private Date bor_date;

	private Date return_date;
	private String return_ok;
	private String mno;
	private int b_no;
	private String b_image;
	private String b_title;
	private String b_publisher;
	private String b_writer;
	private int b_price;
	private String b_detail;
	
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
	
	public String getB_image() {
		return b_image;
	}
	
	public void setB_image(String b_image) {
		this.b_image = b_image;
	}
	
	public String getB_title() {
		return b_title;
	}
	
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	
	public String getB_publisher() {
		return b_publisher;
	}
	
	public void setB_publisher(String b_publisher) {
		this.b_publisher = b_publisher;
	}
	
	public String getB_writer() {
		return b_writer;
	}
	
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	
	public int getB_price() {
		return b_price;
	}
	
	public void setB_price(int b_price) {
		this.b_price = b_price;
	}
	
	public String getB_detail() {
		return b_detail;
	}
	
	public void setB_detail(String b_detail) {
		this.b_detail = b_detail;
	}
}
