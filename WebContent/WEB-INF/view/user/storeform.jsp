<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#back").on("click",function(){
			location.href = "<%=request.getContextPath()%>/user/storemenu.do";
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>메뉴추가</h2>
	<form action="<%=request.getContextPath()%>/user/storeinsertmenu.do" method="get">
		<table border = "1">
			<tr> 
				<th>브랜드번호</th><th><input type = "text" name ="menu_brand_num"></th>
			</tr>
			<tr> 
				<th>카테고리</th><th><input type = "text" name ="category"></th>
			</tr>
			<tr> 
				<th>제품명</th><th><input type = "text" name ="menuname"></th>
			</tr>
			<tr> 
				<th>가격</th><th><input type = "text" name ="price"></th>
			</tr>
			<tr> 
				<th>칼로리</th><th><input type = "text" name ="cal"></th>
			</tr>
			<tr> 
				<td colspan="3"> 
					<input type = "submit" value = "저장">
					<input type = "reset" value = "취소">
					<input type = "button" id = "back" value = "메뉴목록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>