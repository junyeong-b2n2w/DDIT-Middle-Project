


<%@page import="mukgo.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	<%
		MemberVO vo = (MemberVO)request.getAttribute("resultVO");
		int result = (Integer)request.getAttribute("result");	
		System.out.print(result);
		if(result > 0){
			session.setAttribute("mem_gb", vo.getMem_type_gb());%>
			alert("<%=vo.getMem_id()%>님 환영합니다 ");
			<% if(vo.getMem_type_gb()==1){%>
				console.log("//")
				location.href  = "<%=request.getContextPath()%>/main.do"
			<% }else { %>
			console.log("////")
				location.href  = "<%=request.getContextPath()%>/main.do"
			<%}				
			
		}else{%>
		console.log("/////")
			alert("아이디 혹은 비밀번호가 일치하지 않습니다 ");
			history.go(0);
			
		<%}
	%>
</script>
</body>
</html>