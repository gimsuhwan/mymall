package com.mymall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mymall.domain.ReviewVO;
import com.mymall.dto.Criteria;
import com.mymall.dto.ReviewPageDTO;
import com.mymall.mapper.ReviewMapper;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;
	
	@Override
	public ReviewPageDTO getReviewListWithPaging(Criteria cri, int pdt_num) throws Exception {
		
		return new ReviewPageDTO(reviewMapper.getCountByProduct_pdt_num(pdt_num), reviewMapper.getReviewListWithPaging(cri, pdt_num));
	}

	@Override
	public void review_register(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		reviewMapper.review_register(vo);
	}

	@Override
	public void review_modify(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		reviewMapper.review_modify(vo);
	}

	@Override
	public void review_delete(int rv_num) throws Exception {
		// TODO Auto-generated method stub
		reviewMapper.review_delete(rv_num);
	}

}
