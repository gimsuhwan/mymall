package com.mymall.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mymall.domain.MemberVO;
import com.mymall.dto.EmailDTO;
import com.mymall.dto.LoginDTO;
import com.mymall.service.EmailService;
import com.mymall.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@Setter(onMethod_ = @Autowired)
	private EmailService mailService;
	
	
	@Inject
	private BCryptPasswordEncoder cryPassEnc;
	
	
	
	//로그인 폼
	@GetMapping("/login")
	public void login() {
	}
	
	//로그인 인증
	@PostMapping(value = "/loginPost")
	public void login_ok(LoginDTO dto, RedirectAttributes rttr, HttpSession session, Model model) throws Exception {
	
		MemberVO vo = service.login_ok(dto);
		
		if(vo == null)	return;
		
		String result = "loginIDFail"; 
		
		if(vo != null) {
			
			log.info("=========로그인성공");
			
		if(cryPassEnc.matches(dto.getMem_pw(), vo.getMem_pw())){
				//vo.setMem_pw("");
				session.setAttribute("loginStatus", vo);//세션정보로 인증상태를 저장
				
				// 인터셉트에서 참조할 모델 작업
				model.addAttribute("memberVO", vo);
				
				
				result = "loginSuccess";
			}else {
				result = "loginPWFail";
				return;
			}
	
		}
		rttr.addFlashAttribute("status", result);          //main.jsp에서 참조
	}
		
		
	
	
	//로그아웃기능 : 메인페이지("/")
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		log.info("=========로그아웃");
		
		session.invalidate();
		
		String result = "logout";
		rttr.addFlashAttribute("status", result);
		
		return "redirect:/";
		
	}
	
	
	//회원가입 폼
	@GetMapping("/join")
	public void join() {
	}
	
	//회원가입
	@PostMapping("/join")
	public String join(MemberVO vo, RedirectAttributes rttr) throws Exception {
		
		log.info("=========회원가입");
		
		//비밀번호 암호화
		vo.setMem_pw(cryPassEnc.encode(vo.getMem_pw()));
		
		String result = "";
		service.join(vo);
		
		result = "insertSuccess";
		
		rttr.addFlashAttribute("status", result);
		
		return "redirect:/";
	}
	
	
	// 아이디중복체크
	@ResponseBody
	@RequestMapping(value = "/checkIdDuplicate", method=RequestMethod.POST)
	public ResponseEntity<String> checkIdDuplicate(@RequestParam("mem_id") String mem_id) throws Exception {
		
		log.info("id check");
		
		ResponseEntity<String> entity = null;
		try {
			int count = service.checkIdDuplicate(mem_id);
			// count 가 0이면 아이디 사용가능, 1 이면 사용 불가능.

			if(count != 0) {
				// 아이디가 존재해서 사용이 불가능.
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			} else {
				// 사용가능한 아이디
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST); // 요청이 문제가 있다.
		}
		
		return entity;
	}
	
	
//	// 이메일 인증 코드확인 
//	@ResponseBody
//	@RequestMapping(value = "checkAuthcode", method=RequestMethod.POST)
//	public ResponseEntity<String> checkAuthcode(@RequestParam("code") String code, HttpSession session){
//		
//		ResponseEntity<String> entity = null;
//		
//		try {
//			// 사용자가 메일로 받은 인증코드와 세션으로 저장해둔 인증코드를 비교하는 구문
//			if(code.equals(session.getAttribute("authcode"))) {
//				// 인증코드 일치
//				entity= new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//				
//				session.removeAttribute("authcode"); // 앞에서 했던 작업을 없애주는 작업
//				
//			} else {
//				// 인증코드 불일치
//				entity= new ResponseEntity<String>("FAIL", HttpStatus.OK);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity= new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//	}
	

	
	
	
	
	
	
	
	
	//비밀번호 확인 Ajax용 
	@ResponseBody
	@PostMapping("/checkPwAjax")
	public ResponseEntity<String> checkPwAjax(@RequestParam("mem_pw") String mem_pw, HttpSession session) {
				
		log.info("========= checkPwAjax");
	
		ResponseEntity<String> entity = null;	
		String loginPW = ((MemberVO)session.getAttribute("loginStatus")).getMem_pw(); 
		
		
		log.info("=====mem_pw: " + mem_pw);  //화면단에서 기존비번 
		log.info("=====loginPW: " + loginPW);  //세션에 저장된 비번

		if(cryPassEnc.matches(mem_pw, loginPW)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} else {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		return entity;
	}
	
		
	//회원수정 폼 : db에서 회원정보를 가져와서 출력
	@GetMapping("/modify")
	public void reg_edit(HttpSession session, Model model) throws Exception {
		
		log.info("============회원수정폼");
		
		String mem_id =  ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		/*
		MemberVO vo = service.member_info(mem_id);
		model.addAttribute("vo", vo);
		*/
		
		//model.addAttribute(service.member_info(mem_id)); // jsp에 전달되는 데이타의 키? memberVO
		model.addAttribute("vo", service.member_info(mem_id));
		
	}
	
	//회원수정(POST)
	@PostMapping("/modify")
	public String modifyPOST(MemberVO vo, RedirectAttributes rttr, HttpSession session) throws Exception{
		
		log.info("============회원수정");
		
		String result = "";
	
		LoginDTO dto = new LoginDTO();
		dto.setMem_id(vo.getMem_id());
		dto.setMem_pw(vo.getMem_pw());

		vo.setMem_pw(cryPassEnc.encode(vo.getMem_pw())); //비밀번호 암호화작업 
		service.modifyPOST(vo); //회원수정 

		//session.setAttribute("loginStatus", service.login_ok(dto));

		result = "modifySuccess";
		
		rttr.addFlashAttribute("status", result);
		
		return "redirect:/";
	}
	
	
	// 비번변경 폼 
	@GetMapping("/change_pwd")
	public void change_pwd() {
	}
	
	// 비번변경(POST)
	@PostMapping("/change_pwd")
	public String change_pwd(MemberVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {

		log.info("============비번변경");

		String result = "";

		vo.setMem_pw(cryPassEnc.encode(vo.getMem_pw_change()));
		service.update_pwd(vo);

		String loginPW = ((MemberVO)session.getAttribute("loginStatus")).getMem_pw();
		vo.setMem_pw(loginPW);
		session.setAttribute("loginStatus", vo);

		result = "changepwd";

		rttr.addFlashAttribute("status", result);

		return "redirect:/";
	}
	
	
	//회원삭제
	@GetMapping("/delete")
	public String delete(HttpSession session, RedirectAttributes rttr) throws Exception{
		
		log.info("==========회원삭제");
		
		String mem_id =  ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		service.member_delete(mem_id);
		session.invalidate();
		
		String result = "regdelete";
		
		rttr.addFlashAttribute("status", result); // 루트(/)주소로 이동시 main.jsp에서 참조
		
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//아이디 찾기 폼
	@GetMapping("/find_id")
	public void find_id() {
		
		log.info("find_id");
	}
	
	// 아이디 찾기기능(ajax적용) : 화면출력
	@PostMapping("/find_id")
	public ResponseEntity<String> find_id(@RequestParam("mem_name") String mem_name) throws Exception{
		
		log.info("이름? " + mem_name);
		
		ResponseEntity<String> entity = null;
		
		String mem_id = service.find_id(mem_name);
		
		if(mem_id != null) {
			entity = new ResponseEntity<String>(mem_id, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return entity;
		
	}
	

	//비밀번호 찾기 폼
	@GetMapping("/find_pwd")
	public void find_pwd() {
		
		log.info("find_pwd");
		
	}
	
	//비밀번호 찾기기능(ajax적용) : 메일발송
	@ResponseBody
	@PostMapping("/find_pwd")
	public ResponseEntity<String> find_pwd(@RequestParam("mem_id") String mem_id, @RequestParam("mem_name") String mem_name, EmailDTO dto) throws Exception{
		
		log.info("아이디?" + mem_id);
		log.info("이름?" + mem_name);
		
		
		ResponseEntity<String> entity = null;
		
		MemberVO vo = service.find_pwd(mem_id, mem_name);
		
		if(vo != null) {
			
			// 메일발송작업
			dto.setReceiveMail(vo.getMem_email());
			dto.setSubject("요청하신 비밀번호입니다.");
			dto.setMessage(mem_id + " 님의 비밀번호입니다.");
			
			mailService.sendMail(dto, vo.getMem_pw());                                                                                                         
			
			
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	
	@GetMapping("/pw_search")
	public ResponseEntity<String> pw_search(String id, EmailDTO email_dto) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		LoginDTO dto = new LoginDTO();
		dto.setMem_id(id);
		dto.setMem_pw("");
		
		
		MemberVO vo = service.login_ok(dto);
		
		String imsi_pw = "";
		
		if(vo != null) {
			
			String email = vo.getMem_email();
			
			for(int i=0; i<12; i++) {
				imsi_pw += (char)((Math.random() * 26) + 97);
			}
			
			//비번 암호화작업
			String enc_pw = cryPassEnc.encode(imsi_pw);
			dto.setMem_pw(enc_pw);
			
			//dto를 파라미터로 하여, 사용자 아이디에 해당하는 비번변경작업
			//1)update 회원테이블 set 비번컬럼명 = 암호화된 비번 where 조건식(아이디일치)
			service.pw_search(dto);
			
			
			//2)평문 비번을 메일로 전송
			email_dto.setReceiveMail(email);
			email_dto.setSubject("요청하신 임시 비밀번호입니다. 로그인해서 비밀번호를 변경해주세요.");
			email_dto.setMessage(id + "님의 비밀번호입니다.");
			
			mailService.sendMail(email_dto, imsi_pw);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
			
		}else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	//마이페이지
	@GetMapping("/mypage")
	public void mypage() throws Exception{
		
		log.info("마이페이지");
	}
	
	
	
	

	
	
	
	
	

	
}
