package com.mymall.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CartVOList {
	// c.cart_code, p.pdt_img, p.pdt_name, c.cart_amount, p.pdt_price
	
	private long cart_code;
	private String pdt_img;
	private String pdt_name;
	private int cart_amount;
	private long pdt_price;
}
