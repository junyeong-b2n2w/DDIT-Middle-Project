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
            <img />서울동 서울점
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
        <form>
          <div class="accordion" id="accordionExample">
            <div class="card">
              <div class="card-header" id="headingOne">
                <h2 class="mb-0">
                  <button
                    class="btn btn-link btn-block text-left text-dark"
                    type="button"
                    data-toggle="collapse"
                    data-target="#collapseOne"
                    aria-expanded="true"
                    aria-controls="collapseOne"
                  >
                    메뉴그룹 1#
                  </button>
                </h2>
              </div>

              <div
                id="collapseOne"
                class="collapse show"
                aria-labelledby="headingOne"
              >
                <div class="card-body text-justify">
                  <div class="menu_item row pl-50">
                    <div class="menu_text col-md-8">
                      <span class="menu_name"><h4>메뉴 이름</h4></span><br />
                      <span class="menu_price">메뉴 가격</span><br />
                    </div>
                    <div class="menu_count col-md-auto te">
                      <input
                        type="number"
                        min="0"
                        max="10"
                        class="border border-gray"
                        value="0"
                      />
                      <button class="cnt_plus text-dark">+</button>
                      <button class="cnt_minus text-dark">-</button>
                    </div>
                  </div>
                  <hr />
                  <div class="menu_item row pl-50">
                    <div class="menu_text col-md-8">
                      <span class="menu_name"><h4>메뉴 이름</h4></span><br />
                      <span class="menu_price">메뉴 가격</span><br />
                    </div>
                    <div class="menu_count col-md-auto te">
                      <input
                        type="number"
                        min="0"
                        max="10"
                        class="border border-gray"
                        value="0"
                      />
                      <button type="button" class="cnt_plus text-dark">
                        +
                      </button>
                      <button class="cnt_minus text-dark">-</button>
                    </div>
                  </div>
                  <hr />
                  <div class="menu_item row pl-50">
                    <div class="menu_text col-md-8">
                      <span class="menu_name"><h4>메뉴 이름</h4></span><br />
                      <span class="menu_price">메뉴 가격</span><br />
                    </div>
                    <div class="menu_count col-md-auto te">
                      <input
                        type="number"
                        min="0"
                        max="10"
                        class="border border-gray"
                        value="0"
                      />
                      <button class="cnt_plus text-dark">+</button>
                      <button class="cnt_minus text-dark">-</button>
                    </div>
                  </div>
                  <hr />
                  <div class="menu_item row pl-50">
                    <div class="menu_text col-md-8">
                      <span class="menu_name"><h4>메뉴 이름</h4></span><br />
                      <span class="menu_price">메뉴 가격</span><br />
                    </div>
                    <div class="menu_count col-md-auto te">
                      <input
                        type="number"
                        min="0"
                        max="10"
                        class="border border-gray"
                        value="0"
                      />
                      <button class="cnt_plus text-dark">+</button>
                      <button class="cnt_minus text-dark">-</button>
                    </div>
                  </div>
                  <hr />
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header" id="headingTwo">
                <h2 class="mb-0">
                  <button
                    class="btn btn-link btn-block text-left collapsed text-dark"
                    type="button"
                    data-toggle="collapse"
                    data-target="#collapseTwo"
                    aria-expanded="false"
                    aria-controls="collapseTwo"
                  >
                    메뉴그룹 2#
                  </button>
                </h2>
              </div>
              <div
                id="collapseTwo"
                class="collapse show"
                aria-labelledby="headingTwo"
              >
                <div class="card-body">메뉴그룹 설명</div>
              </div>
            </div>
            <div class="card">
              <div class="card-header" id="headingThree">
                <h2 class="mb-0">
                  <button
                    class="btn btn-link btn-block text-left collapsed text-dark"
                    type="button"
                    data-toggle="collapse"
                    data-target="#collapseThree"
                    aria-expanded="false"
                    aria-controls="collapseThree"
                  >
                    메뉴그룹 3#
                  </button>
                </h2>
              </div>
              <div
                id="collapseThree"
                class="collapse show"
                aria-labelledby="headingThree"
              >
                <div class="card-body">메뉴그룹 설명</div>
              </div>
            </div>

            <div class="card">
              <div class="card-header" id="headingFour">
                <h2 class="mb-0">
                  <button
                    class="btn btn-link btn-block text-left collapsed text-dark"
                    type="button"
                    data-toggle="collapse"
                    data-target="#collapseFour"
                    aria-expanded="false"
                    aria-controls="collapseFour"
                  >
                    메뉴그룹 4#
                  </button>
                </h2>
              </div>
              <div
                id="collapseFour"
                class="collapse show"
                aria-labelledby="headingFour"
              >
                <div class="card-body">메뉴그룹 설명</div>
              </div>
            </div>
          </div>
        </form>
      </div>

      <!--라뷰보기-->
      <div id="review_list" class="container px-xl-0 pt-40 d-none">
        <h2 class="pb-40">리뷰</h2>
        <table class="table table-bordered">
          <tr class="">
            <td class="text-justify">
              <div class="review_content pl-50 pr-50">
                <h4 class="review_writer d-inline-block">review</h4>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="review_stars cont">⭐️⭐️⭐️⭐️⭐️⭐️</span>
                <div class="review_img pt-20">
                  <img src="<%=request.getContextPath()%>/asset/i/showcase_2_img_1.jpg" />
                </div>
                <div class="review_content pt-20">리뷰내용리뷰내용</div>
              </div>
            </td>
          </tr>

          <tr class="">
            <td class="text-justify">
              <div class="review_content pl-50 pr-50">
                <h4 class="review_writer d-inline-block">review</h4>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="review_stars cont">⭐️⭐️⭐️⭐️⭐️⭐️</span>
                <div class="review_img pt-20">
                  <img src="<%=request.getContextPath()%>/asset/i/showcase_2_img_1.jpg" />
                </div>
                <div class="review_content pt-20">리뷰내용리뷰내용</div>
              </div>
            </td>
          </tr>

          <tr class="">
            <td class="text-justify">
              <div class="review_content pl-50 pr-50">
                <h4 class="review_writer d-inline-block">review</h4>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="review_stars cont">⭐️⭐️⭐️⭐️⭐️⭐️</span>
                <div class="review_img pt-20">
                  <img src="<%=request.getContextPath()%>/asset/i/showcase_2_img_1.jpg" />
                </div>
                <div class="review_content pt-20">리뷰내용리뷰내용</div>
              </div>
            </td>
          </tr>

          <tr class="">
            <td class="text-justify">
              <div class="review_content pl-50 pr-50">
                <h4 class="review_writer d-inline-block">review</h4>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="review_stars cont">⭐️⭐️⭐️⭐️⭐️⭐️</span>
                <div class="review_img pt-20">
                  <img src="<%=request.getContextPath()%>/asset/i/showcase_2_img_1.jpg" />
                </div>
                <div class="review_content pt-20">리뷰내용리뷰내용</div>
              </div>
            </td>
          </tr>
        </table>
      </div>

      <!--가게 정보 보기-->
      <div id="store_info_list" class="container px-xl-0 pt-40 d-none">
        <h2 class="pb-40">가게 정보</h2>

        <div class="store_info_content text-justify pl-50 pr-50">
          <h4 class="pt-40">가게소개</h4>
          <hr />
          <table>
            <tr>
              <td>
                가게소개 가게소개 가게소개 가게소개 가게소개 가게소개 가게소개
                가게소개 가게소개 가게소개 가게소개 가게소개 가게소개 가게소개
                가게소개 가게소개 가게소개 가게소개 가게소개 가게소개 가게소개
                가게소개 가게소개 가게소개 가게소개 가게소개 가게소개
              </td>
            </tr>
          </table>
          <hr />

          <h4 class="pt-40">업체정보</h4>
          <hr />
          <table>
            <tr>
              <td>영업시간</td>
              <td>10:00--</td>
            </tr>
            <tr>
              <td>전화번호</td>
              <td>1234123</td>
            </tr>
            <tr>
              <td>주소</td>
              <td>대전대전</td>
            </tr>
            <tr>
              <td>부가정보</td>
              <td>10:00--</td>
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

          <hr />
          <h4 class="pt-40">원산지정보</h4>
          <hr />
          <table>
            <tr>
              <td>영업시간</td>
              <td>10:00--</td>
            </tr>
            <tr>
              <td>전화번호</td>
              <td>10:00--</td>
            </tr>
            <tr>
              <td>주소</td>
              <td>10:00--</td>
            </tr>
            <tr>
              <td>부가정보</td>
              <td>10:00--</td>
            </tr>
          </table>
          <hr />
        </div>
      </div>
    </section>

<%@ include file="footer.jsp" %>
