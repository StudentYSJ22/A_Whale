package com.nbp.order.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Order {
	private String orderId;
	private String memberId;
	private String orderName;
	private String orderPhone;
	private String orderReceiveName;
	private String orderReceiveAddress;
	private String orderReceiveDetailAddress;
	private int orderPrice;
	private Date orderDate; //주문일자
	private String orderMemo; //배송메모
	private int orderCode; //주문상태코드
	private int orderNum;	//운송장번호
	private Date orderDay; //배송완료일
}
