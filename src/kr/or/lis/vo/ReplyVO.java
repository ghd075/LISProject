package kr.or.lis.vo;

import java.util.Date;

public class ReplyVO {
	private int rno;
	private int nno;
	private String mid;
	private String ntitle;
	private Date  ndate;
	private String ncontent;
	private int nview;
	
	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}
	
	public int getNno() {
		return nno;
	}
	
	public void setNno(int nno) {
		this.nno = nno;
	}
	
	public String getMid() {
		return mid;
	}
	
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getNtitle() {
		return ntitle;
	}
	
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	
	public Date getNdate() {
		return ndate;
	}

	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}

	public String getNcontent() {
		return ncontent;
	}
	
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	
	public int getNview() {
		return nview;
	}
	
	public void setNview(int nview) {
		this.nview = nview;
	}
}
