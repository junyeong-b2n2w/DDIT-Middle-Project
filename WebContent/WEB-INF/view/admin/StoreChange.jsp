<%@page import="mukgo.vo.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StoreVO vo = (StoreVO)request.getAttribute("vo");
%>


		{
			
			"sto_mem_num" : "<%=vo.getSto_mem_num() %>",
			"sto_access_gb" : "<%=vo.getSto_access_gb() %>"
			
		}		

	