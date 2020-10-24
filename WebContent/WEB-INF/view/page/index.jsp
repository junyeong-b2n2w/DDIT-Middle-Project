<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

    <!-- Header 2 -->
    <header class="pt-190 pb-120 bg-dark header_2"
    data-bg-src="<%=request.getContextPath()%>/asset/i/three_burger.png"
	data-bg-src-2x="<%=request.getContextPath()%>/asset/i/three_burger.png">
      <div class="container text-center">
        <h1
          class="big color-white text-center"
          data-aos="fade-up"
          data-aos-delay="0"
        >
          버거는 살 안쪄요
          <br />내가 쪄요
        </h1>

       
         
            <a href="<%=request.getContextPath()%>/page/map_search.do" data-aos="fade-up"
          data-aos-delay="0" class="btn action-1 xl text-center bg-danger mt-20 w-600">주문하러 가기</a>
         
        
      </div>
    </header>

    <!-- Showcase 2 -->
    <section class="pt-105 pb-90 bg-light text-center showcase_2">
      <div class="container px-xl-0">
        <div class="row justify-content-center">
          <div class="col-xl-8 col-lg-10">
            <h2 class="small" data-aos="fade-up" data-aos-delay="0">
              햄버거 브랜드들
            </h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 col-sm-6" data-aos="fade-up" data-aos-delay="0">
            <a href="<%=request.getContextPath() %>/page/map_search.do?brand=1" class="mt-50 link color-main">
              <img
                src="<%=request.getContextPath()%>/asset/i/macdonald.png"
                srcset="<%=request.getContextPath()%>/asset/i/macdonald.png"
                alt="" width="300px"
                class="img-fluid radius10 "
              />
              <div class="mt-20 mb-15 f-22 title">맥도날드</div>
              <div class="color-heading f-14 semibold text-uppercase sp-20">
                매그도나르도
              </div>
            </a>
           </div>
          
          
          <div
            class="col-md-4 col-sm-6"
            data-aos="fade-up"
            data-aos-delay="150"
          >
            <a href="<%=request.getContextPath() %>/page/map_search.do?brand=2" class="mt-50 link color-main">
              <img
                src="<%=request.getContextPath()%>/asset/i/lotteria.jpg"
                srcset="<%=request.getContextPath()%>/asset/i/lotteria.jpg"
                alt="" width="300px"
                class="img-fluid radius10"
              />
              <div class="mt-20 mb-15 f-22 title">롯데리아</div>
              <div class="color-heading f-14 semibold text-uppercase sp-20">
                로떼리아
              </div>
            </a>
          </div>
          
          
          
          
           <div
            class="col-md-4 col-sm-6"
            data-aos="fade-up"
            data-aos-delay="300"
          >
            <a href="<%=request.getContextPath() %>/page/map_search.do?brand=3" class="mt-50 link color-main">
              <img
                src="<%=request.getContextPath()%>/asset/i/burger_king.png"
                srcset="<%=request.getContextPath()%>/asset/i/burger_king.png"
                alt="" width="300px"
                class="img-fluid radius10"
              />
              <div class="mt-20 mb-15 f-22 title">버거킹</div>
              <div class="color-heading f-14 semibold text-uppercase sp-20">
                버거의 제왕
              </div>
            </a>
          </div>
          
          <div
            class="col-md-4 col-sm-6"
            data-aos="fade-up"
            data-aos-delay="300"
          >
            <a href="<%=request.getContextPath() %>/page/map_search.do?brand=4" class="mt-50 link color-main">
              <img
                src="<%=request.getContextPath()%>/asset/i/momstouch.jpg"
                srcset="<%=request.getContextPath()%>/asset/i/momstouch.jpg"
                alt="" width="300px"
                class="img-fluid radius10"
              />
              <div class="mt-20 mb-15 f-22 title">맘스터치</div>
              <div class="color-heading f-14 semibold text-uppercase sp-20">
                엄마의 손길
              </div>
            </a>
          </div>
          
          <div
            class="col-md-4 col-sm-6"
            data-aos="fade-up"
            data-aos-delay="300"
          >
            <a href="<%=request.getContextPath() %>/page/map_search.do?brand=5" class="mt-50 link color-main">
              <img
                src="<%=request.getContextPath()%>/asset/i/popeyes.jpg"
                srcset="<%=request.getContextPath()%>/asset/i/popeyes.jpg"
                alt="" width="300px"
                class="img-fluid radius10"
              />
              <div class="mt-20 mb-15 f-22 title">파파이스</div>
              <div class="color-heading f-14 semibold text-uppercase sp-20">
                아빠의 버거
              </div>
            </a>
          </div>
          
        </div>
      </div>
    </section>

<%@ include file="footer.jsp" %>