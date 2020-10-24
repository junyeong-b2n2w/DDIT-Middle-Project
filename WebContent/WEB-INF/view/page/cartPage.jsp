<%@page import="mukgo.action.page.cartPageAction"%>
<%@page import="mukgo.vo.StoreVO"%>
<%@page import="mukgo.service.user.store.StoreServiceImpl"%>
<%@page import="mukgo.service.user.store.IStoreService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="header.jsp" %>

<!-- Header 2 -->
<header class="bg-dark header_2">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
cartList = JSON.parse(localStorage.getItem("<%=session.getAttribute("mem_id")%>"));
$(function() {
	$("#btnOrder").on("click", function() {
	
	})
})
</script>
  <div class="container pt-50 pb-50">
    <div class="store_header">
      <h1
        class="big color-white text-center"
        data-aos="fade-up"
        data-aos-delay="0"
      >
        장바구니
      </h1>
    </div>
  </div>
</header>

<section class="pt-105 pb-90 bg-light text-center showcase_2">
  <!--정보 출력 버튼-->

  
  <!--이벤트목록 보기-->
  <div id="event_list" class="container px-xl-0 pt-40">
    <h2 class="pb-40">장바구니 목록</h2>
    <div id="cartArea">
    </div>
    <div id="addInfo"></div>
  </div>
  <!-- 정보 수정 Modal -->
    <div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
      <div class="modal-dialog 	modal-xl">
        <div class="modal-content">
          <form id="orderOkForm">
          <div class="modal-header">
            <h5 class="modal-title" id="orderModalLabel"></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body container px-xl-0 pt-40">
		    <h2 class="pb-40">주문정보</h2>
		    <table class="table table-striped">
		    <tbody>
		      <tr>
		      	<td>주문 메뉴</td>
		        <td id="orderInfo"></td>
		      </tr>
		      <tr>
		      	<td>주문 금액</td>
		        <td id="orderPrice"></td>
		      </tr>
		      <tr>
		      	<td>주소 선택</td>
		        <td><select id="addSel">
		        </select> </td>
		      </tr>
		      <tr id="addrSido"></tr>
		      <tr id="addrDetail"></tr>
		      <tr id="addrInput"></tr>
		      <tr><td colspan="2"><input type="text" placeholder="배달 요청사항 입력" id="please" style="width: 100%"></td></tr>
		    </tbody>
		  </table>
           </div>
               <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger text-dark border btn-sm" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-outline-danger bg-dark border  btn-sm" id="orderOkButton">주문 하기</button>
            </div>
            
             </form>
             
          </div>
        </div>
      </div>
  
  <script>
  
  cartList = JSON.parse(localStorage.getItem("<%=session.getAttribute("mem_id")%>"));
  cart()
  $(function() {
	$("#orderOkButton").on("click", function() {
		menuName = new Array()
		menuCnt = new Array()
		addNum = $("#addSel").val()
		addr_num = $(".ord_addr" + addNum).val();
		for(i=0; i<cartList.length; i++){
			if($("#cart" + i).prop("checked")){
				menuName.push(cartList[i].MENU_NAME)
				menuCnt.push(cartList[i].MENU_COUNT)
			}
		}
		$.ajax({
			url : "<%=request.getContextPath()%>/user/orderOk.do",
			data : {
				"ord_sto_name" : cartList[0].MENU_STO_NAME,
				"ord_please" : $("#please").val(),
				"ord_sto_brand" : $("#ord_sto_brand").val(),
				"menuName" : menuName,
				"menuCnt" : menuCnt,
				"jikjeop" : $("#addSel").val(),
				"count" : $("#count").val(),
				"upyeon" : $(":input[name=upyeon]").val(),
				"addrName" : $(":input[name=addrName]").val(),
				"chamgo" : $(":input[name=chamgo]").val(),
				"sangse" : $(":input[name=sangse]").val(),
				"juso" : $(":input[name=juso]").val(),
				"ord_addr_num" : addr_num
			},
			dataType : "json",
			type : "post",
			success : function(res) {
			}
		})
		
		alert("주문이 완료되었습니다")
		localStorage.clear()
		location.reload()
	})
	$(":checkbox[name=cart]").on("click", function(){
		ok = $(this).prop("checked")
		for(var i = 0; i<cartList.length; i++){
		
		}
		price = parseInt($(this).parents(".menu").find(".price").text())
		count = parseInt($(this).parents(".menu").find(".count").text())
		total = parseInt($("#total").text())
		if(ok){
			total = total + price*count
		}else{
			total = total - price*count
		}
		$("#total").text(total)
	})
	addrList = new Array()
		$.ajax({
				url : "<%=request.getContextPath()%>/cartOrder.do",
				data : 
					{ "sto_num" : $("#stoNum").val()},
				dataType : "json",
				type : "post",
				success: function(res) {
					code = "";
					count = 0;
					$.each(res, function(i) {
						code += "<input type='hidden' value='" + res[i].name + "' class='name" + i + "'>";
						code += "<input type='hidden' value='" + res[i].detail + "' class='detail" + i + "'>";
						code += "<input type='hidden' value='" + res[i].sido + "' class='sido" + i + "'>";
						code += "<input type='hidden' value='" + res[i].mem_gb + "' class='mem_gb" + i + "'>";
						code += "<input type='hidden' value='" + res[i].mem_num + "' class='mem_num" + i + "'>";
						code += "<input type='hidden' value='" + res[i].post_num + "' class='post_num" + i + "'>";
						code += "<input type='hidden' value='" + res[i].num + "' class='ord_addr" + i + "'>";
						code += "<input type='hidden' value='" + i + "' class='ord_addr_num" + i + "'>";
						count++
					})
					code += "<input type='hidden' value='" + count + "' id='count'>";
					$("#addInfo").html(code);
				}
			})
	$("#btnOrder").on("click", function() {
		cnt = $("#count").val()
		$("#addSel").empty() 
		ii = 0
		for (ii=0; ii<cnt; ii++) {
			name = '<option value="' + ii + '">' + $(".name" + ii).val() + '</option>'
			$("#addSel").append(name)
		}
		$("#addSel").append('<option value="' + ii + '">(직접 입력)</option>')
		$("#orderPrice").text($("#total").text())
		kaka = 0;
		for(i=0; i<cartList.length; i++){
			if($("#cart" + i).prop("checked")){
				orderInfo = cartList[i].MENU_NAME
				kaka++
			}
		}
		if(kaka > 1){
			orderInfo += " 외 " + (kaka-1) + " 건" 
		}
		$("#orderInfo").text(orderInfo)
		$("#addSel").trigger("click")
	})
	$("#addSel").on("click", function() {
		selVal = $("#addSel").val()
		code1 = "<td colspan='2'>" + $(".detail" + selVal).val() + "</td>"
		code = "<td colspan='2'>" + $(".sido" + selVal).val() + "</td>"
		$("#addrInput").empty()
		if($("#addSel").val()== ii){
			code = '<td><input type="text" name="upyeon" id="sample6_postcode" placeholder="우편번호" readonly></td>'
			code += '<td><input type="text" name="addrName" placeholder="주소 이름"></td>'
			code1 = '<td><input type="text" name="juso" id="sample6_address" placeholder="주소" readonly></td><td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="border w-150 btn-primary"></td>'
			code2 ='<td><input type="text" name="sangse" id="sample6_detailAddress" placeholder="상세주소"></td><td><input type="text" name="chamgo" id="sample6_extraAddress" placeholder="참고항목" readonly></td>'
			$("#addrInput").empty().append(code2)
		}
		
		$("#addrSido").empty().append(code)
		$("#addrDetail").empty().append(code1)
//       	<tr>
// 		<td><input type="text" name="juso" id="sample6_address" placeholder="주소" readonly></td>
// 		</tr>
// 		<tr>
// 		<td><input type="text" name="sangse" id="sample6_detailAddress" placeholder="상세주소"></td>
// 		<td><input type="text" name="chamgo" id="sample6_extraAddress" placeholder="참고항목" readonly></td>
	})
	$("#orderModalLabel").text("주문 - " + cartList[0].MENU_STO_NAME)

	})
	//카트사용자이름 세션에서 받아오기 
  
  console.log(cartList);
  
  function sample6_execDaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var addr = ''; // 주소 변수
              var extraAddr = ''; // 참고항목 변수

              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }

              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
              if(data.userSelectedType === 'R'){
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraAddr !== ''){
                      extraAddr = ' (' + extraAddr + ')';
                  }
                  // 조합된 참고항목을 해당 필드에 넣는다.
                  document.getElementById("sample6_extraAddress").value = extraAddr;
              
              } else {
                  document.getElementById("sample6_extraAddress").value = '';
              }

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('sample6_postcode').value = data.zonecode;
              document.getElementById("sample6_address").value = addr;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById("sample6_detailAddress").focus();
          }
      }).open();
  }
  function cart() {
	
  if(!cartList){
	  $('#cartArea').empty().append('<h3>장바구니가 비었습니다.</h3>');
	  
  }else{
  			
	  cartTable = '<form id="orderForm"><table class="table table-bordered text-justify text-center cart"><tr><th class="">'
	  +'</th><th class="">메뉴명</th><th class="">가격</th><th class="">수량</th></tr>';
	  total =0;
	  for(var i = 0; i<cartList.length; i++){
		  cartTable += '<tr class="text-center menu"><td class="align-middle">';
		  cartTable += '<input class="form-check-input d-none" type="checkbox" name="cart" id="cart'+i+'" value="'+cartList[i].MENU_NUM+'" checked><label class="form-check-label" for="cart'+i+'"></label></td>';
		  cartTable += '<td class="align-middle name">'+cartList[i].MENU_NAME+'</td>';
		  cartTable += '<td class="align-middle price">'+cartList[i].MENU_PRICE+'</td>';
		  cartTable += '<td class="align-middle count">'+cartList[i].MENU_COUNT+'</td></tr>'
		  cartTable += '<input type="hidden" value="' + cartList[i].MENU_STO_NAME + '">'
		  cartTable += '<input type="hidden" value="' + cartList[i].MENU_STO_BRAND + '" id="ord_sto_brand">'
		  cartTable += '<input type="hidden" id="stoNum" value="' + cartList[i].MENU_STO_NUM + '">'
	  			//
			  total = total+ parseInt(cartList[i].MENU_COUNT) * parseInt(cartList[i].MENU_PRICE);
	  }
	  
	  cartTable += '<tr class="text-center"><td  class="align-middle" colspan="2"><strong>총 가격</strong></td><td class="align-middle" colspan="2" id="total"><strong>' + total+'</strong></td>';
	  cartTable += '</table> <button type="button" id="cart_delete" class="btn btn-danger btn-lg color-danger border text-dark mt-10 mr-20">지우기</button><button type="button" class="btn btn-danger btn-lg color-danger border text-dark mt-10" id="btnOrder" data-toggle="modal" data-target="#orderModal" id="btnOrder">주문하기</button></form>';
	  
	  
	  
	  $('#cartArea').empty().append(cartTable);

  
  }
}

  $(document).on('click', '#cart_delete', function(){
	  
	 	checkedList = $(':checked');
	  
	  for ( var i =0 ; i<checkedList.length; i++){
		  console.log(checkedList[i].value)
		  cartList = cartList.filter(item => item.MENU_NUM !== checkedList[i].value )
			
	  }
	  
	  JSON_cart = JSON.stringify(cartList);
		
	  localStorage.setItem("<%=session.getAttribute("mem_id")%>",JSON_cart )
	  
	  if(cartList.length==0){
		  localStorage.removeItem("<%=session.getAttribute("mem_id")%>")
	  }
	  
	  location.reload();
	  
  })
  
  </script>
 

</section>
  <%@ include file="footer.jsp" %>

