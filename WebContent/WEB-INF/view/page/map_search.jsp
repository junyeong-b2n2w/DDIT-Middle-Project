<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>



    <!-- Header 2 -->
    <header class="pt-50 pb-100 bg-dark header_2">
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
        <script
          type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3884405e456b656703a94dfd63808e89&libraries=services"
        ></script>
        <script
          type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3884405e456b656703a94dfd63808e89"
        ></script>

        <br />
        <input
          id="addr_search_input"
          type="text"
          name="address"
          class="input mw-600 col lg border-transparent-white focus-white bg-white color-dark mb-10 mr-5 f-20"
        />
        <button class="btn action-1 lg">입력된 주소로 검색하기</button>
        <button class="btn action-1 lg">현재위치 가져오기</button>
      </div>
    </header>

    <!-- Showcase 2 -->
    <section class="pt-50 pb-90 bg-light text-center showcase_2">
      <div class="container px-xl-0">
        <!--라뷰보기-->
        <div id="store_list" class="container px-xl-0 pt-40">
          <h2 class="pb-40">검색 결과</h2>
          <table class="table">
            <tr class="">
              <td class="text-justify">
                <div class="store_img pt-10 pb-10 d-inline-block">
                  <img src="<%=request.getContextPath()%>/asset/i/showcase_2_img_1.jpg" width="200px" />
                </div>
                <div class="store_content d-inline-block pl-50 pr-50">
                  <h3 class="store_title d-inline-block">가게이름</h3>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span class="store_stars cont">⭐️ 3.5</span><br />
                  <div class="review_content pt-20 d-inline-block">
                    가게 설명
                  </div>
                </div>
              </td>
            </tr>

            <tr class="">
              <td class="text-justify">
                <div class="store_img pt-10 pb-10 d-inline-block">
                  <img src="<%=request.getContextPath()%>/asset/i/showcase_2_img_1.jpg" width="200px" />
                </div>
                <div class="store_content d-inline-block pl-50 pr-50">
                  <h3 class="store_title d-inline-block">가게이름</h3>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span class="store_stars cont">⭐️ 3.5</span><br />
                  <div class="review_content pt-20 d-inline-block">
                    가게 설명
                  </div>
                </div>
              </td>
            </tr>

            <tr class="">
              <td class="text-justify">
                <div class="store_img pt-10 pb-10 d-inline-block">
                  <img src="<%=request.getContextPath()%>/asset/i/showcase_2_img_1.jpg" width="200px" />
                </div>
                <div class="store_content d-inline-block pl-50 pr-50">
                  <h3 class="store_title d-inline-block">가게이름</h3>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span class="store_stars cont">⭐️ 3.5</span><br />
                  <div class="review_content pt-20 d-inline-block">
                    가게 설명
                  </div>
                </div>
              </td>
            </tr>

            <tr class="">
              <td class="text-justify">
                <div class="store_img pt-10 pb-10 d-inline-block">
                  <img src="<%=request.getContextPath()%>/asset/i/showcase_2_img_1.jpg" width="200px" />
                </div>
                <div class="store_content d-inline-block pl-50 pr-50">
                  <h3 class="store_title d-inline-block">가게이름</h3>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span class="store_stars cont">⭐️ 3.5</span><br />
                  <div class="review_content pt-20 d-inline-block">
                    가게 설명
                  </div>
                </div>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </section>
  
  <%@ include file="footer.jsp" %>