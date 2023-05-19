package com.user.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.member.model.service.MemberService;
import com.user.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
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
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String memberId = loginUser.getMemberId();
		String memberPwd = request.getParameter("memberPwd");
		loginUser.setMemberPwd(memberPwd);
		
		int result = new MemberService().deleteMember(memberId,memberPwd);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원탈퇴되었습니다.");
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("alertMsg", "비밀번호가 일치하지않습니다.");
			response.sendRedirect(request.getHeader("referer"));
		}
	
		
	}

}
