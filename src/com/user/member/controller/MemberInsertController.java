package com.user.member.controller;

import java.io.IOException;
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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
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
			String memberName = request.getParameter("memberName");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
	
			Member m = new Member(memberId,memberPwd,memberName,phone,email,address);
			int result = new MemberService().insertMember(m);
			System.out.println(result);
			
			if(result>0) {
				session.setAttribute("alertMsg", "회원가입완료 다시 로그인 해주세요.");
				response.sendRedirect(request.getContextPath());
			}else {
				request.setAttribute("errorMsg", "회원가입실패");
				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			}
		
		
		
		
	
		
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
