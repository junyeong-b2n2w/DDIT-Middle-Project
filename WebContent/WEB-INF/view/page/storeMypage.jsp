<%@page import="mukgo.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!-- Header 2 -->
<header class="bg-dark header_2">
	<div class="container pt-50 pb-50">
		<div class="store_header">
			<h1 class="big color-white text-center" data-aos="fade-up"
				data-aos-delay="0">지점 관리 페이지</h1>
		</div>
	</div>
</header>

<section class="pt-105 pb-90 bg-light text-center showcase_2">
	<!--정보 출력 버튼-->


	<button id="order_list_button" type="button"
		class="btn btn-outline-danger text-white active border btn-lg">
		&nbsp;&nbsp;&nbsp;&nbsp;주문상세&nbsp;&nbsp;&nbsp;&nbsp;</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button id="store_info_button" type="button"
		class="btn btn-danger text-white border btn-lg text-dark">
		&nbsp;&nbsp;&nbsp;&nbsp;매장 정보 관리&nbsp;&nbsp;&nbsp;&nbsp;</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button id="store_review_button" type="button"
		class="btn btn-danger text-white border btn-lg text-dark">
		&nbsp;&nbsp;&nbsp;&nbsp;리뷰 관리&nbsp;&nbsp;&nbsp;&nbsp;</button>
<!-- 	&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 	<button id="sales_button" type="button" -->
<!-- 		class="btn btn-danger text-white border btn-lg text-dark"> -->
<!-- 		&nbsp;&nbsp;&nbsp;&nbsp;매출 관리&nbsp;&nbsp;&nbsp;&nbsp;</button> -->




	<!--주문 관리 보기-->
	<div id="order_list" class="container px-xl-0 pt-40 ">
		<h2 class="pb-40">주문 관리</h2>
		<input type="text" class="input border text-dark placeholder-heading"
			placeholder="주문상태  검색">
		<button type="button"
			class="btn btn-danger text-white border btn-lg text-dark">검색하기</button>

		<table class="table table-bordered text-justify text-center mt-20"
			id="orderTable">
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
	<!-- 매장정보 수정-->
	<div id="store_info" class="container px-xl-0 pt-40 d-none">

		<h2 class="pb-40">매장 정보 관리</h2>

		<div id="store_info_div">
			<form>
				<input type="text" id="sto_num" name="sto_num" hidden> <input
					type="text" id="sto_brand" name="sto_brand" hidden>

				<div class="form-group row">
					<label for="inputStoreName" class="col-sm-4 col-form-label">매장이름</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" readonly id="sto_name"
							name="sto_name">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputStoreTel" class="col-sm-4 col-form-label">매장전화번호</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" readonly id="sto_tel"
							name="sto_tel">
					</div>
				</div>



				<fieldset class="form-group">
					<div class="row">
						<legend class="col-form-label col-sm-4 pt-0">배달여부</legend>
						<div class="col-sm-6">
							<div class="form-check d-inline-block">
								<input class="form-check-input d-none" disabled type="radio"
									name="sto_delivery_gb" id="storeDeli1" value="1"> <label
									class="form-check-label" for="storeDeli1"> 예 </label>
							</div>
							<div class="form-check  d-inline-block">
								<input class="form-check-input d-none" disabled type="radio"
									name="sto_delivery_gb" id="storeDeli2" value="0"> <label
									class="form-check-label" for="storeDeli2"> 아니요 </label>
							</div>

						</div>
					</div>
				</fieldset>

				<fieldset class="form-group">
					<div class="row">
						<legend class="col-form-label col-sm-4 pt-0">드라이브 쓰루 여부</legend>
						<div class="col-sm-6">
							<div class="form-check d-inline-block">
								<input class="form-check-input d-none" disabled type="radio"
									name="sto_dt_gb" id="storeDt1" value="1"> <label
									class="form-check-label" for="storeDt1"> 예 </label>
							</div>
							<div class="form-check  d-inline-block">
								<input class="form-check-input d-none" disabled type="radio"
									name="sto_dt_gb" id="storeDt2" value="0"> <label
									class="form-check-label" for="storeDt2"> 아니요 </label>
							</div>

						</div>
					</div>
				</fieldset>

				<div class="form-group row">
					<label for="inputStoreTel" class="col-sm-4 col-form-label">운영시간</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" readonly
							id="sto_opentoclose" name="sto_opentoclose">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputStoreTel" class="col-sm-4 col-form-label">위도</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" readonly id="sto_pos_x"
							name="sto_pos_x">

					</div>
				</div>
				<div class="form-group row">
					<label for="inputStoreTel" class="col-sm-4 col-form-label">경도</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" readonly id="sto_pos_y"
							name="sto_pos_y">
					</div>
				</div>


				<div class="form-group row">
					<label for="inputStoreTel" class="col-sm-4 col-form-label"></label>
					<div class="col-sm-4">
						<button type="button" id="map_btn"
							class="btn btn-primar border text-dark d-none"
							data-toggle="modal" data-target="#mapModal">지도열기</button>
					</div>
				</div>





				<div class="form-group row">
					<div class="col-sm-10">
						<button type="button" id="infoEditBtn"
							class="btn btn-primar border text-dark">정보수정</button>
						<button type="button" id="infoUpdateBtn"
							class="btn btn-primar border text-dark d-none">정보수정</button>
					</div>
				</div>
			</form>
		</div>
</div>



		<!-- 매장 리뷰 수정-->
		<div id="store_review" class="container px-xl-0 pt-40 d-none">

			<h2 class="pb-40">매장 리뷰 관리</h2>
			<input type="text" class="input border text-dark placeholder-heading"
				placeholder="리뷰 검색">
			<button type="button"
				class="btn btn-danger text-white border btn-lg text-dark">검색하기</button>

			<table id="storeReview" class="table table-bordered mt-20">

			</table>
		</div>

		<!-- 매출 정보 수정-->
		<div id="sales" class="container px-xl-0 pt-40 d-none">

			<h2 class="pb-40">매출 관리</h2>


		</div>
</section>

<!--  지도 모달 -->
<div class="modal fade" id="mapModal" tabindex="-1"
	aria-labelledby="mapModalLable" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="mapModalLable">위치를 선택해 주세요</h4>

				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-justify mx-30">
				<div id="map" style="width: 100%; height: 600px;"></div>
				<p id="result"></p>
			</div>
			<div class="modal-footer">
				<button type="button"
					class="btn btn-outline-danger text-dark border btn-sm"
					data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3884405e456b656703a94dfd63808e89"></script>
<script>
	$("#orderTable").on("click", ".btnDeli", function() {
		status = $(this).text()
		ordNum = $(this).parents(".trDeli").find(".ord_num").text()
		$.ajax({
			url : '<%=request.getContextPath()%>/deliStatus.do',
			data : {"ordNum" : ordNum},
			type : 'post',
			success : function() {
				
			}
		})
		location.reload()
	})
	$('#order_list_button').on('click', function() {
		mem_sto_num = <%=((MemberVO)session.getAttribute("memvo")).getMem_sto_num()%> ;
		$.ajax({
			url:'<%=request.getContextPath()%>/user/storeOrder.do',
			data : {'mem_sto_num' : mem_sto_num},
			type : 'post',
			dataType : 'JSON',
			success : function(res) {
				$('#orderTable').empty();
				orderTable = '<tr class="bg-gray"><th class="w-100">주문번호</th><th class="w-100">주문일시</th><th class="w-250">주문품목 및 수량	</th><th class="w-300">요청사항</th><th class="w-100">배달상태</th></tr>'
				$.each(res, function(i) {
					orderTable += '<tr class="text-center trDeli">'
					orderTable += '<td class="align-middle ord_num">' + res[i].ord_num + '</td>'
					orderTable += '<td class="align-middle">' + res[i].ord_date + '</td>'
					orderTable += '<td class="align-middle">' + res[i].menu+ ' 등 '+ res[i].ord_count + '개 </td>'
					if(res[i].ord_please=="null"){
						orderTable += '<td class="align-middle">요청사항이 없습니다.</td>'
					}else{
						orderTable += '<td class="align-middle">' + res[i].ord_please + '</td>'
					}
					if(res[i].deli_status =="신규주문"){
						orderTable += '<td class="align-middle"><button type="button" class="btn btn-outline-danger text-dark border btn-sm btnDeli" value="' + res[i].deli_status + '">' + res[i].deli_status + '</button></td>'
					}else{
						orderTable += '<td class="align-middle"><button type="button" class="btn btn-outline-danger text-dark border btn-sm btnDeli" value="' + res[i].deli_status + '" disabled>' + res[i].deli_status + '</button></td>'
					}						
				})
				$('#orderTable').append(orderTable);
			}
		});
	});
	
	$('#store_info_button').on('click', function() {
		mem_sto_num = <%=((MemberVO) session.getAttribute("memvo")).getMem_sto_num()%>;
		
		$.ajax({
			url:'<%=request.getContextPath()%>/user/storeInformation.do',
			data : {'mem_sto_num' : mem_sto_num},
			type : 'post',
			dataType : 'JSON',
			success : function(res) {
				console.log(res.sto_num)
				$('#sto_num').val(res.sto_num);
				$('#sto_name').val(res.sto_name);
				$('#sto_tel').val(res.sto_tel);
				$('#sto_delivery_gb').val(res.sto_delivery_gb);
				$('#sto_opentoclose').val(res.sto_opentoclose);
				$('#sto_pos_x').val(res.sto_pos_x);
				$('#sto_pos_y').val(res.sto_pos_y);
				$('#sto_brand').val(res.sto_brand);
				res.sto_dt_gb == 1 ? $('#storeDt1').prop('checked',true) : $('#storeDt2').prop('checked',true) ;
				res.sto_delivery_gb == 1 ? $('#storeDeli1').prop('checked',true) : $('#storeDeli2').prop('checked',true);
			}
		});
	});
	
	
	
	
	$('#store_review_button').on('click', function() {
		mem_sto_num = <%=((MemberVO) session.getAttribute("memvo")).getMem_sto_num()%>;
		
		$.ajax({
		url:'<%=request.getContextPath()%>/review/storeReview.do',
		data : {'sto_num' : mem_sto_num},
		type : 'post',
		dataType : 'JSON',
		success : function(res) {
			$('#storeReview').empty();
				reviewTable="";
			for(var i =0; i < res.length; i++){
				reviewTable += '<tr class=""><td class="text-justify">'
// 					reviewTable += '<div class="store_img pt-10 pb-10 d-inline-block w-200">'
// 					reviewTable += '<img src="i/showcase_2_img_1.jpg" width="150px" /></div>'
					reviewTable += '<div class="review_content d-inline-block pl-50 pr-50 w-750">'
					reviewTable += '<h5 class="review_menu d-inline-block">' + res[i].menu_name  + " 외 "+ res[i].menu_num + "건"+ '</h5>'
					
					reviewTable += '&nbsp;&nbsp;&nbsp;&nbsp; <span class="review_stars cont">⭐&nbsp;'+ res[i].rev_star + '</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="text-muted">'+ res[i].rev_date.split(" ")[0]+'</span><br />'
					reviewTable += '<div class="review_content pt-20 d-inline-block">'+ res[i].rev_content +'</div></div>'
					
					reviewTable += '<div class="review_reply_button d-inline-block w-150">'
						//reviewTable += '<button type="button" class="btn btn-outline-danger bg-dark border btn-sm">댓글</button>'
					reviewTable += '</div></td></tr>'
				
				
				
			
				
			}
			$('#storeReview').append(reviewTable);
		  }
		});
	});
	
	$('#map_btn').on('click', function(){
		
	})
	
	
	$('#infoEditBtn').on('click', function(){
		$(':input').attr('readonly',false);
		$(':input').prop('disabled',false);
		$(this).addClass('d-none');
		
		$('#infoUpdateBtn , #map_btn').removeClass('d-none');
	})
	
	
	
	$('#infoUpdateBtn').on('click', function(){
		$.ajax({
			url : '<%=request.getContextPath()%>/user/storeInfoUpdateAction.do',
			data : {
				"sto_num" : $('#sto_num').val(),
				"sto_name" :$('#sto_name').val(),
			"sto_tel":	$('#sto_tel').val(),
				"sto_delivery_gb" : $('input[name=sto_delivery_gb]').val(),
				"sto_dt_gb" : $('input[name=sto_dt_gb]').val(),
			"sto_opentoclose" : $('#sto_opentoclose').val(),
				"sto_pos_x": $('#sto_pos_x').val(),
				"sto_pos_y" : $('#sto_pos_y').val(),
				"sto_brand" : $('#sto_brand').val()
			},
			dataType : 'json',
			type : 'post',
			success : function(res){
				
			}
			
		})
		
		location.reload();
	})
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(36.3239981936622, 127.419), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng;
    
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv = document.getElementById('result'); 
    resultDiv.innerHTML = message;
    
    $('#sto_pos_x').val(latlng.getLat());
    $('#sto_pos_y').val(latlng.getLng());
    
});
	
</script>
<%@ include file="footer.jsp"%>