package com.nbp.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.product.model.DTO.Product;
import com.nbp.product.model.service.ProductService;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/product/pagebar.do")
public class ProductListPageBarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListPageBarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("접속완료");
		
		int totalData = new ProductService().selectProductAllCount();
		
		//페이지 각 마지막 번호.
		int lastNo = 0;
		int firstNo = 5;
		
		String pageBar="";
		if(lastNo>=totalData) {
			lastNo=totalData;
			pageBar="<div id='read-btn' style='display:none;><p>read-More</p></div>";
		}else {
			pageBar="<div id='read-btn'><p>read-More</p></div>";
		}
		
		
		
		
		request.setAttribute("pageBar",pageBar);
		
		request.getRequestDispatcher("/WEB-INF/views/product/ProductList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
