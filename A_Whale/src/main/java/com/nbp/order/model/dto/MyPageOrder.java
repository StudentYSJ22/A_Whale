package com.nbp.order.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Builder
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MyPageOrder {
	private String orderId;
	private String productName;
	private Date orderDDay;
	private int orderTPrice;
	private int orderCode;
}
