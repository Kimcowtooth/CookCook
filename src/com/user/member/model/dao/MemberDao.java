package com.user.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.user.member.model.vo.Member;
import com.user.member.model.vo.MyPage;
import com.common.JDBCTemplate;

public class MemberDao {
	//Properties 객체 생성
	private Properties prop = new Properties();
	
	//기본생성자
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/user/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//로그인 요청처리 메소드
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		Member m = null;
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO")
							  ,rset.getString("MEMBER_ID")
							  ,rset.getString("MEMBER_PWD")
							  ,rset.getString("MEMBER_NAME")
							  ,rset.getString("PHONE")
							  ,rset.getString("EMAIL")
							  ,rset.getString("ADDRESS")
							  ,rset.getString("GRADE_CODE")
							  ,rset.getString("STATUS")
							  ,rset.getDate("SUBSCRIPTION_DATE")
							  ,rset.getDate("MODIFIED_DATE"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return m;
	}
	
	//회원가입
	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//마이페이지 프로필사진,닉네임,자기소개등록
	public int insertMyPage(Connection conn , String nickName) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMyPage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	//마이페이지 내정보수정
	public int updateMember(Connection conn,Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getPhone());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getAddress());
			pstmt.setString(4, m.getMemberId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	//마이페이지 자기소개,닉네임 정보 수정
	public int updateMyPage(Connection conn, MyPage mp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMyPage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mp.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	//마이페이지 프로필사진 수정 메소드
	public int updateProFile(Connection conn,MyPage mp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mp.getprofile_origin());
			pstmt.setString(2, mp.getprofile_change());
			pstmt.setString(3, mp.getFilePath());
			pstmt.setInt(4, mp.getMemberNo());
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//마이페이지 아이디로 회원정보 조회
	public Member selectMember(Connection conn, String memberId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO")
							  ,rset.getString("MEMBER_ID")
							  ,rset.getString("MEMBER_PWD")
							  ,rset.getString("MEMBER_NAME")
							  ,rset.getString("PHONE")
							  ,rset.getString("EMAIL")
							  ,rset.getString("ADDRESS")
							  ,rset.getString("GRADE_CODE")
							  ,rset.getString("STATUS")
							  ,rset.getDate("SUBSCRIPTION_DATE")
							  ,rset.getDate("MODIFIED_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}	
		return m;
	}
	public MyPage selectMyPageAll(Connection conn, int memberNo) {
		MyPage mp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyPageAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mp = new MyPage(rset.getInt("MEMBER_NO")
								,rset.getString("PROPILE_ORIGIN")
								,rset.getString("PROPILE_CHANGE")
								,rset.getString("FILE_PATH")
								,rset.getString("NICKNAME")
								,rset.getString("ABOUTME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return mp;
	}
	
	
	
	
	//마이페이지 로그인 memberNo로 자기소개,닉네임 불러오는 메소드
	public MyPage selectMyPage(Connection conn, int memberNo) {
		MyPage mp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyPage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mp = new MyPage(rset.getInt("MEMBER_NO")
								,rset.getString("NICKNAME")
								,rset.getString("ABOUTME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return mp;
	}
	//MemberNo로 프로필 사진 불러오는 메소드
	public MyPage selectProFile(Connection conn,int memberNo) {
		MyPage mp = null;
		PreparedStatement pstmt = null;
		ResultSet rset =  null;
		String sql = prop.getProperty("selectProFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mp = new MyPage(rset.getInt("MEMBER_NO")
								,rset.getString("PROPILE_ORIGIN")
								,rset.getString("PROPILE_CHANGE")
								,rset.getString("FILE_PATH"));
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return mp;
	}
	
	//회원탈퇴메소드
	public int deleteMember(Connection conn, String memberId, String memberPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPwd);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
