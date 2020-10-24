<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!-- Header 2 -->
<header class="bg-dark header_2">
	<div class="container pt-50 pb-50">
		<div class="store_header">
			<h1 class="big color-white text-center" data-aos="fade-up"
				data-aos-delay="0">관리자 페이지</h1>
		</div>
	</div>
</header>

<section class="pt-105 pb-90 bg-light text-center showcase_2">
	<!--정보 출력 버튼-->

	<button id="member_list_button" type="button"
		class="btn btn-outline-danger text-white active border btn-lg">
		&nbsp;&nbsp;&nbsp;&nbsp;회원 관리&nbsp;&nbsp;&nbsp;&nbsp;</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button id="store_list_button" type="button"
		class="btn btn-danger text-white border btn-lg text-dark">
		&nbsp;&nbsp;&nbsp;&nbsp;매장 관리&nbsp;&nbsp;&nbsp;&nbsp;</button>

	<!--사용자 관리 보기-->
	<div id="member_list" class="container px-xl-0 pt-40">
		<h2 class="pb-40">회원 관리</h2>
<!-- 		<input type="text" class="input border text-dark placeholder-heading" -->
<!-- 			placeholder="아이디 검색" /> -->
<!-- 		<button type="button" -->
<!-- 			class="btn btn-danger text-white border btn-lg text-dark"> -->
<!-- 			검색하기</button> -->
		<table id="memberTable" class="table table-bordered text-justify text-center mt-20">
			
			
		</table>

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
	
	
	
	<!-- 매장관리 수정-->
	<div id="store_list_info" class="container px-xl-0 pt-40 d-none">
		<h2 class="pb-40">매장 관리</h2>
<!-- 		<input type="text" class="input border text-dark placeholder-heading" -->
<!-- 			placeholder="매장 검색" /> -->
<!-- 		<button type="button" -->
<!-- 			class="btn btn-danger text-white border btn-lg text-dark"> -->
<!-- 			검색하기</button> -->
		<table id="storeTable" class="table table-bordered text-justify text-center mt-20">
			
		</table>

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>

</section>

<script type="text/javascript">

	
		
	
	$('#member_list_button').on('click', function() {
		
		$.ajax({
			url : '<%=request.getContextPath()%>/admin/adminSearchMember.do',
			type : 'post',
			dataType : 'JSON',
			success : function(res) {
				$('#memberTable').empty();
				
				memberTable = '<tr class="bg-gray"><th></th><th>회원명</th><th>아이디</th><th>이메일</th>	<th>연락처</th><th>회원 벤하기</th></tr>'
				
				//for(var i =0; i < res.length; i++){
				$.each(res, function(i){
					    memberTable += '<tr class="text-center">' 	
						memberTable += '<td class="mem_num  mem_num2 align-middle">'+res[i].mem_num+'</td>'
						memberTable += 	'<td class="align-middle">'+res[i].mem_name+'</td>'
						memberTable += '<td class="align-middle"><a href="">'+res[i].mem_id+'</a></td>'
						memberTable += 	'<td class="align-middle">'+res[i].mem_email+'</td>'
						memberTable += '<td class="align-middle">'+res[i].mem_tel+'</td>'
						memberTable += 	'<td class="align-middle">'
						
						
						if(res[i].mem_quit_gb == 0){
							
							memberTable += 	'<button type="button" class="mem_ban_btn mem_ban_btn2 btn btn-outline-danger text-dark border btn-sm" >'
							memberTable += 	'회원 벤</button></td></tr>'
						}
						
						else{
							memberTable += 	'<button type="button" class="mem_ban_btn mem_ban_btn2 btn btn-outline-danger text-dark border btn-sm" >'
							memberTable += 	'회원 벤풀기</button></td></tr>'
						}
						
					   
				})
				
				$('#memberTable').append(memberTable);
			}
		});
	});
	//회원벤 
	$(document).on('click',".mem_ban_btn", function(){
		var caption = $(this).text();
		
		mem_num = $(this).parents('tr').find('.mem_num').text();
		var btn = this; 
		if(caption=="회원 벤"){
			
		//alert("벤")
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/ChangeGB.do',
				type : "get",
				data : {"mem_num" : mem_num},
				success : function(res){
					
						//memberTable = 	'<button type="button" class="mem_ban_btn btn btn-outline-danger text-dark border btn-sm" >'
						//memberTable += 	'회원 벤풀기</button>'
						//$(this).parent().append(memberTable);
						
						$(btn).text("회원 벤풀기");
				},
				error : function(req){
					alert("req :" +req.status)
				},
				dataType : "json"
				
			});
		}else{
			//alert("벤풀기")
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/ChangeGB2.do',
				type : "get",
				data : {"mem_num" : mem_num},
				success : function(res){
					
						//memberTable = 	'<button type="button" class="mem_ban_btn btn btn-outline-danger text-dark border btn-sm" >'
						//memberTable += 	'회원 벤풀기</button>'
						//$(this).parent().append(memberTable);
						
						$(btn).text("회원 벤")
						
						
					
				},
				error : function(req){
					alert("req :" +req.status)
				},
				dataType : "json"
				
			})
		}
	})

	
	$('#store_list_button').on('click', function() {
		$.ajax({
			url : '<%=request.getContextPath()%>/admin/adminSearchStore.do',
			type : 'post',
			dataType : 'JSON',
			
			
			success : function(res) {
				$('#storeTable').empty();
				
				brand=["맥도날드","롯데리아","버거킹","맘스터치","파파이스"];
				
				
				
				storeTable = '<tr class="bg-gray"><th></th><th>가게 브랜드</th><th>가게 명</th><th>점주 아이디</th><th>연락처</th><th>가게 승인하기</th></tr>'
				for(var i =0; i < res.length; i++){
					
					
					
					storeTable += '<tr class="text-center">'
					storeTable += '<td class="align-middle">' + i+1 + '</td>'
					storeTable += '<td class="align-middle">' + brand[ parseInt(res[i].sto_brand) - 1] + '</td>'
					storeTable += '<td class="align-middle">' + res[i].sto_name + '</td>'
					storeTable += '<td class="align-middle store_num">' + res[i].sto_mem_num + '</td>'
					storeTable += '<td class="align-middle">' + res[i].sto_tel + '</td>'
					storeTable += '<td class="align-middle">'
					if(res[i].sto_access_gb ==1){
						storeTable += '<button type="button" class="btn_store btn btn-outline-danger text-dark border btn-sm">승인하기</button>'
	
					}
					
					storeTable += '</td></tr>'
				}
				$('#storeTable').append(storeTable);				
			}
		});
	});
	$(document).on("click",".btn_store", function(){
		store_num = $(this).parents('tr').find('.store_num').text();
		var caption = $(this).text();
		var btn = this;
		
		if(caption == "승인하기"){
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/StoreChange.do',
				type : "get",
				data : {"store_num" : store_num},
				success : function(res) {
					alert("승인완료");
					$(btn).hide();
				},
				error : function(req){
					alert("req :" +req.status)
				},
				dataType : "json"
			
			})
		}
			
		
		
		
	});
	
	

</script>


	<%@ include file="footer.jsp"%>
