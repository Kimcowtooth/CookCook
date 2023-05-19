package com.user.member.model.vo;

public class MyPage {
	private int memberNo;
	private String profile_origin;
	private String profile_change;
	private String filePath;
	private String nickName;
	private String aboutMe;
	public MyPage() {
		super();
	}
	public MyPage(int memberNo, String profile_origin, String profile_change, String filePath, String nickName,
			String aboutMe) {
		super();
		this.memberNo = memberNo;
		this.profile_origin = profile_origin;
		this.profile_change = profile_change;
		this.filePath = filePath;
		this.nickName = nickName;
		this.aboutMe = aboutMe;
	}
	
	public MyPage(int memberNo, String nickName, String aboutMe) {
		super();
		this.memberNo = memberNo;
		this.nickName = nickName;
		this.aboutMe = aboutMe;
	}
	
	public MyPage(int memberNo, String profile_origin, String profile_change, String filePath) {
		super();
		this.memberNo = memberNo;
		this.profile_origin = profile_origin;
		this.profile_change = profile_change;
		this.filePath = filePath;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getprofile_origin() {
		return profile_origin;
	}
	public void setprofile_origin(String profile_origin) {
		this.profile_origin = profile_origin;
	}
	public String getprofile_change() {
		return profile_change;
	}
	public void setprofile_change(String profile_change) {
		this.profile_change = profile_change;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAboutMe() {
		return aboutMe;
	}
	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}
	@Override
	public String toString() {
		return "MyPage [memberNo=" + memberNo + ", profile_origin=" + profile_origin + ", profile_change="
				+ profile_change + ", filePath=" + filePath + ", nickName=" + nickName + ", aboutMe=" + aboutMe + "]";
	}

	
}
