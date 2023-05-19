package com.common.model.vo;

import java.sql.Date;

public class Attachment {
	// Attachment class field
	private int fileNo; // FILE_NO /*파일 번호*/
	private int refBno; // REF_BNO /*참조 게시판 번호*/
	private String refCode; // REF_CODE /*참조 게시판 타입*/
	private int refCno; // REF_CNO /*참조 조리 내용 번호*/
	private String orignName; // ORIGIN_NAME	/*파일 원본 명칭*/
	private String changeName; // CHANGE_NAME	/*파일 수정 명칭*/
	private String filePath; // FILE_PATH /*파일 경로*/
	private Date uploadDate; // UPLOAD_DATE	/*업로드 일자*/
	private String status; // STATUS /*상태값(Y/N)*/
	// Attachment class toString
	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refBno=" + refBno + ", refCode=" + refCode + ", refCno=" + refCno
				+ ", orignName=" + orignName + ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate="
				+ uploadDate + ", status=" + status + "]";
	}
	// Attachment class constructor
	public Attachment() {
		super();
	}
	
	public Attachment(int fileNo, int refBno, String refCode, int refCno, String orignName, String changeName,
			String filePath, Date uploadDate, String status) {
		super();
		this.fileNo = fileNo;
		this.refBno = refBno;
		this.refCode = refCode;
		this.refCno = refCno;
		this.orignName = orignName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
	}
	// Attachment class getter/setter
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getRefBno() {
		return refBno;
	}
	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}
	public String getRefCode() {
		return refCode;
	}
	public void setRefCode(String refCode) {
		this.refCode = refCode;
	}
	public int getRefCno() {
		return refCno;
	}
	public void setRefCno(int refCno) {
		this.refCno = refCno;
	}
	public String getOrignName() {
		return orignName;
	}
	public void setOrignName(String orignName) {
		this.orignName = orignName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
}
