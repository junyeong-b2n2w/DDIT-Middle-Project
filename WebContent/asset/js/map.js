var mapContainer = document.getElementById("map"), // 지도를 표시할 div
  mapOption = {
    center: new kakao.maps.LatLng(36.3239981936622, 127.419), // 지도의 중심좌표
    level: 3, // 지도의 확대 레벨
  };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다
var positions = [
  {
    content: "<div>카카오</div>",
    latlng: new kakao.maps.LatLng(33.450705, 126.570677),
  },
  {
    content: "<div>생태연못</div>",
    latlng: new kakao.maps.LatLng(33.450936, 126.569477),
  },
  {
    content: "<div>텃밭</div>",
    latlng: new kakao.maps.LatLng(33.450879, 126.56994),
  },
  {
    content: "<div>근린공원</div>",
    latlng: new kakao.maps.LatLng(33.451393, 126.570738),
  },
];

var data = [
  {
    SIDO: "대전",
    SIGUNGU: "유성구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전유성온천역점",
    POSY: "127.342174696061",
    POSX: "36.3542929289483",
  },
  {
    SIDO: "대전",
    SIGUNGU: "서구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전관저점",
    POSY: "127.33897270155",
    POSX: "36.2992967473195",
  },
  {
    SIDO: "대전",
    SIGUNGU: "동구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전터미널DT점",
    POSY: "127.434913375124",
    POSX: "36.3481201434472",
  },
  {
    SIDO: "대전",
    SIGUNGU: "유성구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전관평점",
    POSY: "127.389759635176",
    POSX: "36.4252923002614",
  },
  {
    SIDO: "대전",
    SIGUNGU: "서구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전시청점",
    POSY: "127.389886832965",
    POSX: "36.3498561941267",
  },
  {
    SIDO: "대전",
    SIGUNGU: "유성구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전노은역점",
    POSY: "127.319129585173",
    POSX: "36.3751164258925",
  },
  {
    SIDO: "대전",
    SIGUNGU: "중구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전버드내마을오일뱅크점",
    POSY: "127.388973635483",
    POSX: "36.3159971621366",
  },
  {
    SIDO: "대전",
    SIGUNGU: "서구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전둔산1점",
    POSY: "127.377460683541",
    POSX: "36.3505360156304",
  },
  {
    SIDO: "대전",
    SIGUNGU: "유성구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전현대아울렛점",
    POSY: "127.398516767788",
    POSX: "36.4234369155218",
  },
  {
    SIDO: "대전",
    SIGUNGU: "중구",
    STORECATEGORY: "MACDONALD",
    STORENAME: "대전부사DT",
    POSY: "127.431757593277",
    POSX: "36.3198152946037",
  },
  {
    SIDO: "대전",
    SIGUNGU: "서구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전용문역점",
    POSY: "127.391923837398",
    POSX: "36.3390091103489",
  },
  {
    SIDO: "대전",
    SIGUNGU: "유성구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전반석DT점",
    POSY: "127.316216925256",
    POSX: "36.3907845559861",
  },
  {
    SIDO: "대전",
    SIGUNGU: "중구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전용두DT점",
    POSY: "127.409922559442",
    POSX: "36.3251029602163",
  },
  {
    SIDO: "대전",
    SIGUNGU: "서구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전월평점",
    POSY: "127.37731773784",
    POSX: "36.3624441315679",
  },
  {
    SIDO: "대전",
    SIGUNGU: "서구",
    STORECATEGORY: "BURGER KING",
    STORENAME: "대전도안점",
    POSY: "127.338633146752",
    POSX: "36.331814949449",
  },
  {
    SIDO: "대전",
    SIGUNGU: "서구",
    STORECATEGORY: "KFC",
    STORENAME: "대전타임월드",
    POSX: "36.351897971166615",
    POSY: "127.37574191790479",
  },
  {
    SIDO: "대전",
    SIGUNGU: "서구",
    STORECATEGORY: "KFC",
    STORENAME: "대전시청역",
    POSX: "36.3515433300581",
    POSY: "127.387434193934",
  },
  {
    SIDO: "대전",
    SIGUNGU: "유성구",
    STORECATEGORY: "KFC",
    STORENAME: "노은역",
    POSX: "36.3742276973675",
    POSY: "127.319531031105",
  },
  {
    SIDO: "대전",
    SIGUNGU: "유성구",
    STORECATEGORY: "KFC",
    STORENAME: "검색역",
    POSX: "36.39",
    POSY: "127.334",
  },
];

console.log(data.length);
for (var i = 0; i < data.length; i++) {
  // 마커를 생성합니다
  var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: new kakao.maps.LatLng(data[i].POSX, data[i].POSY), // 마커의 위치
  });

  // 마커에 표시할 인포윈도우를 생성합니다
  var infowindow = new kakao.maps.InfoWindow({
    content:
      "<div>" + data[i].STORECATEGORY + " " + data[i].STORENAME + "</div>", // 인포윈도우에 표시할 내용
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

//--------------------------------------------------

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
  infowindow = new kakao.maps.InfoWindow({ zindex: 1 }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, "click", function (mouseEvent) {
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

      // 마커를 클릭한 위치에 표시합니다
      marker.setPosition(mouseEvent.latLng);
      marker.setMap(map);

      // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
      infowindow.setContent(content);
      infowindow.open(map, marker);

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
