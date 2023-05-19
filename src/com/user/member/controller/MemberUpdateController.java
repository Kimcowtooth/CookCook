package com.user.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import com.user.member.model.service.MemberService;
import com.user.member.model.vo.Member;
import com.user.member.model.vo.MyPage;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/image/profile/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			Member m = (Member)session.getAttribute("loginUser");		
			String memberId = m.getMemberId();
			String phone = multiRequest.getParameter("phone");
			String email = multiRequest.getParameter("email");
			String address = multiRequest.getParameter("address");
			
			m.setMemberId("memberId");
			m.setPhone(phone);
			m.setEmail(email);
			m.setAddress(address);
			
			Member updateMember = new MemberService().updateMember(m);
			MyPage mp = null;
			int memberNo = m.getMemberNo();
			System.out.println(m.getMemberNo());
			String nickName = multiRequest.getParameter("nickName");
			String aboutMe = multiRequest.getParameter("aboutMe");
			
			mp.setMemberNo(memberNo);
			mp.setNickName(nickName);
			mp.setAboutMe(aboutMe);
			
			MyPage updateMyPage = new MemberService().updateMyPage(mp);
			System.out.println("updateMember"+updateMember);
			System.out.println("updateMyPage"+updateMyPage);			
			if(multiRequest.getOriginalFileName("profile")!=null) {
				
				String profileOrigin = multiRequest.getOriginalFileName("profile");
				String profileChange = multiRequest.getFilesystemName("profile");
				String filePath = ("resources/image/profile/");
				
				mp.setprofile_origin(profileOrigin);
				mp.setprofile_change(profileChange);
				mp.setFilePath(filePath);
				
				MyPage updateProFile = new MemberService().updateProFile(mp);
				
				session.setAttribute("loginUser", updateProFile);
				response.sendRedirect(request.getContextPath()+"/myPage.me");
				System.out.println("updateProFile"+updateProFile);
			}
			if(updateMember!=null&&updateMyPage!=null) {
				session.setAttribute("loginUser", updateMember);
				session.setAttribute("loginUser", updateMyPage);
				session.setAttribute("alertMsg", "회원정보수정완료");
				response.sendRedirect(request.getContextPath()+"/myPage.me");
			}else {
				request.setAttribute("errorMsg", "정보수정에 실패했습니다");
				request.getRequestDispatcher("views/common/errorPage/jsp").forward(request, response);
			}
			
			
			}
	
	
	}
}
