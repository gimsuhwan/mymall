package com.mymall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mymall.domain.OrderDetailListVO;
import com.mymall.domain.OrderDetailVO;
import com.mymall.domain.OrderVO;
import com.mymall.dto.Criteria;
import com.mymall.dto.OrderSaleDTO;

public interface OrderService {

	public void order_buy(OrderVO vo, String mem_id) throws Exception;
	
	public void orderDirect_buy(OrderVO vo,OrderDetailVO vo2) throws Exception;
	
	//주문리스트
	public List<OrderVO> orderInfo_list(Criteria cri) throws Exception;
	
	//주문상품개수(페이징기능에 사용)
	public int getTotalCountOrder(Criteria cri) throws Exception;
	
	public List<OrderDetailListVO> order_detail_list(long odr_code) throws Exception;
	
	public List<OrderSaleDTO> order_sale(@Param("startDate") String startDate,  @Param("endDate") String endDate) throws Exception;	
	
	
}
