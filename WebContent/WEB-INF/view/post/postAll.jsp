<%@page import="mukgo.vo.PostVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
  <script src="../js/memberreg.js"></script>
		<script type="text/javascript">
			$(function(){
				
				// 게시글 삭제 상태전환 쿼리문
				$('.delete').on('click', function(){
					postnum = $(this).parents('tr').find('.postnum').text();
					//1. ajax 를 써야하고, url 너가 이동하기 위한 페이지인데. 액션에 이동............ dataType : json
					$.ajax({
						url : '/NullJAVA/post/postDelete.do',
						data : {
						'post_num' : postnum
						},
						dataType : 'json',
						success : function(res){
							alert('게시글이 삭제되었습니다.');
							location.href="<%=request.getContextPath()%>/post/postAll.do";
						},
						error : function(req){
							alert('상태 : ' + req.status);
						}
					})	
				})	
			})			
			
			
			
		</script>
	</head>
<body>
<h2>회원 목록 보기</h2>
<table border="1">
	<thead>
		<tr>
			<th>게시글 번호</th><th>부모게시글 번호</th><th>삭제구분</th><th>게시글 이름</th><th>작성자 회원번호</th>
			<th>작성자</th><th>작성일자</th><th>본문</th><th>게시판번호</th><th>수정</th><th>삭제</th><th>답글</th>
		</tr>
	</thead>
	<tbody>
	<%
		List<PostVO> postList = (List<PostVO>)request.getAttribute("listvalue");
		for(PostVO vo : postList){
	%>
		<tr>
			<td class="postnum"><%=vo.getPost_num() %></td>
			<td class="parentpo"><%=vo.getPost_parentpost_num() %></td>
			<td><%=vo.getPost_delete_gb() %></td>
			<td><%=vo.getPost_name() %></td>
			<td><%=vo.getPost_mem_num() %></td>
			<td><%=vo.getPost_writer() %></td>
			<td><%=vo.getPost_date() %></td>
			<td><%=vo.getPost_content() %></td>
			<td><%=vo.getPost_bor_num() %></td>
			<td>
<%-- 		<a href="<%= request.getContextPath()%>/post/postUpdate.do?post_num=<%=vo.getPost_num() %>">수정</a> --%>
			<button type="button" class="btn btn-info btn-lg" id="myBtn">수정</button>
			</td>
			<td>
			<input type="button" class="delete" value="삭제">
			</td>
			<td>
			<a href="<%= request.getContextPath()%>/post/postReply.do?post_parentpost_num=<%=vo.getPost_parentpost_num() %>">답글</a>
			</td>
		</tr>
	<%
		}	
	%>
</tbody>
</table>

		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog modal-lg">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">게시물 수정</h4>
		      </div>
		      <div class="modal-body">
		        <h3>수정내용 입력</h3>
					<br>
					<input type="text" id="post_name">
					<input type="textarea" id="post_content">
					<input id="confirm" type="button" value="입력">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		
		  </div>
		</div>

</body>
</html>