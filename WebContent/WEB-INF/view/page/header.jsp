<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Null Java 먹고죽어</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="<%=request.getContextPath()%>/asset/i/favicon.png" type="image/x-icon" />
    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Archivo+Black:wght@100;200;300;400;500;600;700;800;900&family=Merriweather:wght@100;200;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
    <!-- Bootstrap 4.5.2 CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
      crossorigin="anonymous"
    />
    <!-- Slick 1.8.1 jQuery plugin CSS (Sliders) -->
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
    />
    <!-- Fancybox 3 jQuery plugin CSS (Open images and video in popup) -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css"
    />
    <!-- AOS 2.3.4 jQuery plugin CSS (Animations) -->
    <link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet" />
    <!-- FontAwesome CSS -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
    />
    <!-- Startup CSS (Styles for all blocks) - Remove ".min" if you would edit a css code -->
    <link href="<%=request.getContextPath()%>/asset/css/style.min.css" rel="stylesheet" />
    <!-- jQuery 3.5.1 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="<%=request.getContextPath()%>/asset/css/map.css" rel="stylesheet" />
  </head>
  <body>
    <!-- Navigation 2 -->
    <nav class="pt-30 pb-30 bg-light lh-40 navigation_2">
      <div class="container px-xl-0">
        <div class="row align-items-center justify-content-between">
          <div
            class="col-xl-2 col-lg-3 text-center text-lg-left"
            data-aos="fade-up"
            data-aos-delay="0"
          >
            <a href="<%=request.getContextPath()%>/index.jsp" class="link mr-20 color-main f-24 bold">
              Null Java
            </a>
          </div>
          <div
            class="col-xl-10 col-lg-9 d-flex flex-wrap align-items-center justify-content-center justify-content-md-between"
          >
            <div class="mb-10 mb-md-0" data-aos="fade-up" data-aos-delay="150">
              <div class="d-inline-block px-20 dropdown">
                <a
                  href="board.jsp"
                  class="link color-main dropdown-toggle"
                  id="navigation_2_dropdown_1"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  게시판
                </a>
                <div
                  class="bg-light dropdown-menu"
                  aria-labelledby="navigation_2_dropdown_1"
                >
                  <div>
                    <a href="<%=request.getContextPath()%>/board.do" class="link color-main"> 이벤트 </a>
                  </div>
                  <div>
                    <a href="<%=request.getContextPath()%>/board.do" class="link color-main"> 공지사항 </a>
                  </div>
                  <div>
                    <a href="<%=request.getContextPath()%>/board.do" class="link color-main"> QnA </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="text-md-right" data-aos="fade-up" data-aos-delay="300">
              <a href="<%=request.getContextPath()%>/register.do" class="link mx-15 color-main">
                회원가입
              </a>
              <a href="<%=request.getContextPath()%>/login.do" class="link mx-15 color-main"> 로그인 </a>
              <a
                href="<%=request.getContextPath()%>/mapSearchPage.do"
                class="btn mx-15 sm color-main border-gray f-16"
              >
                가게 검색하기
              </a>
            </div>
          </div>
        </div>
      </div>
    </nav>