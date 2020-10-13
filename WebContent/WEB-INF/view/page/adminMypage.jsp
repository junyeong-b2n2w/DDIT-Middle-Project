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
        관리자 페이지
      </h1>
    </div>
  </div>
</header>

<section class="pt-105 pb-90 bg-light text-center showcase_2">
  <!--정보 출력 버튼-->

  <button
    id="member_list_button"
    type="button"
    class="btn btn-outline-danger text-white active border btn-lg"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;회원 관리&nbsp;&nbsp;&nbsp;&nbsp;
  </button>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <button
    id="store_list_button"
    type="button"
    class="btn btn-danger text-white border btn-lg text-dark"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;매장 관리&nbsp;&nbsp;&nbsp;&nbsp;
  </button>

  <!--사용자 관리 보기-->
  <div id="member_list" class="container px-xl-0 pt-40">
    <h2 class="pb-40">회원 관리</h2>
    <input
      type="text"
      class="input border text-dark placeholder-heading"
      placeholder="아이디 검색"
    />
    <button
      type="button"
      class="btn btn-danger text-white border btn-lg text-dark"
    >
      검색하기
    </button>
    <table class="table table-bordered text-justify text-center mt-20">
      <tr class="bg-gray">
        <th></th>
        <th>회원명</th>
        <th>아이디</th>
        <th>이메일</th>
        <th>연락처</th>
        <th>회원 벤하기</th>
      </tr>
      <tr class="text-center">
        <td class="align-middle">1</td>
        <td class="align-middle">userName</td>
        <td class="align-middle"><a href="">userId</a></td>
        <td class="align-middle">userEmail</td>
        <td class="align-middle">userTel</td>
        <td class="align-middle">
          <button
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm"
          >
            회원 벤
          </button>
        </td>
      </tr>

      <tr class="text-center">
        <td class="align-middle">2</td>
        <td class="align-middle">userName</td>
        <td class="align-middle"><a href="">userId</a></td>
        <td class="align-middle">userEmail</td>
        <td class="align-middle">userTel</td>
        <td class="align-middle">
          <button
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm"
          >
            회원 벤
          </button>
        </td>
      </tr>

      <tr class="text-center">
        <td class="align-middle">3</td>
        <td class="align-middle">userName</td>
        <td class="align-middle"><a href="">userId</a></td>
        <td class="align-middle">userEmail</td>
        <td class="align-middle">userTel</td>
        <td class="align-middle">
          <button
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm"
          >
            회원 벤
          </button>
        </td>
      </tr>

      <tr class="text-center">
        <td class="align-middle">4</td>
        <td class="align-middle">userName</td>
        <td class="align-middle"><a href="">userId</a></td>
        <td class="align-middle">userEmail</td>
        <td class="align-middle">userTel</td>
        <td class="align-middle">
          <button
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm"
          >
            회원 벤
          </button>
        </td>
      </tr>

      <tr class="text-center">
        <td class="align-middle">5</td>
        <td class="align-middle">userName</td>
        <td class="align-middle"><a href="">userId</a></td>
        <td class="align-middle">userEmail</td>
        <td class="align-middle">userTel</td>
        <td class="align-middle">
          <button
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm"
          >
            회원 벤
          </button>
        </td>
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
  <!-- 매장관리 수정-->
  <div id="store_list_info" class="container px-xl-0 pt-40 d-none">
    <h2 class="pb-40">매장 관리</h2>
    <input
      type="text"
      class="input border text-dark placeholder-heading"
      placeholder="매장 검색"
    />
    <button
      type="button"
      class="btn btn-danger text-white border btn-lg text-dark"
    >
      검색하기
    </button>
    <table class="table table-bordered text-justify text-center mt-20">
      <tr class="bg-gray">
        <th></th>
        <th>가게 브랜드</th>
        <th>가게 명</th>
        <th>점주 아이디</th>
        <th>연락처</th>
        <th>가게 승인하기</th>
      </tr>
      <tr class="text-center">
        <td class="align-middle">1</td>
        <td class="align-middle">brand</td>
        <td class="align-middle"><a href="">storeName</a></td>
        <td class="align-middle">owID</td>
        <td class="align-middle">userTel</td>
        <td class="align-middle">
          <button
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm"
          >
            승인하기
          </button>
        </td>
      </tr>

      <tr class="text-center">
        <td class="align-middle">2</td>
        <td class="align-middle">brand</td>
        <td class="align-middle"><a href="">storeName</a></td>
        <td class="align-middle">owID</td>
        <td class="align-middle">userTel</td>
        <td class="align-middle">
          <button
            type="button"
            class="btn btn-outline-danger disabled text-dark border btn-sm"
          >
            승인하기
          </button>
        </td>
      </tr>
      <tr class="text-center">
        <td class="align-middle">3</td>
        <td class="align-middle">brand</td>
        <td class="align-middle"><a href="">storeName</a></td>
        <td class="align-middle">owID</td>
        <td class="align-middle">userTel</td>
        <td class="align-middle">
          <button
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm"
          >
            승인하기
          </button>
        </td>
      </tr>
      <tr class="text-center">
        <td class="align-middle">4</td>
        <td class="align-middle">brand</td>
        <td class="align-middle"><a href="">storeName</a></td>
        <td class="align-middle">owID</td>
        <td class="align-middle">userTel</td>
        <td class="align-middle">
          <button
            type="button"
            class="btn btn-outline-danger text-dark border btn-sm"
          >
            승인하기
          </button>
        </td>
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

  <%@ include file="footer.jsp" %>
</section>
