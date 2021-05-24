<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
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
	<%@include file="/WEB-INF/views/common/config.jsp"%>
	
	<script src="/js/member/changePw.js"></script>

   	
	 

  </head>
  <body>
  

    
<!-- nav.jsp -->
<%@include file="/WEB-INF/views/common/nav.jsp" %>

<%@include file="/WEB-INF/views/common/mypage_nav.jsp" %>



<main role="main" class="container">

  <div class="wrapper">
  
			<section class="content container-fluid">
				<div class="container" style="width: 70%; min-width: 900px; background-color: white; font-size: 14px;" >
					<form id="changePwForm" action="/member/change_pwd" method="post">
						<div class="container" style="width: 800px; padding: 10% 5%;">
							<h2 class="form-signin-heading">비밀번호 변경</h2>
							<br><br>
							
							<div class="form-group">
								<input type= "hidden" name="mem_id" value="${sessionScope.loginStatus.mem_id}" />
								
								<label for="inputPassword">* 기존 비밀번호</label> <input type="password"
									class="form-control" id="mem_pw" name="mem_pw"
									placeholder="기존 비밀번호를 입력해주세요" style="max-width: 630px;">
							</div>
							
							<div class="form-group">
								<label for="inputPassword">* 변경 비밀번호</label> <input type="password"
									class="form-control" id="mem_pw_change" name="mem_pw_change"
									placeholder="변경할 비밀번호를 입력해주세요" style="max-width: 630px;">
							</div>
							
							
							<div class="form-group">
								<label for="inputPassword">* 변경 비밀번호 확인</label> <input type="password"
									class="form-control" id="mem_pw_check" name="mem_pw_check"
									placeholder="변경할 비밀번호를 다시 한 번 입력해주세요" style="max-width: 630px;">
							</div>							
							
						</div>
						
						<br><br>			
						
						<div class="form-group text-center">
								<button type="button" id="btn_submit" class="btn btn-dark">
									비번변경 <i class="fa fa-check spaceLeft"></i>
								</button>
								
						</div>
						
						</form>	
						
				</div>
				
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		
</main><!-- /.container -->


	<!-- footer -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
      
  </body>
</html>