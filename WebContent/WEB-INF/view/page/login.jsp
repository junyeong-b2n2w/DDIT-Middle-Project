<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    
    <script>
console.log("<%=session.getAttribute("mem_id")%>")
	if("<%=session.getAttribute("mem_id")%>" != "null"){
		location.href = "<%=request.getContextPath()%>/main.do";
	}

</script>
    
    <!-- Form 1 -->
    
    <section
      class="pt-120 pb-120 bg-dark form_1"
      data-bg-src="<%=request.getContextPath()%>/asset/i/ham_back.jpg"
      data-bg-src-2x="<%=request.getContextPath()%>/asset/i/ham_back.jpg"
    >
      <div class="container px-xl-0">
        <form
          action="<%=request.getContextPath()%>/user/loginMember.do"
          method="post"
          class="bg-light mx-auto mw-430 radius10 pt-40 px-50 pb-30"
        >
          <h2
            class="mb-40 small text-center"
            data-aos="fade-up"
            data-aos-delay="0"
          >
            로그인
          </h2>
          <div class="mb-20 input_holder" data-aos="fade-up" data-aos-delay="0">
            <input
              type="text"
              name="mem_id"
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
              name="mem_pw"
              placeholder="비밀번호 입력"
              class="input border-gray focus-action-1 color-heading placeholder-heading w-full"
            />
          </div>
          <div data-aos="fade-up" data-aos-delay="150">
            <input
              type="checkbox"
              name="rules"
              id="form_1_checkbox"
              checked=""
              class="input d-none border-gray focus-action-1"
            />
            <label class="mt-25 color-heading w-full" for="form_1_checkbox">
              아이디 기억
            </label>
          </div>
          <div data-aos="fade-up" data-aos-delay="300">
            <button class="btn mt-25 action-1 w-full">로그인</button>
          </div>
          <div
            class="mt-50 hr bg-gray h-1"
            data-aos="fade-up"
            data-aos-delay="300"
          ></div>
          <div
            class="mt-25 f-18 medium color-heading text-center"
            data-aos="fade-up"
            data-aos-delay="450"
          >
            <span> 아이디가 없으신가요? </span>
            <a href="<%=request.getContextPath()%>/register.do" class="link action-1"> 회원가입 </a>
          </div>
        </form>
      </div>
    </section>

<%@ include file="footer.jsp" %>