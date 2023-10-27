package kr.or.lis.vo;

import java.sql.Date;

public class JoinVO {

	private String mid;
	private String b_title;
	private Date bor_date;
	private String return_ok;
	
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public Date getBor_date() {
		return bor_date;
	}
	public void setBor_date(Date bor_date) {
		this.bor_date = bor_date;
	}
	public String getReturn_ok() {
		return return_ok;
	}
	public void setReturn_ok(String return_ok) {
		this.return_ok = return_ok;
	}
	
	
}
