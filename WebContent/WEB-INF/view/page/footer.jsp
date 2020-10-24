<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Footer 1 -->
    <footer class="pt-75 pb-65 bg-light text-center footer_1">
      <div class="container px-xl-0">
        <div class="row justify-content-between align-items-center lh-40 links">
          <div
            class="col-lg-4 col-sm-6 text-sm-right text-lg-left order-1 order-lg-0"
            data-aos="fade-up"
            data-aos-delay="150"
          >
            <a href="#" class="link mr-15 color-main"> 널자바에대해 </a>
            <a href="#" class="link mx-15 color-main"> 정책 </a>
            <a href="#" class="link mx-15 color-main"> 규칙 </a>
          </div>
          <div
            class="mb-10 mb-lg-0 col-lg-auto order-0"
            data-aos="fade-up"
            data-aos-delay="0"
          >
            <a href="#" class="link logo color-main"> Null Java </a>
          </div>
          <div
            class="col-lg-4 col-sm-6 text-sm-left text-lg-right order-2 order-lg-0"
            data-aos="fade-up"
            data-aos-delay="150"
          >
            <a href="#" class="link mr-15 color-main"> 연락처 </a>
            <a href="#" class="mx-15 link color-main">
              <i class="fab fa-twitter"> </i>
            </a>
            <a href="#" class="mx-15 link color-main">
              <i class="fab fa-facebook-square"> </i>
            </a>
            <a href="#" class="ml-15 link color-main">
              <i class="fab fa-google-plus-g"> </i>
            </a>
          </div>
        </div>
        <div class="row justify-content-center">
          <div
            class="mt-10 col-xl-4 col-lg-5 col-md-6 col-sm-8"
            data-aos="fade-up"
            data-aos-delay="0"
          >
            <div class="color-heading text-adaptive">
              와 오늘 저녁은 치킨이닭
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- forms alerts -->
    <div
      class="alert alert-success alert-dismissible fixed-top alert-form-success"
      role="alert"
    >
      <button
        type="button"
        class="close"
        data-dismiss="alert"
        aria-label="Close"
      >
        <span aria-hidden="true">&times;</span>
      </button>
      Thanks for your message!
    </div>
    <div
      class="alert alert-warning alert-dismissible fixed-top alert-form-check-fields"
      role="alert"
    >
      <button
        type="button"
        class="close"
        data-dismiss="alert"
        aria-label="Close"
      >
        <span aria-hidden="true">&times;</span>
      </button>
      Please, fill in required fields.
    </div>
    <div
      class="alert alert-danger alert-dismissible fixed-top alert-form-error"
      role="alert"
    >
      <button
        type="button"
        class="close"
        data-dismiss="alert"
        aria-label="Close"
      >
        <span aria-hidden="true">&times;</span>
      </button>
      <div class="message">
        데이터를 보내는데 에러가 발생하였씁니다.
        <a href="" target="_blank" class="link color-transparent-white"
          >안내링크</a
        >.
      </div>
    </div>

    <!-- gReCaptcha popup (uncomment if you need a recaptcha integration) -->
    <!--
		<div class="bg-dark op-8 grecaptcha-overlay"></div>
		<div class="bg-light radius10 w-350 h-120 px-20 pt-20 pb-20 grecaptcha-popup">
			<div class="w-full h-full d-flex justify-content-center align-items-center">
				<div id="g-recaptcha" data-sitekey="PUT_YOUR_SITE_KEY_HERE"></div>
			</div>
		</div>
		<script src="https://www.google.com/recaptcha/api.js?render=explicit" async defer></script>
		-->
    <!-- Bootstrap 4.5.2 JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <!-- Fancybox 3 jQuery plugin JS (Open images and video in popup) -->
    <script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
    <!-- 
			Google maps JS API 
			Don't forget to replace the key "AIzaSyDP6Ex5S03nvKZJZSvGXsEAi3X_tFkua4U" to your own! 
			Learn how to get a key: https://help.designmodo.com/article/startup-google-maps-api/ 
		-->
    <script
      type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyDP6Ex5S03nvKZJZSvGXsEAi3X_tFkua4U"
    ></script>
    <!-- Slick 1.8.1 jQuery plugin JS (Sliders) -->
    <script
      type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
    ></script>
    <!-- AOS 2.3.4 jQuery plugin JS (Animations) -->
    <script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
    <!-- Maskedinput jQuery plugin JS (Masks for input fields) -->
    <script src="<%=request.getContextPath()%>/asset/js/jquery.maskedinput.min.js"></script>
    <!-- Startup JS (Custom js for all blocks) -->
    <script src="<%=request.getContextPath()%>/asset/js/script.js"></script>
    
    <script src="<%=request.getContextPath()%>/asset/js/pagechange.js"></script>

  </body>
</html>
