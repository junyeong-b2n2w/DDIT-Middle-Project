<%@page import="mukgo.vo.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	List<StoreVO> vo = (List<StoreVO>)request.getAttribute("");
%>
    <!-- Header 2 -->
    <header class="bg-dark header_2">
      <div class="container pt-50 pb-50">
        <div class="store_header">
          <h1 id="store_name"
            class="big color-white text-center"
            data-aos="fade-up"
            data-aos-delay="0"
          ><input type="hidden" id="stoNum">
            <img/>
          </h1>
        </div>
      </div>
    </header>

    <section class="pt-105 pb-90 bg-light text-center showcase_2">
      <!--정보 출력 버튼-->
      <button
        id="menu_button"
        type="button"
        class="btn btn-danger text-white border btn-lg active"
      >
        &nbsp;&nbsp;&nbsp;&nbsp;메뉴&nbsp;&nbsp;&nbsp;&nbsp;
      </button>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <button
        id="review_button"
        type="button"
        class="btn btn-outline-danger text-dark border btn-lg"
      >
        &nbsp;&nbsp;&nbsp;&nbsp;리뷰&nbsp;&nbsp;&nbsp;&nbsp;</button
      >&nbsp;&nbsp;&nbsp;&nbsp;
      <button
        id="store_button"
        type="button"
        class="btn btn-outline-danger text-dark border btn-lg"
      >
        가게정보
      </button>

      <!-- 메뉴리스트-->
	<div id="menu_list" class="container px-xl-0 pt-40">
	<h2 class="pb-40">메뉴리스트</h2>
		<form>
			<div class="accordion ml-200" id="accordionExample">
				<div id = "menubox" class="card category_all">
					<div class="card-header category_name" id="headingOne">
						<h2 class="mb-0">
							<button class="btn btn-link btn-block text-left text-dark"
								type="button" data-toggle="collapse" data-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">
								메뉴그룹 1#</button>
						</h2>
					</div>
				
			

					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne">
						<div class="card-body text-justify">
							<div class="menu_item row pl-50">
								<div class="menu_text col-md-8">
									<span class="menu_name"><h4>메뉴 이름</h4></span><br /> <span
										class="menu_price">메뉴 가격</span><br />
								</div>
								<div class="menu_count col-md-auto te">
									<input type="number" min="0" max="10"
										class="border border-gray" value="0" />
									<button class="cnt_plus text-dark">+</button>
									<button class="cnt_minus text-dark">-</button>
								</div>
							</div>
							<hr />
							
						</div>
					</div>
				</div>

				<!-- <div class="card">
						<div class="card-header" id="headingTwo">

				<div class="card">
					<!-- <div class="card-header" id="headingTwo">

				<!--<div class="card">
					 <div class="card-header" id="headingTwo">

						<h2 class="mb-0">
							<button
								class="btn btn-link btn-block text-left collapsed text-dark"
								type="button" data-toggle="collapse" data-target="#collapseTwo"
								aria-expanded="true" aria-controls="collapseTwo">
								메뉴그룹 2#</button>
						</h2>
					</div>
					<div id="collapseTwo" class="collapse show"
						aria-labelledby="headingTwo">
						<div class="card-body">메뉴그룹 설명</div>
				
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h2 class="mb-0">
							<button
								class="btn btn-link btn-block text-left collapsed text-dark"
								type="button" data-toggle="collapse"
								data-target="#collapseThree" aria-expanded="false"
								aria-controls="collapseThree">메뉴그룹
								3#</button>
						</h2>
					</div>
					<div id="collapseThree" class="collapse show"
						aria-labelledby="headingThree">
						<div class="card-body">메뉴그룹 설명</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header" id="headingFour">
						<h2 class="mb-0">
							<button
								class="btn btn-link btn-block text-left collapsed text-dark"
								type="button" data-toggle="collapse" data-target="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour">
								메뉴그룹 4#</button>
						</h2>
					</div>
					<div id="collapseFour" class="collapse show"
						aria-labelledby="headingFour">
						<div class="card-body">메뉴그룹 설명</div>
					</div> -->
				</div-->
			</div>
		</form>

	</div>

	</div>

	</div> 


	<!--라뷰보기-->
      <div id="review_list" class="container px-xl-0 pt-40 d-none ">
        <h2 class="pb-40">리뷰</h2>
        <table id = "storeReview" class="table table-bordered ml-200">
          

          
        </table>
        
        </div>
        
       

	
      <!--가게 정보 보기-->
      <div id="store_info_list" class="container px-xl-0 pt-40 d-none">
        <h2 class="pb-40">가게 정보</h2>

        <div class="store_info_content text-justify pl-50 pr-50 ml-200">
          <h4 class="pt-40">가게소개</h4>
          <hr />
          <table>
            <tr>
              
               	<td id=storeinfo></td><td>점</td>
             
            </tr>
          </table>
          <hr />

          <h4 class="pt-40">업체정보</h4>
          <hr />
         <table>
            <tr>
              <td>영업시간</td>
              <td id="opentime"></td>
            </tr>
            <tr>
              <td>전화번호</td>
              <td id="sto_tel"></td>
            </tr>
            
          </table>

          <hr />

          <h4 class="pt-40">결제정보</h4>
          <hr />
          <table>
            <tr>
              <td>최소 주문금액</td>
              <td>10000</td>
            </tr>
            <tr>
              <td>결제수단</td>
              <td>신용카드 현금 요기서결제</td>
            </tr>
          </table>

        </div>
      </div>
    </section>

    
    
    <div class="position-fixed fixed-top w-300 px-15 border rounded" style="top:300px;left:100px" >
    	<h4 class="text-center mb-10 pt-15">장바구니</h4>
 
    	<table id="cartTable" class="table text-center ">
    		
    	</table>
    	<div id="cartDiv" class="text-center pb-15">
    		<h5 class="text-center">장바구니가 비었습니다</h5>
    	</div>
    </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	sto_num = <%=request.getParameter("sto_num")%>;
	
	
	
	$.ajax({
 		url : "/NullJAVA/user/storeSelectOne.do",
 		type : "get",
 		dataType : "json",
 		data : {"sto_num" : sto_num},
 		success : function(res) {
 			$('#storeinfo').text(res.sto_name);
			$('#store_name').text(res.sto_name);
			$('#opentime').text(res.sto_opentoclose);
			$('#sto_tel').text(res.sto_tel);
			$('#stoNum').val(res.sto_num)
		},
		error : function(req) {
			
		}
 		
 	});
	
	var menuList = new Array();
	 $.ajax({
		// 메뉴
		
		
		
		url : "/NullJAVA/user/storemenuprint.do",
		type : "get",
		dataType : "json",
		data : {"sto_num" : sto_num},
		success : function(res) {
			
			code1 = "";
			code2 = "";
			code3 = "";
			
			
			
		
			code = "";
			code1 += '<div class="card-header category_name" id="headingOne1">';
			code1 += '<h2 class="mb-0">';
			code1 += 	'<button class="btn btn-link btn-block text-left text-dark"';
			code1 += 		'type="button" data-toggle="collapse" data-target="#collapseOne"';
			code1 += 		'aria-expanded="true" aria-controls="collapseOne">버거</button></h2></div>';
			
			code2 += '<div class="card-header category_name" id="headingOne2">';
			code2 += '<h2 class="mb-0">';
			code2 += 	'<button class="btn btn-link btn-block text-left text-dark"';
			code2 += 		'type="button" data-toggle="collapse" data-target="#collapsetwo"';
			code2 += 		'aria-expanded="true" aria-controls="collapsetwo">버거&세트</button></h2></div>';
			 
			
			code3 += '<div class="card-header category_name" id="headingOne3">';
			code3 += '<h2 class="mb-0">';
			code3 += 	'<button class="btn btn-link btn-block text-left text-dark"';
			code3 += 		'type="button" data-toggle="collapse" data-target="#collapsethree"';
			code3 += 		'aria-expanded="true" aria-controls="collapsethree">사이드&디저트</button></h2></div>';
			
			
			
			

			
			$(res).each(function() {
				menuList.push(this);
				
				
				code += '<div id="collapseOne" class="collapse show" aria-labelledby="headingOne">';
				code += 	'<div class="card-body text-justify pb-0">';
				code += 		'<div class="menu_item row pl-50">';
				code += 			'<div class="menu_text col-md-8"><span class="menu_num d-none">'+this.menu_num+'</span>';
				code += 			'<h4><span class="menu_name">'+ this.menu_name +'</span></h4><br /> <span class="menu_price">'+ this.menu_price +'</span>&nbsp;Won<br /></div>';
				code +=   			'<h4 class="align-middle d-inline"><span class="menu_cal">'+ this.menu_cal +'</span>cal</h4><br />'
				code += 			'<div class="menu_count col-md-auto ">';
				code += 				'<input type="number" min="0" max="10" class="itemCount border align-middle border-gray" value="0" />';
				
				code += 		'</div></div><hr /></div></div>';
				
				switch (this.menu_category) {
				case "버거":
					code1 += code;
					break;
				case "버거&세트":
					code2 += code;
					break;		
				case "사이드&디저트":
					code3 += code;
					break;

				}
				
				code = "";
			});
			
			
			result = code1 + code2 + code3;
			
			$("#menubox").html(result);
		},
		error : function(req) {
		
		}
		
	}); 
	

	 $.ajax({
			url:'<%=request.getContextPath()%>/review/storeReview.do',
			data : {'sto_num' : '<%=request.getParameter("sto_num")%>'},
			type : 'post',
			dataType : 'JSON',
			success : function(res) {
				$('#storeReview').empty();
				reviewTable = "";
				for(var i =0; i < res.length; i++){
					reviewTable += '<tr class=""><td class="text-justify">'
// 					reviewTable += '<div class="store_img pt-10 pb-10 d-inline-block w-200">'
// 					reviewTable += '<img src="i/showcase_2_img_1.jpg" width="150px" /></div>'
					reviewTable += '<div class="review_content d-inline-block pl-50 pr-50 w-750">'
					reviewTable += '<h5 class="review_menu d-inline-block">' + res[i].menu_name  + " 외 "+ res[i].menu_num + "건"+ '</h5>'
					
					reviewTable += '&nbsp;&nbsp;&nbsp;&nbsp; <span class="review_stars cont">⭐&nbsp;'+ res[i].rev_star + '</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="text-muted">'+ res[i].rev_date.split(" ")[0]+'</span><br />'
					reviewTable += '<div class="review_content pt-20 d-inline-block">'+ res[i].rev_content +'</div></div>'
					
					reviewTable += '<div class="review_reply_button d-inline-block w-150">'
					reviewTable += '</div></td></tr>'
					
				}
				$('#storeReview').append(reviewTable);
			  }
			});

	 
	 cart=[];
	 
	$(document).on('change','.itemCount',function(){
		console.log( $(this).parents('.card-body').find('.menu_num').text() );
		console.log( $(this).parents('.card-body').find('.menu_name').text() );
		console.log( $(this).parents('.card-body').find('.menu_price').text() );
		console.log( $(this).parents('.card-body').find('.menu_cal').text() );
		console.log( $(this).val() );
		
		
		
		
		item = {
				MENU_NUM: $(this).parents('.card-body').find('.menu_num').text(),
				MENU_NAME : $(this).parents('.card-body').find('.menu_name').text(),
				MENU_PRICE :  $(this).parents('.card-body').find('.menu_price').text() ,
				MENU_CAL : $(this).parents('.card-body').find('.menu_cal').text() ,
				MENU_COUNT : $(this).val(),
				MENU_STO_NUM : <%=request.getParameter("sto_num")%>,
				MENU_STO_BRAND : <%=request.getParameter("sto_brand")%>,
				MENU_STO_NAME : '<%=request.getParameter("sto_name")%>'
		}
		
		//cart.splice( cart.findIndex( item => item.menu_num == $(this).parents('.card-body').find('.menu_num').text()  ));
		
		cart = cart.filter(item => item.MENU_NUM !== ($(this).parents('.card-body').find('.menu_num').text() ) )
		
		if(item.MENU_COUNT !=0){   cart.push(item);}
		
		
		console.log(cart);
		
		tableCode = '<tr class="bg-gray"><td></td><td>메뉴</td><td>수량</td></tr>';
		
		$('#cartTable').empty();
		
		for(var i =0; i < cart.length; i++){
			tableCode += '<tr><td>'+(i+1)+'</td>';
			tableCode += '<td>'+cart[i].MENU_NAME+'</td>';
			tableCode += '<td>'+cart[i].MENU_COUNT+'</td></tr>';
		}
		
		
		if(cart.length > 0){
		$('#cartTable').append(tableCode);
		}
		cartButton =  '<button id="cart_button" type="button" class="btn btn-outline-danger text-dark border btn-lg">장바구니에 추가</button>'
		
		if(cart.length != 0){
			$('#cartDiv').empty();
			$('#cartDiv').append(cartButton);
		}else{
			$('#cartDiv').empty();
			$('#cartDiv').append('<h5 class="text-center">장바구니가 비었습니다</h5>');
		}
		
	})

	
	$(document).on('click', '#cart_button', function(){
		sid = "<%=session.getAttribute("mem_id")%>";
		if(!sid){
			alert("로그인 후 이용해 주세요")
			location.href = "<%=request.getContextPath()%>/login.do"
			return false;
		}
		
		JSON_cart = JSON.stringify(cart);
		
		localStorage.setItem("<%=session.getAttribute("mem_id")%>",JSON_cart )
		
		 location.reload();
		
		
	})
	
</script>

<%@ include file="footer.jsp" %>
