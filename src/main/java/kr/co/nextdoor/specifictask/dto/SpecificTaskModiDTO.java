package kr.co.nextdoor.specifictask.dto;

import java.util.Date;

public class SpecificTaskModiDTO {
	
	private String specifictaskmodi_no;
	private String specifictask_no;
	private String member_id;
	private Date specifictask_start;
	private Date specifictask_end;
	private String specifictask_comp;
	
	public String getSpecifictaskmodi_no() {
		return specifictaskmodi_no;
	}
	public void setSpecifictaskmodi_no(String specifictaskmodi_no) {
		this.specifictaskmodi_no = specifictaskmodi_no;
	}
	public String getSpecifictask_no() {
		return specifictask_no;
	}
	public void setSpecifictask_no(String specifictask_no) {
		this.specifictask_no = specifictask_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getSpecifictask_start() {
		return specifictask_start;
	}
	public void setSpecifictask_start(Date specifictask_start) {
		this.specifictask_start = specifictask_start;
	}
	public Date getSpecifictask_end() {
		return specifictask_end;
	}
	public void setSpecifictask_end(Date specifictask_end) {
		this.specifictask_end = specifictask_end;
	}
	public String getSpecifictask_comp() {
		return specifictask_comp;
	}
	public void setSpecifictask_comp(String specifictask_comp) {
		this.specifictask_comp = specifictask_comp;
	}

}