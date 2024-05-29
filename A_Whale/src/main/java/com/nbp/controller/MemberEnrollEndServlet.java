package com.nbp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.nbp.model.service.*;


import com.nbp.model.DTO.Member;


/**
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet("/common/enroll.do")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//아이디, 닉네임, 등급(null), 비밀번호, 이름, 전화번호, 이메일, 주소, 주민번호, 포인트(null), 가입날짜(default)
		String userId=request.getParameter("userid");
		String userName=request.getParameter("username");
		String userNickName=request.getParameter("usernickname");
		String userPw=request.getParameter("password");
		String userPhone=request.getParameter("phone");
		String userEmail=request.getParameter("email");
		String userAdr=request.getParameter("sample6_address");
		String userDAdr=request.getParameter("sample6_detailAddress");
		String userLAdr=request.getParameter("sample6_extraAddress");
		String userTotalAdr=userAdr+userDAdr+userLAdr;
		String userBirthDate=request.getParameter("birthdate");
		System.out.println(userTotalAdr);
		Member m=Member.builder()
		.memberId(userId)
		.memberNickname(userNickName)
		.memberPw(userPw)
		.memberName(userName)
		.memberPhone(userPhone)
		.memberEmail(userEmail)
		.memberAdr(userTotalAdr)
		.memberBirthDate(userBirthDate)
		.enrollDate(null)
		.build();
		MemberService ms=new MemberService();
		int result=ms.insertMember(m);
		String msg="",loc="";
		if(result>0) {
			msg="회원가입이 완료됐습니다. A_Whale을 선택해주셔서 감사합니다.";
			loc="/";
			request.setAttribute("msg",msg);
			request.setAttribute("loc", loc);
			RequestDispatcher rd=request
					.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
		}else if(result==0) {
			msg="회원가입에 실패했습니다. 입력하신 정보가 올바른 정보인지 확인해주세요.";
			loc="/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			RequestDispatcher rd=request
					.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
		}
		request.getRequestDispatcher(request.getContextPath()).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
