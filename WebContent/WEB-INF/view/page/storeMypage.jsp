<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    <!-- Header 2 -->
    <header class="bg-dark header_2">
      <div class="container pt-50 pb-50">
        <div class="store_header">
          <h1
            class="big color-white text-center"
            data-aos="fade-up"
            data-aos-delay="0"
          >
            지점 관리 페이지
          </h1>
        </div>
      </div>
    </header>

    <section class="pt-105 pb-90 bg-light text-center showcase_2">
      <!--정보 출력 버튼-->
     
    
      <button
        id="order_list_button"
        type="button"
        class="btn btn-outline-danger text-white active border btn-lg"
      >
        &nbsp;&nbsp;&nbsp;&nbsp;주문상세&nbsp;&nbsp;&nbsp;&nbsp;</button
      >
      &nbsp;&nbsp;&nbsp;&nbsp;
      <button
      id="store_info_button"
      type="button"
      class="btn btn-danger text-white border btn-lg text-dark"
    >
      &nbsp;&nbsp;&nbsp;&nbsp;매장 정보 관리&nbsp;&nbsp;&nbsp;&nbsp;
    </button>&nbsp;&nbsp;&nbsp;&nbsp;
    <button
    id="store_review_button"
    type="button"
    class="btn btn-danger text-white border btn-lg text-dark"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;리뷰 관리&nbsp;&nbsp;&nbsp;&nbsp;
  </button>&nbsp;&nbsp;&nbsp;&nbsp;
  <button
  id="sales_button"
  type="button"
  class="btn btn-danger text-white border btn-lg text-dark"
>
  &nbsp;&nbsp;&nbsp;&nbsp;매출 관리&nbsp;&nbsp;&nbsp;&nbsp;
</button>
     

      

      <!--주문 관리 보기-->
      <div id="order_list" class="container px-xl-0 pt-40 ">
        <h2 class="pb-40">주문 관리</h2>
            <input type="text" class="input border text-dark placeholder-heading" placeholder="주문상태  검색" >
            <button type="button" class="btn btn-danger text-white border btn-lg text-dark">검색하기</button>
        <table class="table table-bordered text-justify text-center mt-20">
          <tr class="bg-gray">
            <th class="w-100">주문번호</th>
            <th class="w-300">주문품목 및 수량</th>
            <th class="w-300">요청사항</th>
            <th class="w-100">배달상태</th>
          </tr>
          <tr class="text-center">
            <td class="align-middle">1</td>
            <td class="align-middle">주문 품목 </td>
            <td class="align-middle">요청사항</td>
            <td class="align-middle"><button
              
              type="button"
              class="btn btn-outline-danger  text-dark border btn-sm"
            >
              준비중</button
            ></td>
            
            
          </tr>

          <tr class="text-center">
            <td class="align-middle">1</td>
            <td class="align-middle">주문 품목 </td>
            <td class="align-middle">요청사항</td>
            <td class="align-middle"><button
              
              type="button"
              class="btn btn-outline-danger  text-dark border btn-sm"
            >
              준비중</button
            ></td>
            
            
          </tr>
          <tr class="text-center">
            <td class="align-middle">1</td>
            <td class="align-middle">주문 품목 </td>
            <td class="align-middle">요청사항</td>
            <td class="align-middle"><button
              
              type="button"
              class="btn btn-outline-danger  text-dark border btn-sm"
            >
              준비중</button
            ></td>
            
            
          </tr>

        </table>

        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>
<!-- 매장정보 수정-->
<div id="store_info" class="container px-xl-0 pt-40 d-none">
        
  <h2 class="pb-40">매장 정보 관리</h2>
         
</div>
    
<!-- 매장 리뷰 수정-->
<div id="store_review" class="container px-xl-0 pt-40 d-none">
        
  <h2 class="pb-40">매장 리뷰 관리</h2>
  <input type="text" class="input border text-dark placeholder-heading" placeholder="리뷰 검색" >
  <button type="button" class="btn btn-danger text-white border btn-lg text-dark">검색하기</button>
 
        <table class="table table-bordered mt-20">
          
             <tr class="">
              <td class="text-justify">
                <div class="store_img pt-10 pb-10 d-inline-block w-200">
                  <img src="i/showcase_2_img_1.jpg" width="150px" />
                </div>
                <div class="review_content d-inline-block pl-50 pr-50 w-750">
                  <h5 class="review_menu d-inline-block">메뉴제목</h5>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span class="review_stars cont">⭐️ 3.5</span><br />
                  <div class="review_content pt-20 d-inline-block">
                    리뷰내용
                  </div>
                </div>
                <div class="review_reply_button d-inline-block w-150">
                  <button
              
              type="button"
              class="btn btn-outline-danger bg-dark border btn-sm"
            >
              답글달기</button
            >
                </div>
              </td>
            </tr>

            <tr class="">
              <td class="text-justify">
                <div class="store_img pt-10 pb-10 d-inline-block w-200">
                  <img src="i/showcase_2_img_1.jpg" width="150px" />
                </div>
                <div class="review_content d-inline-block pl-50 pr-50 w-750">
                  <h5 class="review_menu d-inline-block">메뉴제목</h5>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span class="review_stars cont">⭐️ 3.5</span><br />
                  <div class="review_content pt-20 d-inline-block">
                    리뷰내용
                  </div>
                </div>
                <div class="review_reply_button d-inline-block w-150">
                  <button
              
              type="button"
              class="btn btn-outline-danger bg-dark border btn-sm"
            >
              답글달기</button
            >
                </div>
              </td>
            </tr>

            <tr class="">
              <td class="text-justify">
                <div class="store_img pt-10 pb-10 d-inline-block w-200">
                  <img src="i/showcase_2_img_1.jpg" width="150px" />
                </div>
                <div class="review_content d-inline-block pl-50 pr-50 w-750">
                  <h5 class="review_menu d-inline-block">메뉴제목</h5>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span class="review_stars cont">⭐️ 3.5</span><br />
                  <div class="review_content pt-20 d-inline-block">
                    리뷰내용
                  </div>
                </div>
                <div class="review_reply_button d-inline-block w-150">
                  <button
              
              type="button"
              class="btn btn-outline-danger bg-dark border btn-sm"
            >
              답글달기</button
            >
                </div>
              </td>
            </tr>

            <tr class="">
              <td class="text-justify">
                <div class="store_img pt-10 pb-10 d-inline-block w-200">
                  <img src="i/showcase_2_img_1.jpg" width="150px" />
                </div>
                <div class="review_content d-inline-block pl-50 pr-50 w-750">
                  <h5 class="review_menu d-inline-block">메뉴제목</h5>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span class="review_stars cont">⭐️ 3.5</span><br />
                  <div class="review_content pt-20 d-inline-block">
                    리뷰내용
                  </div>
                </div>
                <div class="review_reply_button d-inline-block w-150">
                  <button
              
              type="button"
              class="btn btn-outline-danger bg-dark border btn-sm"
            >
              답글달기</button
            >
                </div>
              </td>
            </tr>

        </table>
</div>

<!-- 매출 정보 수정-->
<div id="sales" class="container px-xl-0 pt-40 d-none">
        
  <h2 class="pb-40">매출 관리</h2>
         
</div>

<%@ include file="footer.jsp" %>