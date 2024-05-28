package com.nbp.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.nbp.model.DTO.Member;
import com.nbp.model.service.MemberService;

/**
 * Servlet implementation class FindPWVeriServlet
 */
@WebServlet("/common/FindPwVeri.do")
public class FindPWVeriServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPWVeriServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		MemberService sr=new MemberService();
		Member m=sr.selectMemberById(userId);
		String dbId="",dbEmail="";
		if(m!=null) {
			dbId=m.getMemberId();
			dbEmail=m.getMemberEmail();
		}
		new Gson().toJson(Map.of("dbId",dbId,"dbEmail",dbEmail),response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
