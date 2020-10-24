<%@page import="mukgo.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<ReviewVO> list = (List<ReviewVO>)request.getAttribute("reviewlist");
%>
[
	<%for(int i = 0; i < list.size(); i++){
		ReviewVO vo = list.get(i);
		if(i > 0) out.print(",");
	%>
		{
			"Rev_num" :"<%=vo.getRev_num()%>",
			"Rev_mem_num" :"<%=vo.getRev_mem_num() %>",
			"Rev_content" :"<%=vo.getRev_content() %>",
			"Rev_star" :"<%=vo.getRev_star() %>",
			"Rev_date" :"<%=vo.getRev_date() %>"
			
			
		}
	
	<%	
	} 
 %>
]