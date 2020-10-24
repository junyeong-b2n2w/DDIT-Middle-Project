<%@page import="mukgo.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO vo = (MemberVO)request.getAttribute("vo");
%>


		{
			
			"mem_num" : "<%=vo.getMem_num() %>",
			"mem_quit_gb" : "<%=vo.getMem_quit_gb() %>"
			
		}		

	

