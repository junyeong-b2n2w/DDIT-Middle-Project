<%@page import="mukgo.vo.DeliveryVO"%>
<%@page import="mukgo.vo.OrderVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<OrderVO> list = (List<OrderVO>)request.getAttribute("orderList");
	List<Integer> list2 = (List<Integer>) request.getAttribute("priceList");
	List<String> list3 = (List<String>) request.getAttribute("menuList");
	List<DeliveryVO> list4 = (List<DeliveryVO>)request.getAttribute("deliList");
%>
[
<%
	for(int i=0;i<list.size(); i++){
		if(i>0) out.print(",");
%>
	{
		"price" : "<%=list2.get(i)%>",
		"menu" : "<%=list3.get(i)%>",
		"ord_num" : "<%=list.get(i).getOrd_num()%>",
		"ord_sto_num" : "<%=list.get(i).getOrd_sto_num()%>",
		"ord_mem_num" : "<%=list.get(i).getOrd_mem_num()%>",
		"ord_delete_gb" : "<%=list.get(i).getOrd_delete_gb()%>",
		"ord_date" : "<%=list.get(i).getOrd_date()%>",
		"ord_please" : "<%=list.get(i).getOrd_please()%>",
		"ord_count" : "<%=list.get(i).getOrd_count()%>",
		"ord_menu_num" : "<%=list.get(i).getOrd_menu_num()%>",
		"ord_menu_brand_num" : "<%=list.get(i).getOrd_menu_brand_num()%>",
		"deli_num" : "<%=list4.get(i).getDeli_num()%>",
		"deli_ord_num" : "<%=list4.get(i).getDeli_ord_num()%>",
		"deli_status" : "<%=list4.get(i).getDeli_status()%>",
		"deli_ord_addr_num" : "<%=list4.get(i).getDeli_ord_addr_num()%>"
	}
<%
	}
%>
]
