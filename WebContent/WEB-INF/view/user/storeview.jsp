<%@page import="mukgo.vo.MenuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%MenuVO vo = (MenuVO)request.getAttribute("vo"); %>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		
		$("#back").on("click",function(){
			location.href = "<%=request.getContextPath()%>/user/storemenu.do";
		});
		$("#udt").on("click",function(){
			location.href = 
				"<%=request.getContextPath()%>/user/storeUpdateForm.do?mem_num=<%=vo.getMenu_num()%>&menu_brand_num=<%=vo.getMenu_brand_num()%>&category=<%=vo.getMenu_category()%>&name=<%=vo.getMenu_name()%>&price=<%=vo.getMenu_price()%>&cal=<%=vo.getMenu_cal()%>";
		});
		
		$("#del").on("click",function(){
			location.href ="<%=request.getContextPath()%>/user/storeupdateDelete.do?menu_num=<%=vo.getMenu_num()%>";
		})
	});
</script>

</head>
<body>
	<table border="1">
		<tr>
			<th>제품번호</th><th><%=vo.getMenu_num()%></th>

		</tr>
		<tr>
			<th>브랜드번호</th><th><%=vo.getMenu_brand_num()%></th>
		</tr>
		<tr>
			<th>카테고리</th><th><%=vo.getMenu_category()%></th>
		</tr>
		<tr>
			<th>제품명</th><th><%=vo.getMenu_name()%></th>
		</tr>
		<tr>
			<th>가격</th><th><%=vo.getMenu_price()%></th>
		</tr>
		<tr>
			<th>칼로리</th><th><%=vo.getMenu_cal()%></th>
		</tr>
		<tr> 
			
		</tr>
		<tr> 
			<td colspan="3"> 
				<input type = "button" id = "udt" value = "수정">
				<input type = "button" id = "del" value = "삭제">
				<input type = "button" id = "back" value = "회원목록">
			</td>
		</tr>
	</table>

</body>
</html>