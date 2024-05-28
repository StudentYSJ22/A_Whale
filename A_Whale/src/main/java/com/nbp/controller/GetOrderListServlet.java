package com.nbp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.order.model.dto.MyPageOrder;
import com.nbp.order.model.service.OrderService;

/**
 * Servlet implementation class GetOrderListServlet
 */
@WebServlet("/MyPage/getOrderList.do")
public class GetOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String MemberId=request.getParameter("MemberId");
		System.out.println(MemberId);
//		OrderService os=new OrderService();
//		List<MyPageOrder> result=os.getMyOrderList(MemberId);
//		
		request.setAttribute("MemberId",MemberId);
		System.out.println(MemberId);
		request.getRequestDispatcher("/WEB-INF/MyPage/MyOrderList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
