package com.user.member.model.service;

import java.sql.Connection;

import com.user.member.model.dao.MemberDao;
import com.user.member.model.vo.Member;
import com.user.member.model.vo.MyPage;
import com.common.JDBCTemplate;

public class MemberService {
	
	//로그인
	public Member loginMember(String memberId, String memberPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn,memberId,memberPwd);
		
		JDBCTemplate.close(conn);
		return m;
	}
	//마이페이지 프로필사진,닉네임,자기소개불러오기
	public MyPage selectMyPageAll(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		MyPage mp = new MemberDao().selectMyPageAll(conn,memberNo);
		JDBCTemplate.close(conn);
		
		return mp;
	}
	//회원가입
	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result1 = new MemberDao().insertMember(conn,m);
		int result2 = 1;
		
		if(result1 > 0) {
			String nickName = m.getMemberName();
			result2 = new MemberDao().insertMyPage(conn, nickName);
			
		}
		
		int finalResult = result1*result2;
		
		if(finalResult>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return finalResult;
	}
	//마이페이지 내정보수정
	public Member updateMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().updateMember(conn,m);
		Member updateMember = null;
		String memberId = m.getMemberId();
		if(result>0) {
			JDBCTemplate.commit(conn);
			updateMember = new MemberDao().selectMember(conn,memberId);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return updateMember;
	}
	//마이페이지 자기소개,닉네임변경
	public MyPage updateMyPage(MyPage mp) {
		Connection conn = JDBCTemplate.getConnection();
		int memberNo = mp.getMemberNo();
		int result = new MemberDao().updateMyPage(conn, mp);
		MyPage updateMyPage = null;

		if(result>0) {
			JDBCTemplate.commit(conn);
			updateMyPage = new MemberDao().selectMyPage(conn, memberNo);
		}
		return updateMyPage;
	}
	
	//마이페이지 프로필사진 수정
	public MyPage updateProFile(MyPage mp) {
		Connection conn = JDBCTemplate.getConnection();
		int memberNo = mp.getMemberNo();
		int result = new MemberDao().updateProFile(conn,mp);
		MyPage updateProFile=null;
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			updateProFile = new MemberDao().selectProFile(conn,memberNo);
		}
		return updateProFile;
	}
	
	//회원탈퇴
	public int deleteMember(String memberId, String memberPwd) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().deleteMember(conn,memberId,memberPwd);
		
		if (result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	//마이페이지 불러오는 


	
}
