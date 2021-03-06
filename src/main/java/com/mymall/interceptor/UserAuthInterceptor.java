package com.mymall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserAuthInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(UserAuthInterceptor.class);
	private static final String LOGIN = "loginStatus";
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		//인증체크작업
		if(session.getAttribute(LOGIN) == null) {
			
			logger.info("로그인이 안되어있음.");
			
			
			targetSave(request);
			
			response.sendRedirect("/member/login");  // /member/login -> /member/loginPost(인터셉터 설정)
			return false; // Controller로 제어가 넘어가지 않음
		}
		
		return true;  // Controller로 제어가 넘어감
	}

	// 세션이 소멸된 상태이거나 비로그인시 요청한 주소를 저장
	// 사용자가 로그인이 진행이되면, 요청한 주소가 있으면 그곳으로 이동. 없으면 루트로 이동. 
	private void targetSave(HttpServletRequest request) {
		
		// /member/modify?userid=doccomsa
		String uri = request.getRequestURI();
		String queryString = request.getQueryString(); 
		
		if(queryString == null || queryString.equals("null")) {
			queryString = "";
		}else {
			queryString = "?" + queryString;
		}
		
		if(request.getMethod().equals("GET")) {
			logger.info("targetSave: " + (uri + queryString));
			request.getSession().setAttribute("targetUrl", uri + queryString);
		}
		
	}

}
