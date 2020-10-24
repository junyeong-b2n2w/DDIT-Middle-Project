<%@page import="java.util.List"%>
<%@page import="mukgo.vo.MenuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MenuVO> list = (List<MenuVO>)request.getAttribute("menulist");
%>
[
	<%for(int i = 0 ; i< list.size(); i++){ 
		MenuVO vo = list.get(i);
		if(i > 0 ) out.print(",");
		%>	
		{
			"menu_num" :"<%=vo.getMenu_num() %>",
			"menu_category" :"<%=vo.getMenu_category() %>",
			"menu_name" : "<%=vo.getMenu_name() %>",
			"menu_price" : "<%=vo.getMenu_price() %>",
			"menu_cal" : "<%=vo.getMenu_cal() %>"
	 	}
	 <%
	} 
 %>
]
