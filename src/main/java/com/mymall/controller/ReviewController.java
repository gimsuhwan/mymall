package com.mymall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mymall.domain.MemberVO;
import com.mymall.domain.ReviewVO;
import com.mymall.dto.Criteria;
import com.mymall.dto.ReviewPageDTO;
import com.mymall.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewController {

	// @AllArgsConstructor : 모든 필드에생성자메서드가 생성이되고, 생성자는 어노테이션을 생략하고,자동으로 주입이 이루어짐
	
	private ReviewService reviewService; 
	
	//상품후기목록(페이징기능포함)
	@GetMapping(value = "/pages/{pdt_num}/{page}", 
			produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReviewPageDTO> getReviewListPage(@PathVariable("pdt_num") int pdt_num, @PathVariable("page") int page) {
		
		ResponseEntity<ReviewPageDTO> entity = null;
		
		Criteria cri = new Criteria(page, 5);
		
		log.info("상품번호 : " + pdt_num);
		log.info("cri" + cri);
		
		// 상품후기 개수(페이징)
		// 상품후기 목록
		
		try {
			entity = new ResponseEntity<ReviewPageDTO>(reviewService.getReviewListWithPaging(cri, pdt_num), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<ReviewPageDTO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 상품후기 쓰기
	@PostMapping(value =  "/review_register")
	@ResponseBody
	public ResponseEntity<String> review_register(ReviewVO vo, HttpSession session) throws Exception{
		
		String mem_id =  ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setMem_id(mem_id);
		log.info("review_register: " + vo);
		
		ResponseEntity<String> entity = null;
		
		try {
			reviewService.review_register(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//상품후기 수정하기
	@PostMapping(value =  "/review_modify")
	@ResponseBody
	public ResponseEntity<String> review_modify(ReviewVO vo) throws Exception{
		
		log.info("review_modify: " + vo);
		
		ResponseEntity<String> entity = null;
		
		try {
			reviewService.review_modify(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//상품후기 삭제하기
	@PostMapping(value =  "/review_delete")
	@ResponseBody
	public ResponseEntity<String> review_delete(int rv_num) throws Exception{
		
		log.info("review_delete: " + rv_num);
		
		ResponseEntity<String> entity = null;
		
		try {
			reviewService.review_delete(rv_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
