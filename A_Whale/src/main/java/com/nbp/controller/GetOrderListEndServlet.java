package com.nbp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nbp.model.DTO.Member;
import com.nbp.order.model.dto.MyPageOrder;
import com.nbp.order.model.service.OrderService;

/**
 * Servlet implementation class GetOrderListEndServlet
 */
@WebServlet("/MyPage/getOrderLists.do")
public class GetOrderListEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOrderListEndServlet() {
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginMember=(String)request.getAttribute("loginMember");
		
		OrderService os=new OrderService();

            
         // 로그인한 회원의 주문 내역을 조회
            List<MyPageOrder> orderList = os.getMyOrderList(loginMember);

            // 조회된 주문 내역을 JSON 형식으로 변환하여 응답
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.writeValue(response.getWriter(), orderList);
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
