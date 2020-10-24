<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	<%
	
		int menu_brand_num = Integer.parseInt(request.getParameter("menu_brand_num"));
		String category = request.getParameter("category");
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		int cal = Integer.parseInt(request.getParameter("cal"));
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		
	%>
	
	$("#back").on("click",function(){
		location.href ="<%=request.getContextPath()%>/user/storemenu.do";
	})
</script>
</head>
<body>
	<h2>메뉴수정</h2>
	<form action="<%=request.getContextPath()%>/user/storeUpdate.do" method="get">	
		<table border = "1">
			<tr> 
				<th>브랜드번호</th>
				<th><input type ="text" name ="menu_brand_num" value = "<%=name %>" ></th>
			</tr>
			<tr> 
				<th>카테고리</th>
				<th><input type ="text" name ="menu_category" value = "<%=category %>" ></th>
				<input type ="hidden" name = "menu_num" value="<%=mem_num%>">
			</tr>
			<tr> 
				<th>제품명</th>
				<th><input type ="text" name ="menu_name" value = "<%=name %>" ></th>
			</tr>
			<tr> 
				<th>가격</th>
				<th><input type ="text" name ="menu_price" value = "<%=price %>" ></th>
			</tr>
			<tr> 
				<th>칼로리</th>
				<th><input type ="text" name ="menu_cal" value = "<%=cal %>" ></th>
			</tr>
			<tr>
				<td colspan="3">
					<input type = "submit" value = "저장">
					<input type = "reset" value = "취소">
					<input type = "button" value = "메뉴목록"> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>