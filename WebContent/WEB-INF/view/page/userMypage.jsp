<%@page import="mukgo.vo.DeliveryVO"%>
<%@page import="mukgo.vo.AddressVO"%>
<%@page import="mukgo.vo.MemberVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="mukgo.vo.MenuVO"%>
<%@page import="mukgo.vo.OrderVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%> <%@ include file="header.jsp" %>
<!-- Header 2 -->
<header class="bg-dark header_2">
  <div class="container pt-50 pb-50">
    <div class="store_header">
      <h1
        class="big color-white text-center"
        data-aos="fade-up"
        data-aos-delay="0"
      >
        마이 페이지
      </h1>
    </div>
  </div>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

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
</script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  <%
	@SuppressWarnings("unchecked")
	List<OrderVO> list = (List<OrderVO>)request.getAttribute("orderList");
	@SuppressWarnings("unchecked")
	List<String> stoNameList = (List<String>)request.getAttribute("stoNameList");
	@SuppressWarnings("unchecked")
	List<MenuVO> menuInfoList = (List<MenuVO>)request.getAttribute("menuList");
	@SuppressWarnings("unchecked")
	List<Integer> revChk = (List<Integer>)request.getAttribute("revChk");
 	MemberVO vo = (MemberVO)request.getAttribute("userInfo");
//	MemberVO memvo = (MemberVO)request.getAttribute("memvo");
	int i;
  %>
  	$(function() {
		$(".btnwrite").on("click", function() {
			name = $(this).parents(".store").find(".storeName a").text()
			$("#storeNameOrder").text(name)
		})
		$("#write").on("click", function() {
			var formData = new FormData($("#revForm")[0]);
			formData.append("star", $(".on").length)
			formData.append("ord_num", $("#ordord").val())
			$.ajax({
				url : "<%=request.getContextPath()%>/page/fileUpload.do",
				type : "post",
				processData: false,
				contentType: false,
				data: formData,
				success: function() {
				}
			})
			$("#reviewModal").modal("hide")
			location.reload();
		})
		 $('#star_grade a').click(function(){
	            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	            return false;
	        });
		$(".btnwrite").on("click", function() {
			ord = $(this).parents(".store").find(".ord_num").val()
			$("#ordord").val(ord)
		})
		$(function(){
		$("#jikjeop").hide();
		$("#selbox").change(function() {
				if($("#selbox").val() == "direct") {
					$("#jikjeop").show();
				}  else {
					$("#jikjeop").hide();
				}
			}) 
		})
		
		$("#addressInsertButton").on("click", function() {
			$.ajax({
				url : "<%=request.getContextPath()%>/page/addressInsert.do",
				data : $("#addressInsertForm").serializeArray(),
				dataType : "json",
				type : "post",
				success: function() {
				}
			})
			$("#addressModal").modal("hide")
			location.reload();
			alert("주소 등록이 완료되었습니다.")
		})
		$(".addDel").on("click", function() {
			$.ajax({
				url : "<%=request.getContextPath()%>/page/addressDelete.do",
				data : {"addNum" : $(this).parents(".addressList").find(".addNum").val()},
				dataType : "json",
				type : "post",
				success: function() {
				}
			})
			location.reload()
			alert("주소 삭제가 완료되었습니다.")
		})
		$("#infoUpdateButton").on("click", function() {
			$.ajax({
				url : "<%=request.getContextPath()%>/infoUpdate.do",
				data : $("#infoUpdateForm").serializeArray(),
				dataType : "json",
				type : "post",
				success: function() {
				}
			})
			location.reload()
			alert("정보 수정이 완료됬습니다.")
		})
	})
	
	$(function() {
	$(".table").on("click", ".btnDeli", function() {
		status = $(this).text()
		ordNum = $(this).parents(".trDeli").find(".ord_num").val()
		$.ajax({
			url : '<%=request.getContextPath()%>/deliStatusUser.do',
			data : {"ordNum" : ordNum},
			type : 'post',
			success : function() {
			}
		})
		location.reload()
	})
	})
  </script>
</header>
  <style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
    #star_grade{
    	font-size: 2em;
    }	
	</style>
<section class="pt-105 pb-90 bg-light text-center showcase_2">
  <!--정보 출력 버튼-->

  <button
    id="recent_order_button"
    type="button"
    class="btn btn-outline-danger text-white active border btn-lg"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;최근 주문 정보&nbsp;&nbsp;&nbsp;&nbsp;
  </button>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <button
    id="myinfo_button"
    type="button"
    class="btn btn-danger text-white border btn-lg text-dark"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;내정보&nbsp;&nbsp;&nbsp;&nbsp;
  </button>
 &nbsp;&nbsp;&nbsp;&nbsp;
  <button
    id="address_list_button"
    type="button"
    class="btn btn-danger text-white border btn-lg text-dark"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;주소목록&nbsp;&nbsp;&nbsp;&nbsp;
  </button>

  <!--최근 주문 목록 보기-->
  <div id="recent_order_list" class="container px-xl-0 pt-40">
    <h2 class="pb-40">최근 주문 목록</h2>
      <%
      	if(list.size()<1){
      	%>
      	<h3>주문내역이 존재하지 않습니다.</h3>
      	<%
      	}else{
    	%>
    <table class="table table-bordered text-justify text-center">
      <tr class="bg-gray">
        <th>주문일시</th>
        <th>가게명</th>
        <th>주문금액</th>
        <th>상세내역</th>
        <th>리뷰쓰기</th>
        <th>배달상태</th>
      </tr>
    	<%
    	List<Integer> priceList = (List<Integer>)request.getAttribute("priceList");
    	List<DeliveryVO> deliList = (List<DeliveryVO>)request.getAttribute("deliList");
    	int listSize = list.size();
      	for(i=0; i<listSize; i++){
      		int price = priceList.get(i);
      		DecimalFormat format = new DecimalFormat("###,###");
      		
      %>
      <tr class="text-center store trDeli">
        <td class="align-middle"><%=list.get(i).getOrd_date().substring(0, 16)%>
        <input type="hidden" value="<%=list.get(i).getOrd_num()%>" class="ord_num">
        </td>
        <td class="align-middle storeName"><a href=""><%=stoNameList.get(i)%></a></td>
        <td class="align-middle"><%=format.format(price)%></td>
        <td class="align-middle"><%=menuInfoList.get(i).getMenu_name()%>&nbsp; 등&nbsp;&nbsp;
        						<%=list.get(i).getOrd_count()%>개</td>
        <td class="align-middle">
        
        <%if(revChk.get(i) == 0) {%>
          <button
            data-toggle="modal"
            data-target="#reviewModal"
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm btnwrite"
          >
          리뷰쓰기
          </button>
          <%}else{ %>
          	<button
            type="button"
            class="btn btn-outline-danger text-dark border disabled btn-sm"
          >
          리뷰쓰기
          </button>
    		<%
      		}
     		%>
        </td>
        <td class="align-middle">
        <% 
        	if(deliList.get(i).getDeli_status().equals("배달중")){
        %>
        	<button class="btnDeli"><%=deliList.get(i).getDeli_status()%></button>
        <%
        	}else{
        %>
        	<button class="btnDeli" disabled><%=deliList.get(i).getDeli_status()%></button>
        <%
        	}
        %>
        </td>
      </tr>
      <%
      	}}
      %>
    </table>
   </div>
  
  
  <!-- 내정보 수정-->
  <div id="userMyinfo" class="container px-xl-0 pt-40 d-none">
    <h2 class="pb-40">내정보</h2>
    <table class="table table-striped">
    <tbody>
      <tr>
        <th>이름 : </th>
        <td><%=memvo.getMem_name()%></td>
      </tr>
      <tr>
        <td>ID : </td>
        <td><%=memvo.getMem_id()%></td>
      </tr>
      <tr>
        <td>email : </td>
        <td><%=memvo.getMem_email()%></td>
      </tr>
      <tr>
        <td>전화번호 : </td>
        <td><%=memvo.getMem_tel()%></td>
      </tr>
    </tbody>
  </table>
  <div data-aos="fade-up" data-aos-delay="300">
        <button 
        data-toggle="modal"
            data-target="#infoUpdateModal"
        class="btn mt-25 action-1 w-300">정보 수정 하기</button>
      </div>
  </div>
  
  
  <!--주소 목록 보기-->
  <div id="address_list" class="container px-xl-0 pt-40 d-none">
    <h2 class="pb-40">주소 목록</h2>
      
    <table class="table table-bordered text-justify text-center addressList">
      <tr class="bg-gray">
        <th>주소명</th>
        <th>우편번호</th>
        <th>주 소</th>
        <th>상세주소</th>
        <th></th>
      </tr>
    <%List<AddressVO> addList = (List<AddressVO>)request.getAttribute("addList");
    if(addList.size() == 0 || addList ==null){
    %>
    <tr>
    <td colspan="5"><h5 style="color: gray">등록된 주소가 없습니다.</h5></td>
    </tr>
    <%
    }else{
    
    for(AddressVO addVo : addList){%>
    	
      <tr class="text-center">
        <td class="align-middle"><%=addVo.getAdd_name()%></td>
        <td class="align-middle"><%=addVo.getAdd_post_num()%></td>
        <td class="align-middle"><%=addVo.getAdd_sido() + " " + addVo.getAdd_gungu() + " " + addVo.getAdd_dong()%></td>
        <td class="align-middle"><%=addVo.getAdd_detail()%>
        <input type="hidden" value="<%=addVo.getAdd_num()%>" class="addNum">
        </td>
        <td class="align-middle">
        <button
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm addDel"
          >
          주소삭제
          </button></td>
      </tr>
    <%
    }}
    %>
   <tr class="bg-gray">
        <th colspan="5">주소명 중복시 자동수정 됩니다.</th>
      </tr>
    </table>
    <div data-aos="fade-up" data-aos-delay="300">
        <button 
        data-toggle="modal"
            data-target="#addressModal"
        class="btn mt-25 action-1 w-300">주소 추가 하기</button>
      </div>
   
  </div>
  
  
  
</section>




 <!--리뷰 쓰기 Modal -->
    <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
      <div class="modal-dialog 	modal-xl">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="reviewModalLabel">리뷰 쓰기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
            <form id="revForm">
          <div class="modal-body">
          <input type="hidden" id="ordord">
            <span class="store_name_order" id="storeNameOrder" style="font-size: 2em; font-style: inherit;"></span><br>
            <textarea class="bg-gray" cols="100" rows="20" id="cont" name="content"></textarea><br>
            <p id="star_grade">
		            별점 주기 : 
			        <a href="#">★</a>
			        <a href="#">★</a>
			        <a href="#">★</a>
			        <a href="#">★</a>
			        <a href="#">★</a>
			</p>
            <hr>
           	사진첨부1 : <input type="file" name="file1">
      		사진첨부2 : <input type="file" name="file2">
              </div>
               <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger text-dark border btn-sm" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-outline-danger bg-dark border  btn-sm" id="write">리뷰 작성</button>
            </div>
            </form>
            
          </div>
        
        </div>
      </div>
    
    
    
    <!-- 정보 수정 Modal -->
    <div class="modal fade" id="infoUpdateModal" tabindex="-1" aria-labelledby="infoUpdateModalLabel" aria-hidden="true">
      <div class="modal-dialog 	modal-xl">
        <div class="modal-content">
          <form id="infoUpdateForm">
          <div class="modal-header">
            <h5 class="modal-title" id="infoUpdateModalLabel">정보수정</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body container px-xl-0 pt-40">
		    <h2 class="pb-40">내정보</h2>
		    <table class="table table-striped">
		    <tbody>
		      <tr>
		        <th>이름 : </th>
		        <td><input type="text" value="<%=memvo.getMem_name()%>" name="upName"></td>
		      </tr>
		      <tr>
		        <td>ID : </td>
		        <td><input type="text" value="<%=memvo.getMem_id()%>" name="upId" readonly>ID는 수정이 불가합니다.</td>
		      </tr>
		      <tr>
		        <td>email : </td>
				<td><input type="text" value="<%=memvo.getMem_email()%>" name="upEmail"></td>
		      </tr>
		      <tr>
		        <td>전화번호 : </td>
				<td><input type="text" value="<%=memvo.getMem_tel()%>" name="upTel"></td>
		      </tr>
		    </tbody>
		  </table>
           </div>
               <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger text-dark border btn-sm" data-dismiss="modal">닫기</button>
            <button type="submit" class="btn btn-outline-danger bg-dark border  btn-sm" id="infoUpdateButton">정보 수정</button>
            </div>
            
             </form>
             
          </div>
        </div>
      </div>
  
  
     <!--주소 추가 Modal -->
    <div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="addressModalLabel" aria-hidden="true">
      <div class="modal-dialog 	modal-xl">
        <div class="modal-content">
          <form id="addressInsertForm">
          <div class="modal-header">
            <h5 class="modal-title" id="addressModalLabel">주소 추가 </h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
          <table>
          	<tr>
          	<td>
          	<select id="selbox" name="selbox" class="form-control">
			<option value="" class="form-control">이름 선택</option>
			<option value="우리집" class="form-control">우리집</option>
			<option value="동민이집" class="form-control">동민이집</option>
			<option value="인재개발원" class="form-control">인재개발원</option>
			<option value="direct" class="form-control">직접입력</option>
			</select>
			<input type="text" placeholder="직접 입력" class="form-control-plaintext" id="jikjeop" name="jikjeop"/>
			</td>
			</tr>
          	<tr>
          	<td><input type="text" name="upyeon" id="sample6_postcode" placeholder="우편번호" readonly></td>
			<td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="border w-150 btn-primary"></td>
          	</tr>
          	<tr>
			<td><input type="text" name="juso" id="sample6_address" placeholder="주소" readonly></td>
			</tr>
			<tr>
			<td><input type="text" name="sangse" id="sample6_detailAddress" placeholder="상세주소"></td>
			<td><input type="text" name="chamgo" id="sample6_extraAddress" placeholder="참고항목" readonly></td>
          	</tr>
          </table>
           </div>
               <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger text-dark border btn-sm" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-outline-danger bg-dark border  btn-sm" id="addressInsertButton">주소 추가</button>
            </div>
            </form>
          </div>
        </div>
      </div>

  <%@ include file="footer.jsp" %>

