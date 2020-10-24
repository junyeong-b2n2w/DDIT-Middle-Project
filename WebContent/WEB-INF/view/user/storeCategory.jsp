<%@page import="mukgo.vo.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	List<StoreVO> list = (List<StoreVO>)request.getAttribute("list");
    
    	for(int i = 0 ; i< list.size(); i++){
    		StoreVO vo = list.get(i);
    		%>
    		<option class = "brand_list" value = "<%= vo.getSto_brand() %>"><%= vo.getSto_brand() %></option>
    		
    		<%
    	}
    %>