<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    <!-- Form 1 -->
    <section
      class="pt-120 pb-120 bg-dark form_1"
      data-bg-src="<%=request.getContextPath()%>/asset/i/form_1_bg@2x.jpg"
      data-bg-src-2x="<%=request.getContextPath()%>/asset/i/form_1_bg@2x.jpg"
    >
      <div class="container px-xl-0">
        <form
          action=""
          method="post"
          class="bg-light mx-auto mw-600 radius10 pt-40 px-50 pb-30"
        >
          <h2
            class="mb-40 small text-center"
            data-aos="fade-up"
            data-aos-delay="0"
          >
            회원가입
          </h2>
          <div
            class="mb-20 input_holder"
            data-aos="fade-up"
            data-aos-delay="150"
          >
            <input
              type="text"
              name="userId"
              placeholder="아이디 입력"
              class="input border-gray focus-action-1 color-heading placeholder-heading w-full"
            />
          </div>
          <div
            class="mb-20 input_holder"
            data-aos="fade-up"
            data-aos-delay="150"
          >
            <input
              type="text"
              name="userName"
              placeholder="이름 입력"
              class="input border-gray focus-action-1 color-heading placeholder-heading w-full"
            />
          </div>
          <div
            class="mb-20 input_holder"
            data-aos="fade-up"
            data-aos-delay="150"
          >
            <input
              type="email"
              name="email"
              placeholder="이메일 입력"
              class="input border-gray focus-action-1 color-heading placeholder-heading w-full"
            />
          </div>
          <div
            class="mb-20 input_holder"
            data-aos="fade-up"
            data-aos-delay="150"
          >
            <input
              type="password"
              name="password"
              placeholder="비밀번호 입력"
              class="input border-gray focus-action-1 color-heading placeholder-heading w-full"
            />
          </div>

          <div
            class="mb-20 input_holder"
            data-aos="fade-up"
            data-aos-delay="150"
          >
            <input
              type="password"
              name="password2"
              placeholder="비밀번호 확인"
              class="input border-gray focus-action-1 color-heading placeholder-heading w-full"
            />
          </div>

          <div
            class="mb-20 input_holder"
            data-aos="fade-up"
            data-aos-delay="150"
          >
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
            <button class="btn mt-25 action-1 w-full">회원가입 하기</button>
          </div>
        </form>
      </div>
    </section>

<%@ include file="footer.jsp" %>