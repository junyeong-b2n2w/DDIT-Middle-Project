<%@page import="mukgo.vo.StoreVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
<% 
	List<StoreVO> storeList = (List<StoreVO>)request.getAttribute("storeList");
	List<String> starList = (List<String>)request.getAttribute("starList"); 
	List<String> imgList = (List<String>)request.getAttribute("imgList");

	for(int i=0; i<storeList.size(); i++){
		if(i > 0) out.print(",");
		String star = starList.get(i);
		if(star == null) star = "0.0";
%>
	{
		"star" : "<%=star%>",
		"img" : "<%=imgList.get(i)%>",
		"sto_num" : "<%=storeList.get(i).getSto_num()%>",
		"sto_mem_num" : "<%=storeList.get(i).getSto_mem_num()%>",
		"sto_delete_gb" : "<%=storeList.get(i).getSto_delete_gb()%>",
		"sto_name" : "<%=storeList.get(i).getSto_name()%>",
		"sto_tel" : "<%=storeList.get(i).getSto_tel()%>",
		"sto_pos_x" : "<%=storeList.get(i).getSto_pos_x()%>",
		"sto_pos_y" : "<%=storeList.get(i).getSto_pos_y()%>",
		"sto_brand" : "<%=storeList.get(i).getSto_brand()%>",
		"sto_dt_gb" : "<%=storeList.get(i).getSto_dt_gb()%>",
		"sto_delivery_gb" : "<%=storeList.get(i).getSto_delivery_gb()%>",
		"sto_access_gb" : "<%=storeList.get(i).getSto_access_gb()%>",
		"sto_opentoclose" : "<%=storeList.get(i).getSto_opentoclose()%>"
	}
<%
	}
%>
]