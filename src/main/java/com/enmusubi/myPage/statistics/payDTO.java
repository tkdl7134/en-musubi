package com.enmusubi.myPage.statistics;

import java.util.Date;

public class payDTO {

	
	private int e_no;
	private String m_id;
	private String p_type;
	private int p_price;
	private int wl_no;
	private Date p_date;
	
	public payDTO() {
		// TODO Auto-generated constructor stub
	}

	public payDTO(int e_no, String m_id, String p_type, int p_price, int wl_no, Date p_date) {
		super();
		this.e_no = e_no;
		this.m_id = m_id;
		this.p_type = p_type;
		this.p_price = p_price;
		this.wl_no = wl_no;
		this.p_date = p_date;
	}

	public int getE_no() {
		return e_no;
	}

	public void setE_no(int e_no) {
		this.e_no = e_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getP_type() {
		return p_type;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getWl_no() {
		return wl_no;
	}

	public void setWl_no(int wl_no) {
		this.wl_no = wl_no;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	@Override
	public String toString() {
		return "payDTO [e_no=" + e_no + ", m_id=" + m_id + ", p_type=" + p_type + ", p_price=" + p_price + ", wl_no="
				+ wl_no + ", p_date=" + p_date + "]";
	}
	
	
}