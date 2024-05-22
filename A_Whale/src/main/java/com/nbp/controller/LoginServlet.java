package com.nbp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nbp.model.DTO.Member;
import com.nbp.model.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("memberPw");
		System.out.println(memberId);
		System.out.println(memberPw);
		String saveId=request.getParameter("saveId");
		System.out.println(saveId);
		Cookie saveIdCookie=new Cookie("saveId",memberId);
		if(saveId!=null) {			//
			saveIdCookie.setMaxAge(60*60*24*7);
			saveIdCookie.setPath("/");
//			response.addCookie(saveIdCookie);
		}else {
//			Cookie saveIdCookie=new Cookie("saveId","삭제");
			saveIdCookie.setMaxAge(0);
		}
		response.addCookie(saveIdCookie);
		
		if(memberId.equals("")||memberPw.equals("")) {
			request.setAttribute("msg", "아이디나 패스워드를 입력하세요");
			request.setAttribute("loc", "/");
			RequestDispatcher rd=request
					.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
		}else {
			Member m=new MemberService().selectMemberById(memberId,memberPw);
			if(m!=null) {
				//로그인한 정보를 HttpSession에 저장
				HttpSession session=request.getSession();
				session.setAttribute("loginMember", m);
				//화면전환
				response.sendRedirect(request.getContextPath());
			}else {
				request.setAttribute("msg","아이디나 패스워드가 일치하지 않습니다");
				request.setAttribute("loc", "/");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				.forward(request, response);
			}
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
