package com.mymall.service;

import com.mymall.domain.ReviewVO;
import com.mymall.dto.Criteria;
import com.mymall.dto.ReviewPageDTO;

public interface ReviewService {

	public ReviewPageDTO getReviewListWithPaging(Criteria cri, int pdt_num) throws Exception;
	
	public void review_register(ReviewVO vo) throws Exception;
	
	public void review_modify(ReviewVO vo) throws Exception;
	
	public void review_delete(int rv_num) throws Exception;
}
