package com.mymall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mymall.domain.CategoryVO;
import com.mymall.domain.ProductVO;
import com.mymall.dto.Criteria;
import com.mymall.mapper.UserProductMapper;

import lombok.Setter;

@Service
public class UserProductServiceImpl implements UserProductService {

	@Setter(onMethod_ = @Autowired)
	private UserProductMapper userProductMapper;
	
	@Override
	public List<CategoryVO> getCategoryList() throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> getSubCategoryList(String cg_code) throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getSubCategoryList(cg_code);
	}

	@Override
	public List<ProductVO> getProductListBysubCate(Criteria cri, String cg_code) throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getProductListBysubCate(cri, cg_code);
	}

	@Override
	public int getTotalCountProductBySubCate(String cg_code) throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getTotalCountProductBySubCate(cg_code);
	}

	@Override
	public ProductVO getProductByNum(long pdt_num) throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getProductByNum(pdt_num);
	}

}
