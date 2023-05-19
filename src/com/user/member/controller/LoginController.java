package com.user.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.member.model.service.MemberService;
import com.user.member.model.vo.Member;
import com.user.member.model.vo.MyPage;

/**
 * Servlet implementation class loginForm
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		Member loginUser = new MemberService().loginMember(memberId,memberPwd);
		
		if(loginUser==null) {
			request.setAttribute("errorMsg", "로그인에 실패했습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			
		}else {
			MyPage mp = new MemberService().selectMyPageAll(loginUser.getMemberNo());
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("mp", mp);
			session.setAttribute("alertMsg", "로그인되었습니다");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
		
	}

}
