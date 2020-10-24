<%@page import="mukgo.vo.MenuVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	List<MenuVO> list = (List<MenuVO>)request.getAttribute("menulist");
    int brand_num = 0;
	if(list != null){
		brand_num = list.get(0).getMenu_brand_num();	
	}
	
%>

<select id = "sto_brand" value = "<%= brand_num%>"></select>
<table border = "1">
		<thead> 
			<tr>
				<th colspan="5"><input type = "button" id = "add" value ="메뉴추가" style = "float: right;"></th> 
			</tr>
			<tr> 
				<th>메뉴번호</th><th>카테고리</th><th>제품명</th><th>가격</th><th>칼로리</th>
			</tr>
		</thead>
			<tbody>
				<%
				
					for(MenuVO vo : list){
						%>
						<tr> 
							<!-- 상세조회 및 수정 삭제 -->
							<td><a href = "<%=request.getContextPath()%>/user/storeview.do?mem_num=<%=vo.getMenu_num()%>"><%=vo.getMenu_num()%></a></td>
							<td><%=vo.getMenu_category()%></td>
							<td><%=vo.getMenu_name() %></td>
							<td><%=vo.getMenu_price() %></td>
							<td><%=vo.getMenu_cal()%></td>
						</tr>
						<%
					}
				%>
			</tbody>
	</table>