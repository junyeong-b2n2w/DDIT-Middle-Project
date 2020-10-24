<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<script type="text/javascript">
			<%
			int count = Integer.parseInt( request.getAttribute("insertResult").toString() );
			
			if(count > 1){
			%>		
				alert("회원가입 성공!");				
			<%
			} else{
			%>		
				alert("회원가입 실패..");				
			<%
			}
			%>		
			
			location.href  = "<%=request.getContextPath()%>/main.do"
		</script>
	</body>
</html>