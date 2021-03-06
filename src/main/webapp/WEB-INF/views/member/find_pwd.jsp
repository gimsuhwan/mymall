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
    <title>마이몰</title>

<%@include file="/WEB-INF/views/common/config.jsp" %>

 
   
<meta name="theme-color" content="#563d7c">

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
  <body>
    
<!-- nav.jsp -->
<%@include file="/WEB-INF/views/common/nav.jsp" %>

<div role="main" class="container">

    <!-- Content Wrapper. Contains page content -->
		<div class="wrapper">
			<%-- Main content  로그인 UI --%>
			<section class="content container-fluid">
				<div class="container" style="width: 450px; height:620px; background-color: white; margin-top:30px;">
						<h2 class="form-signin-heading">Please PW Search</h2>
						<br><br>
						<label for="mem_id" class="sr-only">Id</label> 
						<input type="text" id="mem_id" name="mem_id" class="form-control" style="margin-bottom: 15px"
							placeholder="Id" required autofocus> 
						<label for="mem_name" class="sr-only">Name</label> 
						<input type="text" id="mem_name" name="mem_name" class="form-control"
							placeholder="Name" required>
						<br><br>
						<button id="btn_PW_Search" class="btn btn-lg btn-outline-dark btn-block" type="submit"  >
							Search PW
						</button>
						<p id="result" style="color:red;text-align: center;"></p>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
  </div>



<script>
    // 비밀번호 찾기 : 메일전송
    $("#btn_PW_Search").on("click", function(){

        $.ajax({
            url : '/member/pw_search',
            type: 'get',
            data: {id : 'user01'},
            dataType: 'text',
            success: function(data){
                // 비밀번호 출력작업

                if(data == "SUCCESS"){
                    alert("가입하신 메일로 전송하였습니다.");

                }else{
                	 alert("입력하신 정보가 틀립니다.");
                }
            }
        });
    });

    </script>
      
      
      <!-- footer -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
      
  </body>
</html>