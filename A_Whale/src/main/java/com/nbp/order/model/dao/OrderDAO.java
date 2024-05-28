package com.nbp.order.model.dao;

import static com.nbp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.nbp.order.model.dto.Order;
import com.nbp.order.model.dto.MyPageOrder;
public class OrderDAO {
	private Properties sql = new Properties();
	{
		String path = OrderDAO.class.getResource("/sql/order/order.properties").getPath();
		try(FileReader fr= new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Order> selectOrderAll(Connection conn,int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> orders = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectOrderAll"));
//			pstmt.setInt(1, (cPage-1)*numPerpage+1);
//			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				orders.add(getOrder(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return orders;
	}
	public List<MyPageOrder> getMyOrderList(Connection conn,String orderer){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//마이페이지에 들어갈 주문내역에 필요한 주문테이블의 5개 정보 객체화 및 객체배열로 처리
		List<MyPageOrder> orders = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("getMyOrderList"));
//			pstmt.setInt(1, (cPage-1)*numPerpage+1);
//			pstmt.setInt(2, cPage*numPerpage);
			pstmt.setString(1, orderer);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				orders.add(getMypageOrder(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return orders;
	}
	
	public static Order getOrder(ResultSet rs) throws SQLException{
		return Order.builder()
				.orderId(rs.getString("order_id"))
				.memberId(rs.getString("member_id"))
				.orderName(rs.getString("order_o_name"))
				.orderPhone(rs.getString("order_o_phone"))
				.orderReceiveName(rs.getString("order_r_name"))
				.orderReceiveAddress(rs.getString("order_r_adr"))
				.orderReceiveDetailAddress(rs.getString("order_r_d_adr"))
				.orderPrice(rs.getInt("order_t_price"))
				.orderDate(rs.getDate("order_date"))
				.orderMemo(rs.getString("order_memo"))
				.orderCode(rs.getInt("order_code"))
				.orderNum(rs.getInt("order_tr_num"))
				.orderDay(rs.getDate("order_d_day"))
				.build();
	}
	public static MyPageOrder getMypageOrder(ResultSet rs) throws SQLException{
		return MyPageOrder.builder()
				.orderId(rs.getString("ORDER_ID"))
				.productName(rs.getString("PRODUCT_NAME"))
				.orderDDay(rs.getDate("order_d_day"))
				.orderTPrice(rs.getInt("ORDER_T_PRICE"))
				.orderCode(rs.getInt("ORDER_CODE"))
				.build();
		//마이페이지에 들어갈 주문내역에 5가지 정보로 객체화
	}
	
//	public static List<MyPageOrder> getOrders(ResultSet rs) throws SQLException{
//				rs=null;
//				//마이페이지용 주문 객체를 객체배열로 처리하여 반환
//				List<MyPageOrder> Orders=new ArrayList<>();
//				MyPageOrder order=getMypageOrder(rs);
//				Orders.add(order);
//				return Orders;
//				close(rs);
//	}
	
}
