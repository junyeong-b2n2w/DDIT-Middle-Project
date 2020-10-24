<%@page import="mukgo.vo.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<StoreVO> list = (List<StoreVO>) request.getAttribute("storeList");
%>
[
<%
	for(int i = 0 ; i < list.size() ; i++){
		StoreVO vo = list.get(i);
		if(i > 0) out.print(", ");
%>
		{
			"sto_num" : "<%=vo.getSto_num()%>",
			"sto_mem_num" : "<%=vo.getSto_mem_num()%>",
			"sto_delete_gb" : "<%=vo.getSto_delete_gb()%>",
			"sto_name" : "<%=vo.getSto_name()%>",
			"sto_tel" : "<%=vo.getSto_tel()%>",
			"sto_pos_x" : "<%=vo.getSto_pos_x()%>",
			"sto_pos_y" : "<%=vo.getSto_pos_y()%>",
			"sto_brand" : "<%=vo.getSto_brand()%>",
			"sto_dt_gb" : "<%=vo.getSto_dt_gb()%>",
			"sto_delivery_gb" : "<%=vo.getSto_delivery_gb()%>",
			"sto_access_gb" : "<%=vo.getSto_access_gb()%>",
			"sto_opentoclose" : "<%=vo.getSto_opentoclose()%>"
		}
<%
	}
	
%>
]
