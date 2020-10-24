<%@page import="mukgo.vo.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<link href="<%=request.getContextPath()%>/asset/css/map.css" rel="stylesheet" />
       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3884405e456b656703a94dfd63808e89&libraries=services,clusterer,drawing"></script>
        <script
          type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3884405e456b656703a94dfd63808e89"
        ></script>
<script src="<%=request.getContextPath()%>/asset/js/map.js"></script>
    <!-- Header 2 -->
    <header class="pt-50 pb-100 bg-dark header_2">
    <script type="text/javascript">
    $(function() {
    	brand = <%=request.getAttribute("brand")%>
    	brandChk(brand)
   		
    	
    	 markers = [];
    	function brandChk(brand) {
    		if(brand == 1) $(".brand1").attr("checked", true)
    		if(brand == 2) $(".brand2").attr("checked", true)
    		if(brand == 3) $(".brand3").attr("checked", true)
    		if(brand == 4) $(".brand4").attr("checked", true)
    		if(brand == 5) $(".brand5").attr("checked", true)
		}
    	
    	var mapContainer = document.getElementById("map"), // 지도를 표시할 div
		  mapOption = {
		    center: new kakao.maps.LatLng(36.3239981936622, 127.419), // 지도의 중심좌표
		    level: 3, // 지도의 확대 레벨
		  };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		
    	
    	
    	
		$("#detailSearchButton").on("click", function() {
			$.ajax({
				url : "<%=request.getContextPath()%>/mapSearch.do",
				data : $("#detailSearchForm").serializeArray(),
				type : "get",
				dataType: "json",
				success : function(res) {
				   data = res;
				  
					$("#dmt").empty()
					code = ""
					$.each(res, function(i) {
						code += '<tr><td><div class="store_img pt-10 pb-10 d-inline-block w-200">'
			            code += '<img src="' + res[i].img + '" width="150px" />'
		                code += '</div></td><td class="text-justify">'
						code += ' <div class="store_content d-inline-block pl-50 pr-50">';
						code += '<h3 class="store_title d-inline-block">'
						code += '<a href="<%=request.getContextPath()%>/storeMenuList.do?sto_num=' + res[i].sto_num + '&sto_brand=' + res[i].sto_brand + '&sto_name=' + res[i].sto_name + '" class="text-dark">'
						code += res[i].sto_name;
						code += '</a></h3>&nbsp;&nbsp;&nbsp;&nbsp;'
			            code += '<span class="store_stars cont">⭐ ️' + res[i].star + '</span><br/>'
			            code += '<div class="review_content pt-20 d-inline-block">'
			            code += '<span>전화번호 : ' + res[i].sto_tel + '<br>영업시간 : ' + res[i].sto_opentoclose + '</span>'
			            code += '</div></div></td></tr>'
					})
			            $("#dmt").append(code)
			            
			       
			            console.log(data);
					
					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다
					function makeOverListener(map, marker, infowindow) {
					  return function () {
					    infowindow.open(map, marker);
					  };
					}

					// 인포윈도우를 닫는 클로저를 만드는 함수입니다
					function makeOutListener(infowindow) {
					  return function () {
					    infowindow.close();
					  };
					}
			    	
					 for (var i = 0; i < markers.length; i++) {
					        markers[i].setMap(null);
					    }   
					
					
				for (var i = 0; i < data.length; i++) {
					
					
				  // 마커를 생성합니다
				  var marker = new kakao.maps.Marker({
				    map: map, // 마커를 표시할 지도
				    position: new kakao.maps.LatLng(data[i].sto_pos_x, data[i].sto_pos_y), // 마커의 위치
				  });
				
					markers.push(marker);
				  
				  // 마커에 표시할 인포윈도우를 생성합니다
				  var infowindow = new kakao.maps.InfoWindow({
				    content:
				    	'<div class="card mb-3" style="max-width: 300px;">'
				   + '<div class="row no-gutters">'
				    +'<div class="col-md-4">'
				    + '<img src="'+data[i].img+'" class="card-img" alt="...">'
				    + '</div>'
				    + '<div class="col-md-8">'
				    + '<div class="card-body">'
				     +'<h5 class="card-title">'+data[i].sto_name+'</h5>'
				     +'<p class="card-text">️⭐️'+data[i].star+'</p>'
				    + '<p class="card-text"><small class="text-muted">영업시간 : '+data[i].sto_opentoclose+'</small></p>'
				    + '</div>'
				    + '</div>'
				    +'</div>'
				  +'</div>'
// 				      "<div>" + data[i].sto_brand + " " + data[i].sto_name + "</div>", // 인포윈도우에 표시할 내용
				  });
				
				  // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				  // 이벤트 리스너로는 클로저를 만들어 등록합니다
				  // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				  kakao.maps.event.addListener(
				    marker,
				    "mouseover",
				    makeOverListener(map, marker, infowindow)
				  );
				  kakao.maps.event.addListener(marker, "mouseout", makeOutListener(infowindow));
				}
				
				
			    
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
				  infowindow = new kakao.maps.InfoWindow({ zindex: 1 }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

				// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
				searchAddrFromCoords(map.getCenter(), displayCenterInfo);

				// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
				kakao.maps.event.addListener(map, "click", function (mouseEvent) {

					 // 클릭한 위도, 경도 정보를 가져옵니다 
				    var latlng = mouseEvent.latLng;
				    
				    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
				    message += '경도는 ' + latlng.getLng() + ' 입니다';
				    
				    document.getElementById('posx').value = latlng.getLat();
				    document.getElementById('posy').value = latlng.getLng();
				    console.log("posx : "+document.getElementById('posx').value)
				    console.log("posy : "+document.getElementById('posy').value)
				  searchDetailAddrFromCoords(mouseEvent.latLng, function (result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				      var detailAddr = !!result[0].road_address
				        ? "<div>도로명주소 : " + result[0].road_address.address_name + "</div>"
				        : "";
				      detailAddr +=
				        "<div>지번 주소 : " + result[0].address.address_name + "</div>";

				      var content =
				        '<div class="bAddr">' +
				        '<span class="title">법정동 주소정보</span>' +
				        detailAddr +
				        "</div>";
				        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				        var imageSize = new kakao.maps.Size(24, 35);
				        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				        
				      // 마커를 클릭한 위치에 표시합니다
				      marker.setPosition(mouseEvent.latLng);
				      marker.setMap(map);
				      marker.setImage(markerImage);

				      // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
// 				      infowindow.setContent(content);
// 				      infowindow.open(map, marker);

				      document.getElementById("addr_search_input").value = result[0]
				        .road_address.address_name
				        ? result[0].road_address.address_name
				        : result[0].address.address_name;
				    }
				  });
				});

				// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
				kakao.maps.event.addListener(map, "idle", function () {
				  searchAddrFromCoords(map.getCenter(), displayCenterInfo);
				});

				function searchAddrFromCoords(coords, callback) {
				  // 좌표로 행정동 주소 정보를 요청합니다
				  geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
				}

				function searchDetailAddrFromCoords(coords, callback) {
				  // 좌표로 법정동 상세 주소 정보를 요청합니다
				  geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
				}

				// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
				function displayCenterInfo(result, status) {
				  if (status === kakao.maps.services.Status.OK) {
				    var infoDiv = document.getElementById("centerAddr");

				    for (var i = 0; i < result.length; i++) {
				      // 행정동의 region_type 값은 'H' 이므로
				      if (result[i].region_type === "H") {
				        infoDiv.innerHTML = result[i].address_name;
				        break;
				      }
				    }
				  }
				}
				
				
				
				},
				error : function(req) {
					alert("테스트요" + req.status)
				}
			})
		})
		$("#detailSearchButton").trigger("click")
	})
    </script>
      <div class="container text-center">
        <h1
          class="big color-white text-center pb-40"
          data-aos="fade-up"
          data-aos-delay="0"
        >
          가게 검색
        </h1>
        <!--지도를 표시할 div-->
        <div id="map" style="width: 100%; height: 600px"></div>


        <br />
       
        
        
        
        
        <div class="search_form bg-light pt-10 rounded">
        <h4>상세검색</h4>
       <hr>
       <form id="detailSearchForm" action="<%=request.getContextPath()%>/page/map_search.do" method="post">
       	<input type="text" id="posx" name="sto_pos_x" class="d-none">
       	<input type="text" id="posy" name="sto_pos_y" class="d-none">
       
       		<div class="form-group row">
			    <label for="addr_search_input" class="col-sm-2 col-form-label">주소</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="addr_search_input" name="address" >
			    </div>
			  </div>
       
       	  <div class="form-group row">
		    <label for="store_name" class="col-sm-2 col-form-label"> 가게명 </label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="store_name" name="sto_name" >
		    </div>
		  </div>
        
        <div class="form-group row">
		    <label for="brand" class="col-sm-2 col-form-label"> 브랜드 </label>
		    <div id="brand" class="col-sm-6">
				<div class="form-check form-check-inline">
				  <input class="form-check-input d-none brand1" type="checkbox" id="brand_mac" name="brand" value="1">
				  <label class="form-check-label" for="brand_mac">맥도날드</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input d-none brand2" type="checkbox" id="brand_lot" name="brand" value="2">
				  <label class="form-check-label" for="brand_lot">롯데리아</label>
				</div>		      
				<div class="form-check form-check-inline">
				  <input class="form-check-input d-none brand3" type="checkbox" id="brand_king" name="brand" value="3">
				  <label class="form-check-label" for="brand_king">버거킹</label>
				</div>	
				<div class="form-check form-check-inline">
				  <input class="form-check-input d-none brand4" type="checkbox" id="brand_mom" name="brand" value="4">
				  <label class="form-check-label" for="brand_mom">맘스터치</label>
				</div>	
				<div class="form-check form-check-inline">
				  <input class="form-check-input d-none brand5" type="checkbox" id="brand_pop" name="brand" value="5">
				  <label class="form-check-label" for="brand_pop">파파이스</label>
				</div>		

		    </div>
		</div>
        
        <div class="form-group row">
		    <label for="option" class="col-sm-2 col-form-label"> 추가 선택 </label>
		    <div id="option" class="col-sm-6">
		        <div class="form-check form-check-inline">
				  <input class="form-check-input d-none" type="checkbox" id="dt" name="dt" value="1">
				  <label class="form-check-label" for="dt">드라이브 스루</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input d-none" type="checkbox" id="bd" name="bd" value="1">
				  <label class="form-check-label" for="bd">배달가능</label>
				</div>
				
		    </div>
		</div>
		  
		
        	<button type="button" id="detailSearchButton" class="btn btn-danger border text-dark mb-10">검색하기</button>
        </form>
        </div>
      </div>
    </header>

    <!-- Showcase 2 -->
    <section class="pt-50 pb-90 bg-light text-center showcase_2">
      <div class="container px-xl-0">
        <!--라뷰보기-->
        <div id="store_list" class="container px-xl-0 pt-40 dongmin">
          <h2 class="pb-40">검색 결과</h2>
          <table class="table" id="dmt">
           
          </table>
        </div>
      </div>
    </section>
  
  <%@ include file="footer.jsp" %>