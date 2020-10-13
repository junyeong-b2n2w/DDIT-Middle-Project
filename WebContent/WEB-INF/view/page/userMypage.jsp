<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="header.jsp" %>
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
</header>

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

  <!--최근 주문 목록 보기-->
  <div id="recent_order_list" class="container px-xl-0 pt-40">
    <h2 class="pb-40">최근 주문 목록</h2>
    <table class="table table-bordered text-justify text-center">
      <tr class="bg-gray">
        <th>주문일</th>
        <th>가게명</th>
        <th>주문금액</th>
        <th>상세내역</th>
        <th>리뷰쓰기</th>
      </tr>
      <tr class="text-center">
        <td class="align-middle">10/5</td>
        <td class="align-middle"><a href="">가게명</a></td>
        <td class="align-middle">25000</td>
        <td class="align-middle">떡볶이 및 1건</td>
        <td class="align-middle">
          <button
            data-toggle="modal"
            data-target="#reviewModal"
            type="button"
            class="btn btn-outline-danger text-dark border disabled btn-sm"
          >
            리뷰 쓰기
          </button>
        </td>
      </tr>

      <tr class="text-center">
        <td class="align-middle">10/5</td>
        <td class="align-middle"><a href="">가게명</a></td>
        <td class="align-middle">25000</td>
        <td class="align-middle">떡볶이 및 1건</td>
        <td class="align-middle">
          <button
            data-toggle="modal"
            data-target="#reviewModal"
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm"
          >
            리뷰 쓰기
          </button>
        </td>
      </tr>

      <tr class="text-center">
        <td class="align-middle">10/5</td>
        <td class="align-middle"><a href="">가게명</a></td>
        <td class="align-middle">25000</td>
        <td class="align-middle">떡볶이 및 1건</td>
        <td class="align-middle">
          <button
            data-toggle="modal"
            data-target="#reviewModal"
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm"
          >
            리뷰 쓰기
          </button>
        </td>
      </tr>

      <tr class="text-center">
        <td class="align-middle">10/5</td>
        <td class="align-middle"><a href="">가게명</a></td>
        <td class="align-middle">25000</td>
        <td class="align-middle">떡볶이 및 1건</td>
        <td class="align-middle">
          <button
            data-toggle="modal"
            data-target="#reviewModal"
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm"
          >
            리뷰 쓰기
          </button>
        </td>
      </tr>
    </table>
  </div>
  <!-- 내정보 수정-->
  <div id="userMyinfo" class="container px-xl-0 pt-40 d-none">
    <h2 class="pb-40">내정보</h2>

    <form
      action=""
      method="post"
      class="bg-light mx-auto mw-600 radius10 px-50 pb-30"
    >
      <div class="mb-20 input_holder" data-aos="fade-up" data-aos-delay="150">
        <input
          type="text"
          name="userName"
          placeholder="이름 입력"
          class="input border-gray focus-action-1 color-heading placeholder-heading w-full"
        />
      </div>
      <div class="mb-20 input_holder" data-aos="fade-up" data-aos-delay="150">
        <input
          type="email"
          name="email"
          placeholder="이메일 입력"
          class="input border-gray focus-action-1 color-heading placeholder-heading w-full"
        />
      </div>
      <div class="mb-20 input_holder" data-aos="fade-up" data-aos-delay="150">
        <input
          type="password"
          name="password"
          placeholder="비밀번호 입력"
          class="input border-gray focus-action-1 color-heading placeholder-heading w-full"
        />
      </div>

      <div class="mb-20 input_holder" data-aos="fade-up" data-aos-delay="150">
        <input
          type="password"
          name="password2"
          placeholder="비밀번호 확인"
          class="input border-gray focus-action-1 color-heading placeholder-heading w-full"
        />
      </div>

      <div class="mb-20 input_holder" data-aos="fade-up" data-aos-delay="150">
        <input
          type="text"
          name="hpNum"
          placeholder="전화번호 입력"
          class="input border-gray focus-action-1 color-heading placeholder-heading w-full"
        />
      </div>

      <div data-aos="fade-up" data-aos-delay="150">
        <input
          type="checkbox"
          name="adAccecpt"
          id="form_1_checkbox"
          checked=""
          class="input d-none border-gray focus-action-1"
        />
        <label class="mt-25 color-heading w-full" for="form_1_checkbox">
          광고 수신 동의 여부
        </label>
      </div>
      <div data-aos="fade-up" data-aos-delay="300">
        <button class="btn mt-25 action-1 w-full">정보 수정 하기</button>
      </div>
    </form>
  </div>
</section>
 <!-- Modal -->
    <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
      <div class="modal-dialog 	modal-xl">
        <div class="modal-content">
          <form action="" method="POST">
          <div class="modal-header">
            <h5 class="modal-title" id="reviewModalLabel">리뷰 쓰기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            
            <span class="store_name_order"></span><br>
            <textarea class="bg-gray" cols="100" rows="20"></textarea>
            <hr>
            <div class="input-group mb-3">
              <div class="custom-file ">
                <input type="file" class="custom-file-input" id="reviewImage1" >
                <label class="custom-file-label" for="reviewImage1">Choose file</label>
              </div>
              
              
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger text-dark border btn-sm" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-outline-danger bg-dark border  btn-sm">리뷰 작성</button>
          </div>
        </form>
        </div>
      </div>
    </div>

  <%@ include file="footer.jsp" %>

