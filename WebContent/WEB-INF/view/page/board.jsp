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
        게시판
      </h1>
    </div>
  </div>
</header>

<section class="pt-105 pb-90 bg-light text-center showcase_2">
  <!--정보 출력 버튼-->

  <button
    id="event_button"
    type="button"
    class="btn btn-outline-danger text-white active border btn-lg"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;이벤트&nbsp;&nbsp;&nbsp;&nbsp;
  </button>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <button
    id="notice_button"
    type="button"
    class="btn btn-danger text-white border btn-lg text-dark"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;공지사항&nbsp;&nbsp;&nbsp;&nbsp;</button
  >&nbsp;&nbsp;&nbsp;&nbsp;
  <button
    id="qna_button"
    type="button"
    class="btn btn-danger text-white border btn-lg text-dark"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;문의사항&nbsp;&nbsp;&nbsp;&nbsp;
  </button>

  <!--이벤트목록 보기-->
  <div id="event_list" class="container px-xl-0 pt-40">
    <h2 class="pb-40">이벤트 목록</h2>
    <table class="table table-bordered text-justify text-center">
      <tr class="bg-gray">
        <th class="w-100">번호</th>
        <th class="">제목</th>
        <th class="w-100">작성자</th>
        <th class="w-100">작성일</th>
      </tr>
      <tr class="text-center">
        <td class="align-middle">1</td>
        <td class="align-middle"><a href="">제목 1</a></td>
        <td class="align-middle">관리자</td>
        <td class="align-middle">10/5</td>
      </tr>

      <tr class="text-center">
        <td class="align-middle">1</td>
        <td class="align-middle"><a href="">제목 1</a></td>
        <td class="align-middle">관리자</td>
        <td class="align-middle">10/5</td>
      </tr>
      <tr class="text-center">
        <td class="align-middle">1</td>
        <td class="align-middle"><a href="">제목 1</a></td>
        <td class="align-middle">관리자</td>
        <td class="align-middle">10/5</td>
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
  <!-- 공지사항 수정-->
  <div id="notice_list" class="container px-xl-0 pt-40 d-none">
    <h2 class="pb-40">공지사항 목록</h2>
    <table class="table table-bordered text-justify text-center">
      <tr class="bg-gray">
        <th class="w-100">번호</th>
        <th class="">제목</th>
        <th class="w-100">작성자</th>
        <th class="w-100">작성일</th>
      </tr>
      <tr class="text-center">
        <td class="align-middle">1</td>
        <td class="align-middle"><a href="">제목 1</a></td>
        <td class="align-middle">관리자</td>
        <td class="align-middle">10/5</td>
      </tr>

      <tr class="text-center">
        <td class="align-middle">1</td>
        <td class="align-middle"><a href="">제목 1</a></td>
        <td class="align-middle">관리자</td>
        <td class="align-middle">10/5</td>
      </tr>
      <tr class="text-center">
        <td class="align-middle">1</td>
        <td class="align-middle"><a href="">제목 1</a></td>
        <td class="align-middle">관리자</td>
        <td class="align-middle">10/5</td>
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
  <!-- 문의사항 수정-->
  <div id="qna_list" class="container px-xl-0 pt-40 d-none">
    <h2 class="pb-40">QnA</h2>

    <table class="table table-bordered text-justify text-center">
      <tr class="bg-gray">
        <th class="w-100">번호</th>
        <th class="">제목</th>
        <th class="w-100">작성자</th>
        <th class="w-100">작성일</th>
      </tr>
      <tr class="text-center">
        <td class="align-middle">1</td>
        <td class="align-middle"><a href="">제목 1</a></td>
        <td class="align-middle">관리자</td>
        <td class="align-middle">10/5</td>
      </tr>

      <tr class="text-center">
        <td class="align-middle">1</td>
        <td class="align-middle"><a href="">제목 1</a></td>
        <td class="align-middle">관리자</td>
        <td class="align-middle">10/5</td>
      </tr>
      <tr class="text-center">
        <td class="align-middle">1</td>
        <td class="align-middle"><a href="">제목 1</a></td>
        <td class="align-middle">관리자</td>
        <td class="align-middle">10/5</td>
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
  <!-- Modal -->
  <div
    class="modal fade"
    id="reviewModal"
    tabindex="-1"
    aria-labelledby="reviewModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
        <form action="" method="POST">
          <div class="modal-header">
            <h5 class="modal-title" id="reviewModalLabel">리뷰 쓰기</h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <span class="store_name_order"></span><br />
            <textarea class="bg-gray" cols="100" rows="20"></textarea>
            <hr />
            <div class="input-group mb-3">
              <div class="custom-file">
                <input
                  type="file"
                  class="custom-file-input"
                  id="reviewImage1"
                />
                <label class="custom-file-label" for="reviewImage1"
                  >Choose file</label
                >
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-outline-danger text-dark border btn-sm"
              data-dismiss="modal"
            >
              닫기
            </button>
            <button
              type="button"
              class="btn btn-outline-danger bg-dark border btn-sm"
            >
              리뷰 작성
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <%@ include file="footer.jsp" %>
</section>
