<%@page import="mukgo.vo.PostVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<PostVO> list = (List<PostVO>)request.getAttribute("listpage");
	int total = (Integer)request.getAttribute("totalpage");
	int sp = (Integer)request.getAttribute("startpage");
	int ep = (Integer)request.getAttribute("endpage");
%>
	{
		"totalp" : "<%=total %>",
		"startp" : "<%=sp %>",
		"endp" : "<%=ep %>",
		"datas" : [
<%
	for(int i =0; i < list.size(); i++){
		PostVO vo = list.get(i);
		if(i>0) out.print(",");
		
		%>
		{
			"postnum" : "<%=vo.getPost_num() %>",
			"parentpostnum" : "<%=vo.getPost_parentpost_num() %>",
			"postdeletegb" : "<%=vo.getPost_delete_gb() %>",
			"postname" : "<%=vo.getPost_name() %>",
			"postnum" : "<%=vo.getPost_num() %>",
			"memnum" : "<%=vo.getPost_mem_num() %>",
			"postwriter" : "<%=vo.getPost_writer() %>",
			"postdate" : "<%=vo.getPost_writer() %>",
			"postcontent" : "<%=vo.getPost_content().replaceAll("\r", "").replaceAll("\n", "<br>") %>"
		}
		<%
	}
%>
	]
}