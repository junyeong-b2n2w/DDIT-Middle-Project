<%@page import="mukgo.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberVO> list = (List<MemberVO>) request.getAttribute("memList");
%>
[
<%
	
	for(int cnt=0; cnt < list.size() ; cnt++){
		MemberVO vo = list.get(cnt);
		if(cnt > 0) out.print(",");
%>
		{
			"mem_id" : "<%=vo.getMem_id() %>",
			"mem_num" : "<%=vo.getMem_num() %>",
			"mem_pw" : "<%=vo.getMem_pw() %>",
			"mem_type_gb" : "<%=vo.getMem_type_gb() %>",
			"mem_quit_gb" : "<%=vo.getMem_quit_gb() %>",
			"mem_tel" : "<%=vo.getMem_tel() %>",
			"mem_reg_num" : "<%=vo.getMem_reg_num() %>",
			"mem_email" : "<%=vo.getMem_email() %>",
			"mem_name" : "<%=vo.getMem_name()%>"
		}		
<%
	}
%>
]