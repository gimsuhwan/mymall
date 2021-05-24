<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    


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
      
      	
      
      	.icon-bar {
		  width: 100%;
		  background-color: #555;
		  overflow: auto;		 
		  
		}
		
		.icon-bar a {
		  float: left;
		  width: 20%;
		  text-align: center;
		  padding: 12px 0;
		  transition: all 0.3s ease;
		  color: white;
		  font-size: 15px;
		}
		
		.icon-bar a:hover {
		  background-color: #000;
		}
		
      
     </style>
     
     
     
     <script>
	
		$(document).ready(function(){
		
			$("#mem_delete").on("click", function(){
				
				var result = confirm("회원 정보 정말 삭제하시겠습니까?");
				if(result){
					location.href="/member/delete"; 
				} else{
					location.href="/";
				}
				
			});
			
		});
	
	</script>
	
	




	<div class="container">
	
	
		<div class="icon-bar">
		  <a href="/member/modify"><i class="fa fa-user"></i>
		  	<p>회원정보</p>
		  </a> 
		  <a href="#"><i class="fa fa-bars"></i>
		   <p>주문정보</p>
		  </a> 
		  <a href="#"><i class="fa fa-pencil-square"></i>
		   <p>상품후기</p>
		  </a> 
		  <a href="/member/change_pwd"><i class="bi bi-key"></i>
		   <p>비밀번호변경</p>
		  </a>		  
		  <a href="#" id="mem_delete"><i class="bi bi-trash"></i>
		   <p>회원삭제</p>
		  </a>
		</div>

	</div>	
 
 

