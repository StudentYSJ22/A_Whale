package com.nbp.product.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.product.review.model.service.ProductQnaService;

/**
 * Servlet implementation class ProductQnaInsertServlet
 */
@WebServlet("/product/productqna.do")
public class ProductQnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductQnaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String memberId=request.getParameter("userId"); 
		 String qnaTitle=request.getParameter("queryTitle");
		 String qnaContent=request.getParameter("queryContent"); 
		 String productName=request.getParameter("productName");
		 String priv=request.getParameter("private");
		 System.out.println(priv);
		 int secret = 0;
		 if(priv.equals("true")) {
			 secret=0;
		 }else{
			 secret=1;
		 };
		 
		 
		 int result = new ProductQnaService().productQnaInsert(memberId, qnaTitle, qnaContent, productName,secret);
		 String msg="";
		 String loc="/";
		 
		 if(result>0) {
			 msg="등록이 완료되었습니다.";
			 request.setAttribute("msg1",msg);
			 request.setAttribute("loc1",loc);
		 }else {
			 msg="등록이 실패했습니다. 입력한 내용을 다시 확인해주세요.";
			 request.setAttribute("msg1",msg);
			 request.setAttribute("loc1",loc);
		 }
		 
		 request.getRequestDispatcher("/WEB-INF/views/common/msg1.jsp").forward(request, response);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
