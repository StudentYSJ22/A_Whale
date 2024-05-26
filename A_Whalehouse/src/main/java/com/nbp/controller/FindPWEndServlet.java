package com.nbp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.model.DTO.Member;
import com.nbp.model.service.MemberService;

/**
 * Servlet implementation class FindIDEndServlet
 */
@WebServlet("/common/PasswordFinder.do")
public class FindPWEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPWEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String request.getParameter("findemail");
		MemberService sr=new MemberService();
		String newPw=request.getParameter("newPw");
		String userId=request.getParameter("userId");
		String email=request.getParameter("email");
		int Pwresult=sr.updateMemberByEmail(newPw, userId, email);
		String msg=""; String loc="";
		if(Pwresult>1) {
			msg="비밀번호가 변경되었습니다.";
			loc="/";
		}else {
			msg="비밀번호 변경 실패하였습니다.";
			loc="/";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		response.getWriter().write("비밀번호가 변경되었습니다.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
