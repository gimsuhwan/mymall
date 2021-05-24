<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<%@include file="/WEB-INF/views/common/config.jsp" %>
  <head>
  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <meta name="theme-color" content="#563d7c">
    <title>마이몰</title>
    
    
	<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

  
  </head>
  
  <script>
  $(document).ready(function() {
		
		var form = $("#joinForm");
		
		// 아이디중복체크 기능 사용여부확인 변수
		var isCheckId = "false";

		// 인증 확인 여부를 위한 변수
		var isCheckEmail = "false";
		
		/* 아이디 중복체크 클릭 시 */
		$("#btn_checkId").on("click", function(){
			
			if($("#mem_id").val()=="" || $("#mem_id").val()== null){
				$("#id_availability").html("아이디를 먼저 입력해주세요.");
				return;
			} 		
			
			var mem_id = $("#mem_id").val();
			
			// ajax방식은 제어의 흐름이 클라이언트시작 -> 서버요청 -> 클라이언트  종료
			// ajax방식은 서버요청에 실행되는 코드가 response.redirect,redirect: 주소이동 구문이 사용안하거나 
			// 동작되어서는 안된다.
			$.ajax({
				url: '/member/checkIdDuplicate',
				type: 'post',
				dataType: 'text',  //  '/member/checkIdDuplicate'주소에서 넘어오는 리턴값의 형식
				data: {mem_id : mem_id},  // javasciprt object 표현구문.www.w3school.com 참고
				success : function(data){
					if(data== 'SUCCESS'){
						// 사용 가능한 아이디
						$("#id_availability").css("color", "blue");
						$("#id_availability").html("사용가능한 아이디 입니다.");
						// 아이디를 중복체크하고 나서 아이디 텍스트박스 읽기모드, ,중복체크 비활성화
						//$("#mem_id").attr("readonly", true);
						//$("#btn_checkId").attr("disabled", true);
						
						isCheckId = "true";  // 아이디 중복체크를 한 용도
					} else {
						// 사용 불가능 - 이미 존재하는 아이디
						$("#id_availability").html("이미 존재하는 아이디입니다. \n다시 시도해주세요.");
					}
				}
			});
		});
		
		
		/* 이메일 인증 클릭 시 */ 
		/* $("#btn_sendAuthCode").on("click", function(){
			var receiveMail = $("#mem_email").val();
			
			if($("#mem_email").val()=="" || $("#mem_email").val()== null){
				// 메시지를 alert()   사용하지않고, 임의의 위치에 출력하는 형태
				$("#authcode_status").html("이메일을 먼저 입력해주세요.");
				return;
			}
			
			// 현재 작업이 진행중인 메시지를 보여주는 구문.
			$("#authcode_status").css("color", "grey");
			$("#authcode_status").html('인증코드 메일을 전송중입니다.  잠시만 기다려주세요...');
			
			$.ajax({
				url: '/email/send',    // EmailController.java
				type: 'post',
				dataType: 'text',
				data: {receiveMail : receiveMail},  //  {key : value}
				success: function(data){
					$("#email_authcode").show();
					$("#authcode_status").css("color", "grey");
					$("#authcode_status").html('메일이 전송되었습니다.  입력하신 이메일 주소에서 인증코드 확인 후 입력해주세요.');
				}
			});
		});
		*/

		/* 인증코드 입력 */
		/*
		$("#btn_checkAuthCode").on("click", function(){
			var code = $("#mem_authcode").val(); // 메일을 통하여 받았던 인증코드를 보고 입력하면 인증코드를참조 
			
			$.ajax({
				url: '/member/checkAuthcode',
				type: 'post',
				dataType: 'text',
				data: {code : code},
				success: function(data){
					if(data == 'SUCCESS'){
						$("#email_authcode").hide(); // 인증코드 입력화면 숨김.
						$("#authcode_status").css("color", "blue");
						$("#authcode_status").html('인증 성공');
						$("#mem_email").attr("readonly",true);
						$("#btn_sendAuthCode").attr("disabled", true);
						isCheckEmail = "true";  // 인증메일 유효성 검사에 사용하기위한 변수. 
						return;
						
					} else {
						$("#email_authcode").hide();
						$("#authcode_status").css("color", "red");
						$("#authcode_status").html('인증 실패. 다시 시도해주세요.');
						return;
					}
				}
			});
		});
		*/
		
		/* 회원가입 버튼 클릭 시 */ 
		$("#btn_submit").on("click", function(){
			
			var mem_id = $("#mem_id");
			var mem_pw = $("#mem_pw");
			var mem_pw_check = $("#mem_pw_check");
			var mem_name = $("#mem_name");
			var mem_nick = $("#mem_nick");
			var mem_email = $("#mem_email");
			// var mem_authcode = $("#mem_authcode");
			var mem_phone = $("#mem_phone");
			var mem_zipcode = $("input[name='mem_zipcode']");
			var mem_addr = $("input[name='mem_addr']");
			var mem_addr_d = $("input[name='mem_addr_d']");
			
			/* 유효성 검사 */
			if(mem_id.val()==null || mem_id.val()==""){
				alert("아이디를 입력해주세요");
				mem_id.focus();
				
			} else if(isCheckId =="false"){   // 아이디 중복기능 사용여부 확인
				alert("아이디 중복 체크를 해주세요.");
				$("#btn_checkId").focus();
				
			} else if(mem_pw.val()==null || mem_pw.val()==""){
				alert("비밀번호를 입력해주세요.");
				mem_pw.focus();
				
			} else if(mem_pw_check.val()==null || mem_pw_check.val()==""){
				alert("비밀번호 확인 란을 입력해주세요.");
				mem_pw_check.focus();
				
			} else if(mem_pw.val() != mem_pw_check.val()){
				alert("입력하신 비밀번호가 다릅니다.\n비밀번호를 다시 확인해주세요.");
				mem_pw_check.focus();

			} else if(mem_name.val()==null || mem_name.val()==""){
				alert("이름을 입력해주세요.");
				mem_name.focus();
			
			} else if(mem_nick.val()==null || mem_nick.val()==""){
				alert("닉네임을 입력해주세요.");
				mem_nick.focus();
			
			} else if(mem_email.val()==null || mem_email.val()==""){
				alert("이메일을 입력해주세요.");
				mem_email.focus();

			//  } else if(mem_authcode.val()==null || mem_authcode.val()==""){
			// 	alert("이메일 인증 확인 후 인증 코드를 입력해주세요.");
			// 	mem_authcode.focus();

			//  } else if(isCheckEmail=="false"){   // 이메일인증 확인여부
			// 	alert("이메일인증을 해주세요.");
			// 	$("#btn_sendAuthCode").focus(); 
			
			} else if(mem_phone.val()==null || mem_phone.val()==""){
				alert("휴대폰 번호를 입력해주세요.");
				mem_phone.focus();

			} else if(mem_zipcode.val()==null || mem_zipcode.val()==""){
				alert("우편번호를 입력해주세요.");
				$("#btn_postCode").focus();
				
			} else if(mem_addr.val()==null || mem_addr.val()==""){
				alert("주소를 입력해주세요.");
				$("#btn_postCode").focus();
				
			} else if(mem_addr_d.val()==null || mem_addr_d.val()==""){
				alert("상세 주소를 입력해주세요.");
				mem_addr_d.focus();

			} else {
				form.submit();  // 전송태그를 <button type="button"> 를 사용하여 서브밋메서들 호출함.
			}
		});
		
		$("#btn_cancel").on("click", function(){
			
			var result = confirm("가입을 취소하시겠습니까?");
			if(result){
				location.href="/"; 
			} else{}
		});
		
	});


  </script>
  <body>
    
<!-- nav.jsp -->
<%@include file="/WEB-INF/views/common/nav.jsp" %>

<main role="main" class="container">

  <div class="wrapper">
    <%-- Main content --%>
			<section class="content container-fluid">
				<div class="container" style="width: 70%; min-width: 900px; background-color: white; font-size: 14px;" >
					<form id="joinForm" action="/member/join" method="post">
						<div class="container" style="width: 800px; padding: 10% 5%;">
							<h2 class="form-signin-heading">Please Register</h2>
							<br><br>
							<div class="form-group" style="width:100%;">
								<label for="inputId">* 아이디</label> <br /> <input type="text"
									class="form-control" id="mem_id" name="mem_id"
									placeholder="아이디를 입력해 주세요"
									style="max-width:540px; width:calc(100% - 100px); margin-right: 5px; display: inline-block;">
								<button id="btn_checkId" class="btn btn-default" type="button">중복 확인</button>
								<p id="id_availability" style="color: red;"></p>
							</div>
							<div class="form-group">
								<label for="inputPassword">* 비밀번호</label> <input type="password"
									class="form-control" id="mem_pw" name="mem_pw"
									placeholder="비밀번호를 입력해주세요" style="max-width: 630px;">
							</div>
							<div class="form-group">
								<label for="inputPasswordCheck">* 비밀번호 확인</label> <input
									type="password" class="form-control" id="mem_pw_check"
									placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" style="max-width: 630px;" >
							</div>
							<div class="form-group">
								<label for="inputName">* 이름</label> <input type="text"
									class="form-control" id="mem_name" name="mem_name"
									placeholder="이름을 입력해 주세요" style="max-width: 630px;">
							</div>
							<div class="form-group">
								<label for="inputNickName">* 닉네임</label> <input type="text"
									class="form-control" id="mem_nick" name="mem_nick"
									placeholder="사용할 닉네임을 입력해 주세요" style="max-width: 630px;">
							</div>
							<div class="form-group">
								<label for="InputEmail">* 이메일 주소</label><br /> <input type="email"
									class="form-control" id="mem_email" name="mem_email"
									placeholder="이메일 주소를 입력해주세요"
									style="max-width: 630px; display: inline-block;">
								<!-- <button id="btn_sendAuthCode" class="btn btn-default" type="button" >이메일 인증</button>
								<p id="authcode_status" style="color: red;"></p> -->
							</div>
							<!-- 이메일 인증 요청을 하고 , 성공적으로 진행이 되면, 아래 div태그가 보여진다. -->
							<!--  <div id="email_authcode" class="form-group" style="display: none;">
								<label for="inputAuthCode">* 이메일 인증코드</label><br /> 
								<input type="text"
									class="form-control" id="mem_authcode" 
									placeholder="이메일 인증코드를 입력해 주세요" 
									style="max-width: 570px; width:calc(100% - 70px); margin-right: 5px; display: inline-block;" />
								<button id="btn_checkAuthCode" class="btn btn-default" type="button" >확인</button> 
							</div> -->
							<div class="form-group">
								<label for="inputMobile">* 휴대폰 번호</label> <input type="tel"
									class="form-control" id="mem_phone" name="mem_phone"
									placeholder="휴대폰 번호를 입력해 주세요" style="max-width: 630px;">
							</div>
							<div class="form-group">
								<label for="inputAddr">* 주소</label> <br />
								
								<input type="text" id="sample2_postcode" name="mem_zipcode" class="form-control" 
									style="max-width: 510px; width:calc(100% - 128px); margin-right: 5px; display: inline-block;" placeholder="우편번호" readonly>
								<input type="button" onclick="sample2_execDaumPostcode()" id="btn_postCode" class="btn btn-default" value="우편번호 찾기"><br>
								<input type="text" id="sample2_address" name="mem_addr" class="form-control" 
									placeholder="주소" style="max-width: 630px; margin:3px 0px;" readonly>
								<input type="text" id="sample2_detailAddress" name="mem_addr_d" class="form-control" 
									placeholder="상세주소" style="max-width: 630px;">
								<input type="hidden" id="sample2_extraAddress" class="form-control" 
									placeholder="참고항목">
								
								 <!-- 
								<input type="text" id="sample2_postcode" name="" class="form-control" placeholder="우편번호" readonly>
								<input type="button" onclick="sample2_execDaumPostcode()" name="" class="form-control" value="우편번호 찾기"><br>
								<input type="text" id="sample2_address" name="" class="form-control" placeholder="주소"><br>
								<input type="text" id="sample2_detailAddress" name="" class="form-control" placeholder="상세주소">
								<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
								 -->
							</div>
							<div class="form-group">
								<label>* 수신 동의</label><br /> 
								이벤트 등 프로모션 메일 알림 수신에 동의합니다.
								<label><input type="radio" name="mem_accept_e" value="Y" style="margin-left: 20px;" checked="checked"> 예</label>
	      						<label><input type="radio" name="mem_accept_e" value="N" style="margin-left: 20px;"> 아니오</label>
							</div>
						</div>
						<div class="form-group text-center">
							<button type="button" id="btn_submit" class="btn btn-primary">
								회원가입 <i class="fa fa-check spaceLeft"></i>
							</button>
							<button type="button" id="btn_cancel" class="btn btn-warning">
								가입취소 <i class="fa fa-times spaceLeft"></i>
							</button>
						</div>
						<br><br><br><br>
					</form>
				</div>
				
				<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
				<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
				
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script src="/js/member/postCode.js"></script>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
 

</main><!-- /.container -->
	
	
	<!-- footer -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
      
  </body>
</html>