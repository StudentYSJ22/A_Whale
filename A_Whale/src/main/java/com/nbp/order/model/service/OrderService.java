package com.nbp.order.model.service;

import static com.nbp.common.JDBCTemplate.close;
import static com.nbp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.nbp.order.model.dao.OrderDAO;
import com.nbp.order.model.dto.MyPageOrder;
import com.nbp.order.model.dto.Order;

public class OrderService {
	private OrderDAO dao = new OrderDAO();
	
	public List<Order> selectOrderAll(int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Order> result = dao. selectOrderAll(conn, cPage, numPerpage);
		close(conn);
		return result;
	}
	
	public List<MyPageOrder> getMyOrderList(String orderer){
		Connection conn=getConnection();
		List<MyPageOrder> result=dao.getMyOrderList(conn, orderer);
		close(conn);
		return result;
	}
	
//	public int selectOrderCount() {
//		Connection conn = getConnection();
//		int result = dao.selectOrderCount(conn);
//		close(conn);
//		return result;
//	}
}
