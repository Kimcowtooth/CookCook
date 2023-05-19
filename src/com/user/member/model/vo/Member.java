package com.user.member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String phone;
	private String email;
	private String address;
	private String gradeCode;
	private String status;
	private Date SubScriptionDate;
	private Date modiFiedDate;
	public Member() {
		super();
	}
	public Member(int memberNo, String memberId, String memberPwd, String memberName, String phone, String email,
			String address, String gradeCode, String status, Date subScriptionDate, Date modiFiedDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.gradeCode = gradeCode;
		this.status = status;
		SubScriptionDate = subScriptionDate;
		this.modiFiedDate = modiFiedDate;
	}
	
	
	public Member(String memberId, String memberPwd, String memberName, String phone, String email, String address) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGradeCode() {
		return gradeCode;
	}
	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getSubScriptionDate() {
		return SubScriptionDate;
	}
	public void setSubScriptionDate(Date subScriptionDate) {
		SubScriptionDate = subScriptionDate;
	}
	public Date getModiFiedDate() {
		return modiFiedDate;
	}
	public void setModiFiedDate(Date modiFiedDate) {
		this.modiFiedDate = modiFiedDate;
	}
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", phone=" + phone + ", email=" + email + ", address=" + address + ", gradeCode="
				+ gradeCode + ", status=" + status + ", SubScriptionDate=" + SubScriptionDate + ", modiFiedDate="
				+ modiFiedDate + "]";
	}
	
	
}
