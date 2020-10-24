<%@page import="mukgo.action.user.post.PostListAction"%>
<%@page import="mukgo.vo.PostVO"%>
<%@page import="java.util.List"%>
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
	<script>
		$(function(){
			
			
			
			$(':button').on('click', function(){
				bonum = $(this).val().trim() ? $(this).val().trim() : getNum;
				console.log(getNum);
				$.ajax({
					url : '<%=request.getContextPath() %>/boardPage.do',
					data : {
						'post_bor_num' : bonum
					},
					dataType : 'json',
					success : function(res){
						var str = "";
						str += '<table class="table table-bordered text-justify text-center">';
						str +='<tr class="bg-gray">';
						str +='<th class="w-100">번호</th>';
						str +='<th class="">제목</th>';
						str +='<th class="w-100">작성자</th>';
						str +='<th class="w-100">작성일</th>';
						str +='<th class="w-100">비고</th>';
						str +='</tr>';
						$.each(res, function(i,v){
							str += '<tr class="text-center">';
							str += '<td class="align-middle postnum">' + v.post_num + '</td>';
							str += '<td class="align-middle postname"><a href="#" data-toggle="modal" data-target="#viewBoardModal" class="boardA">' + v.post_name + '</a></td>';
							str += '<td class="align-middle postwriter">' + v.post_writer + '</td>';
							str += '<td class="align-middle postdate">' + v.post_date + '</td>';
							str += '<td class="align-middle">';
							
							
							if(<%=session.getAttribute("mem_gb")%>==3){
							str += '<input type="button" class="update" value="수정" data-toggle="modal" data-target="#updateboardModal">';
							str += '<input type="button" class="delete" value="삭제">';
							}
							// 본문수정을 위한 숨겨진 본문 텍스트값
							str += '<input type="text" class="post_content d-none" value="' + v.post_content + '">';
							// 유저 구분을 위한 숨겨진 회원번호(멤버테이블 PK)
							str += '<input type="text" class="post_mem_num d-none" value="' + v.post_mem_num + '">';
							str += '</td>';
							str += '</tr>';
						});
						str += '</table>';
						if(<%=session.getAttribute("mem_gb")%>==3){
						str += '<button type="button" id="writeBoard" class="btn btn-danger border text-dark mb-10" data-toggle="modal" data-target="#insertboardModal">글작성하기</button>'
						}
						$('#board').html(str);
						
					},
					error : function(req){
						alert('상태 : ' + req.status);
					}
				});
				
			});
		
			function getParameterByName(name) {
		        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		                results = regex.exec(location.search);
		        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		    }
			
			getNum = getParameterByName('post_bor_num');
			console.log(getNum);
			if(getNum==1) {$('#event_button').trigger('click');}
			if(getNum==2) {$('#notice_button').trigger('click');}
			if(getNum==3) {$('#qna_button').trigger('click');}
			
			// 게시글 삭제 상태전환 쿼리문 - 완료
			$(document).on('click', '.delete', function(){
				postnum = $(this).parents('tr').find('.postnum').text();
				//1. ajax 를 써야하고, url 너가 이동하기 위한 페이지인데. 액션에 이동............ dataType : json
				$.ajax({
					url : '<%=request.getContextPath()%>/post/postDelete.do',
					data : {
					'post_num' : postnum
					},
					dataType : 'json',
					success : function(res){
						alert('게시글이 삭제되었습니다.');
						location.href="<%=request.getContextPath()%>/board.do?post_bor_num=1";
						
					},
					error : function(req){
						alert('상태 : ' + req.status);
					}
				});	
			});	
			
			// 업데이트 쿼리문 - 90% 완료 : 출력단계 디버깅 필요
			$(document).on('click', '.update', function(){
				postnum = $(this).parents('tr').find('.postnum').text();
				postname = $(this).parents('tr').find('.postname').text();
				postwriter = $(this).parents('tr').find('.postwriter').text();
				postcontent = $(this).parents('tr').find('.post_content').val();
				postmemnum= $(this).parents('tr').find('.post_mem_num').val();
				resultC = postcontent.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');

				console.log(postnum);
				console.log(postname);
				console.log(postwriter);
				console.log(postcontent);
				console.log(postmemnum);
				$(".modal-body #numUpdate").val( postnum );			// textarea는 동적으로 값을 입력받기 때문에 val로 보내주어야 한다.
				$(".modal-body #nameUpdate").val( postname );		
				$(".modal-body #contentUpdate").val( resultC );
				$(".modal-body #writerUpdate").val( postwriter );
				$(".modal-body #updateMemNum").val( postmemnum );
				
			});
			// 본문조회 쿼리 : 90% 완료 : 출력단계 디버깅 필요
			$(document).on('click', '.boardA', function(){
				postnum = $(this).parents('tr').find('.postnum').text();
				postname = $(this).parents('tr').find('.postname').text();
				postwriter = $(this).parents('tr').find('.postwriter').text();
				postcontent = $(this).parents('tr').find('.post_content').val();
				postmemnum= $(this).parents('tr').find('.post_mem_num').val();
				resultContent = postcontent.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
				$(".modal-body #numBoard").text( postnum );		// div, span은 정해진 값을 출력하기 때문에 text로 보내주어야 한다.
				$(".modal-header #nameBoard").text( postname );		
				$(".modal-body #contentBoard").val( resultContent );	
				$(".modal-body #writerBoard").text( postwriter );	
			});
			
			// 일단 모달창 닫으면 1번게시판(이벤트) 띄우도록 설정
			$('.modal').on('hidden.bs.modal', function(){
				location.href="<%=request.getContextPath()%>/board.do?post_bor_num=1";
			});
								
		});
	</script>
	

</header>

<section class="pt-105 pb-90 bg-light text-center showcase_2">
  <!--정보 출력 버튼-->

  <button
    id="event_button"
    type="button" value="1"
    class="btn btn-outline-danger text-white active border btn-lg"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;이벤트&nbsp;&nbsp;&nbsp;&nbsp;
  </button>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <button
    id="notice_button"
    type="button" value="2"
    class="btn btn-danger text-white border btn-lg text-dark"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;공지사항&nbsp;&nbsp;&nbsp;&nbsp;</button
  >&nbsp;&nbsp;&nbsp;&nbsp;
  <button
    id="qna_button"
    type="button" value="3"
    class="btn btn-danger text-white border btn-lg text-dark"
  >
    &nbsp;&nbsp;&nbsp;&nbsp;문의사항&nbsp;&nbsp;&nbsp;&nbsp;
  </button>

  <!--이벤트목록 보기-->
  <div id="event_list" class="container px-xl-0 pt-40">
    <h2 class="pb-40">이벤트 목록</h2>
    
  </div>
  <!-- 공지사항 수정-->
  <div id="notice_list" class="container px-xl-0 pt-40 d-none">
    <h2 class="pb-40">공지사항 목록</h2>
   
  </div>
  <!-- 문의사항 수정-->
  <div id="qna_list" class="container px-xl-0 pt-40 d-none">
    <h2 class="pb-40">QnA</h2>

   
  </div>
  
  <div id ="board" class="container">
  </div>
  
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
  <!-- Modal -->
  <!-- 수정 모달 -->
  <div
    class="modal fade"
    id="updateboardModal"
    tabindex="-1"
    aria-labelledby="updateModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
        <form action="<%=request.getContextPath()%>/post/postUpdate.do" method="POST">
          <div class="modal-header">
            <h5 class="modal-title" id="updateModalLabel">게시물 수정</h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body text-justify mx-30" >
          
           <div class="input-group border mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">제목</span>
		    </div>
		   <input type="text" id="nameUpdate" class="form-control-plaintext ml-20" name="post_name">
		  </div>
          
          <div class="input-group border mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">작성자</span>
		    </div>
		   <input type="text" id="writerUpdate" class="form-control-plaintext ml-20 " readonly name="post_writer">
		  </div>
            
      		<input type="text" name="post_num" id="numUpdate" readonly class="d-none">
      		
      		
      		<!-- 작성자 구분을 위해 보이지 않는 유저번호, 게시판 번호를 넣어두었습니다. -->
      		<input type="text" id="updateMemNum" name="post_mem_num" class="d-none">
      		
            <textarea id="contentUpdate" name="post_content" class="bg-gray" cols="100" rows="15"></textarea>
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
              type="submit"
              class="btn btn-outline-danger bg-dark border btn-sm"
              id="updateBoard1"
            >
            수정하기
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- 조회 모달 -->
  <div
    class="modal fade"
    id="viewBoardModal"
    tabindex="-1"
    aria-labelledby="boardModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
        <form action="" method="POST">
          <div class="modal-header">
            <h4 class="modal-title" id="boardModalLabel"><span id="nameBoard"></span></h4>
           
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body text-justify mx-30">
            <span class="store_name_order"></span><br />
      		
      		작성자 : <span id="writerBoard"></span>&nbsp;&nbsp;&nbsp;&nbsp;글번호 : <span id="numBoard"></span> 
      		<br><br>
      		<textarea id="contentBoard" readonly class="bg-gray" cols="100" rows="15"></textarea>
      		
                           
           
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-outline-danger text-dark border btn-sm"
              data-dismiss="modal"
            >
              닫기
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- 새 글 입력 모달 -->
  <div
    class="modal fade"
    id="insertboardModal"
    tabindex="-1"
    aria-labelledby="insertModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
        <form action="<%=request.getContextPath()%>/post/postInsert.do" method="POST">
          <div class="modal-header">
            <h5 class="modal-title" id="insertModalLabel">게시물 입력</h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body text-justify mx-30" >
          
          <div class="input-group border mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">제목</span>
		    </div>
		   <input type="text" class="form-control-plaintext ml-20" name="post_name">
		  </div>
		  <div class="input-group border mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">게시판</span>
		    </div>
		   
	 <div class="form-group">
   
    <select name="post_bor_num" class="form-control ml-20 border-0 w-200 " >
      <option value="">게시판 선택</option>
					    <option value="1">이벤트</option>
					    <option value="2">공지사항</option>
					    <option value="3">QnA</option>
    </select>
  </div>


		  </div>
          
        
      		<br>
      		<!-- 작성자 구분을 위해 보이지 않는 유저번호, 게시판 번호를 넣어두었습니다. -->
      		<input type="text"  name="post_mem_num" class="d-none" value="<%=((MemberVO)session.getAttribute("memvo")).getMem_num()%>">
      		<input type="text"  name="post_writer" class="d-none" value="<%=((MemberVO)session.getAttribute("memvo")).getMem_id()%>">
      		
            <textarea name="post_content" class="bg-gray" cols="100" rows="15"></textarea>
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
              type="submit"
              class="btn btn-outline-danger bg-dark border btn-sm"
              id="inputBoard"
            >
            입력하기
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <%@ include file="footer.jsp" %>
</section>
