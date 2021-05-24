<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">


<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>마이몰</title>

<%@include file="/WEB-INF/views/common/config.jsp"%>
<script>
	var message = '${status}';

	if (message == 'loginSuccess') {
		alert('로그인이 되었습니다.');
	} else if (message == 'loginIDFail') {
		alert('아이디가 틀립니다.');
	} else if (message == 'loginPWFail') {
		alert('비밀번호가 틀립니다.');
	} else if (message == 'logout') {
		alert('로그아웃되었습니다.');
	} else if (message == 'modifySuccess') {
		alert('회원수정이 되었습니다.');
	} else if (message == 'insertSuccess') {
		alert('회원가입이 되었습니다.');
	} else if (message == 'regdelete') {
		alert('회원삭제가 되었습니다.');
	} else if (message == 'changepwd') {
		alert('비밀번호가 변경 되었습니다.');
	}
</script>

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

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

/* footer{
	font-size: small;
}



ul{
	list-style:none;

}

li{
	display: inline-block;
	margin: -2.9px;
	margin-right: 30px;
	
} */

</style>

</head>
<body>

	<!-- nav.jsp -->
	<%@include file="/WEB-INF/views/common/nav.jsp"%>

	<main role="main" class=".container-fluid">

		<div class="row">
			<!-- 카테고리 목록 -->
			<div class="col-2" style="background-color: white; color:black;">
				<%@include file="/WEB-INF/views/common/category_list.jsp"%>
			</div>

			<!-- carousel -->
			<div class="col-10">

				<div id="carouselExampleInterval" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" data-interval="2000">
							<img
								src="https://celecon.wisacdn.com/_data/banner/user_group_banner/celecon_kor_live/96/78936283da6fd82e08f9952e0e54facc.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" data-interval="2000">
							<img
								src="https://celecon.wisacdn.com/_data/banner/user_group_banner/celecon_kor_live/96/5189c25882f5d9b3c871ab5740ac281a.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" data-interval="2000">
							<img
								src="https://celecon.wisacdn.com/_data/banner/user_group_banner/celecon_kor_live/96/eb7f390beba3d9a44950e9b0bbefb5c9.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" >
							<img
								src="https://celecon.wisacdn.com/_data/banner/user_group_banner/celecon_kor_live/96/e7cc92dc6c58805351a4fa7398d6c645.jpg"
								class="d-block w-100" alt="...">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleInterval"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleInterval"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

			</div>
			
		</div>
		
		
		<!-- content -->
		
		<hr>
		
		<div class="row">			
			<div class="col-5" id="position">
				<h2>가정愛달 선물특집!</h2>
				<p>특별한 선물을 전하세요! GIFT FOR YOU!</p>				
			</div>
			<div class="col-7">
				<img alt="" src="https://media.gucci.com/content/PromoComponent_Standard_1264x790/1614186012/PromoComponent_KaiCapsule-06_001_Default.jpg" class="w-100">
			</div>
		</div>
		
		<hr>
		
		<div class="row" style="text-align:center">
			<div class="col-4">
				<img alt="" src="http://img.ssgcdn.com/trans.ssg?src=/cmpt/banner/202104/2021041613424433072168849216_830.jpg&w=400&h=240&edit=c&t=4d87dbf59e2e77afa5fe07c8f6e5be499bc78b8f">
				<h4>혼가먼트 신규 오픈</h4> <p>캘리포니아 감성의 럭셔리 골프웨어</p>
			</div>
			<div class="col-4">
				<img alt="" src="http://img.ssgcdn.com/trans.ssg?src=/cmpt/banner/202104/2021042210083188365273909527_341.jpg&w=400&h=240&edit=c&t=62693045c71cba268e7c2fff32a22e856928b58e">
				<h4>남자들을 위한 기획전</h4><p>#트랜디브랜드 #SUMMER_PREVIEW</p>
			</div>
			<div class="col-4">
				<img alt="" src="http://img.ssgcdn.com/trans.ssg?src=/cmpt/banner/202104/2021042015002074323325196332_352.jpg&w=400&h=240&edit=c&t=ed32e94f8074636e542ca44b7fa1ca20356be03f">
				<h4>지오다노X컨셉원</h4> <p>패밀리세일 최대 75% OFF + 쿠폰혜택</p>
			</div>
		</div>
		
		<hr>
		
		<div class="row" style="text-align:center">
			<div class="col-4">
				<img alt="" src="http://img.ssgcdn.com/trans.ssg?src=/cmpt/banner/202103/2021030102422802451141067114_101.jpg&w=400&h=240&edit=c&t=c13f766fc5e5f6833c7fe80fa104d874ef3b082b">
				<h4>스케쳐스</h4><p>#스케쳐스 #인기상품 모음 #인기&신상&특가 #메모리폼</p>
			</div>
			<div class="col-4">
				<img alt="" src="http://img.ssgcdn.com/trans.ssg?src=/cmpt/banner/202104/2021040117383101982963581396_580.jpg&w=400&h=240&edit=c&t=2890966945f720b4b9b27e5e14f0d686f1826d27">
				<h4>게이즈샵 (GAZESHOP)</h4><p>스마트 라이프스타일 셀렉트샵</p>
			</div>
			<div class="col-4">
				<img alt="" src="http://img.ssgcdn.com/trans.ssg?src=/cmpt/banner/202104/2021042114001011623327815332_309.jpg&w=400&h=240&edit=c&t=be067d6b30e4c12b02464fb996c199841bf9089f">
				<h4>스포츠 패션&슈즈 페어</h4><p>나이키/아디다스/휠라/뉴발란스 外</p>
			</div>
		</div>
		
		
	</main>
	<!-- /.container -->

	<!-- footer -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
<!-- 	<hr>
	<footer class="main-footer p-3 mb-2 bg-dark text-white">
            <div class="container text-center">
				<div class="row">
					<div class="col-md-12">
						<ul class="main-footer-links-list-lg">
							<li>회사소개</li>
							<li>개인정보취급방침</li>
							<li>이용약관</li>
							<li>고객센터</li>
							<li>광고/제휴 안내</li>
							<li>이용안내</li>												
		                  </ul>
		              </div>              
		          </div>
                <div class="row">
		          	<div class="col-md-12">
						<p>주소 : 서울 강남구 역삼동 | 사업자등록번호 : 123-10-789143</p>
						<p>통신판매업신고번호 : 41-456-2589 | 개인정보관리자 : 홍길동 | 대표 : 홍길동 | 상호명 :
							MYMALL</p>
						<p>전화번호 : 02-777-7777 | 팩스번호 : 02-8888-8888 | 메일 : admin@mymall.co.kr</p>
					</div>
            	 </div>
       
        </footer> -->
	
	


</body>
</html>