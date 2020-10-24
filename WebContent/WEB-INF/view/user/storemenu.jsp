<%@page import="mukgo.vo.MenuVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script type="text/javascript">
				$(function() {
					$("#add").on("click",function(){
						location.href = "<%=request.getContextPath()%>/user/storeform.do";
					});
					
					$.ajax({
						
						url : "/NullJAVA/user/storeCategory.do",
						type : "get",
						dataType : "html",
						success : function(res) {
							$("#sto_brand").html(res)
						},
						error : function(req) {
							
						}
					});
						
					$("#sto_brand").on("change" ,function() {
						
						value = $("#sto_brand").val();
						
						$.ajax({
					 		url : "/NullJAVA/user/storeSelect.do",
					 		type : "get",
					 		dataType : "html",
					 		data : {"sto_brand" : value},
					 		success : function(res) {
								$("#menubox").html(res);
							},
							error : function(req) {
								
							}
					 		
					 	});
					});
					
				});
			 
		</script>
</head>
<body>
	
	<div  id = "menubox">
	<select id = "sto_brand"></select>
	<table border = "1">
		<thead> 
			<tr>
				<th colspan="5"><input type = "button" id = "add" value ="메뉴추가" style = "float: right;"></th> 
			</tr>
			<tr> 
				<th>메뉴번호</th><th>카테고리</th><th>제품명</th><th>가격</th><th>칼로리</th>
			</tr>
		</thead>
			<tbody>
				<%
					List<MenuVO> list = (List<MenuVO>)request.getAttribute("menulist");
				
					for(MenuVO vo : list){
						%>
						<tr> 
							<!-- 상세조회 및 수정 삭제 -->
							<td><a href = "<%=request.getContextPath()%>/user/storeview.do?mem_num=<%=vo.getMenu_num()%>"><%=vo.getMenu_num()%></a></td>
							<td><%=vo.getMenu_category()%></td>
							<td><%=vo.getMenu_name() %></td>
							<td><%=vo.getMenu_price() %></td>
							<td><%=vo.getMenu_cal()%></td>
						</tr>
						<%
					}
				%>
			</tbody>
		
		</table>
	</div>
</body>
</html>