<%@page import="mukgo.vo.AddressVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
<%
	List<AddressVO> list = (List<AddressVO>)request.getAttribute("list");
	for(int i=0; i<list.size(); i++){
		if(i>0)out.print(",");
%>
	{
		"num" : "<%=list.get(i).getAdd_num()%>",
		"detail" : "<%=list.get(i).getAdd_detail()%>",
		"mem_gb" : "<%=list.get(i).getAdd_mem_gb()%>",
		"mem_num" : "<%=list.get(i).getAdd_mem_num()%>",
		"name" : "<%=list.get(i).getAdd_name()%>",
		"post_num" : "<%=list.get(i).getAdd_post_num()%>",
		"sido" : "<%=list.get(i).getAdd_sido()%> <%=list.get(i).getAdd_gungu()%> <%=list.get(i).getAdd_dong()%>"
	}
<%
	}
%>
]