package com.nbp.controller;

import static com.nbp.common.JDBCTemplate.getConnection;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.model.service.MemberService;

/**
 * Servlet implementation class MyPageUpdateMemberEndServlet
 */
@WebServlet("/MyPage/updateMember.do")
public class MyPageUpdateMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");		
		String userId=request.getParameter("userId");
		String userPw=request.getParameter("userPw");
		String userEm=request.getParameter("userEm");
		String userAdr=request.getParameter("userAdr");
		String userPh=request.getParameter("userPh");
		MemberService service= new MemberService();
		int result=service.updateMember(userPw, userEm, userAdr, userPh, userId);
		String msg="",loc="";
		if(result>0) {
			msg="회원정보가 수정되었습니다. :)";
			loc="/";
			request.setAttribute("msg",msg);
			request.setAttribute("loc", loc);
		}else {
			msg="회원정보 수정이 실패했습니다. :( ";
			loc="/MyPage/memberupdate.do";
			request.setAttribute("msg",msg);
			request.setAttribute("loc", loc);
		}
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request,response);
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
