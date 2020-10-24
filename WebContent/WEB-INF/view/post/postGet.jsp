<%@page import="mukgo.vo.PostVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	[
    <%
    	List<PostVO> list = (List<PostVO>)request.getAttribute("listvalue");
		
    	for(int i = 0 ; i < list.size(); i++){
    		if(i > 0 ) out.print(",");
    		PostVO vo = list.get(i);
    	%>	
    		{"post_num": "<%=vo.getPost_num() %>",
    		"post_parentpost_num": "<%=vo.getPost_parentpost_num() %>",
    		"post_delete_gb": "<%=vo.getPost_delete_gb() %>",
    		"post_name": "<%=vo.getPost_name() %>",
    		"post_mem_num": "<%=vo.getPost_mem_num() %>",
    		"post_writer": "<%=vo.getPost_writer() %>",
    		"post_date": "<%=vo.getPost_date() %>",
    		"post_content": "<%=vo.getPost_content().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
    		"post_bor_num": "<%=vo.getPost_bor_num() %>"}
    	<%	
    	}
    %>
    ]
    