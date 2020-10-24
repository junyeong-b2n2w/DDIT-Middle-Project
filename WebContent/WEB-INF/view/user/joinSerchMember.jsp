<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

			<%
			String chkId = (String)request.getAttribute("chkId");
			
			if(chkId == null){
			%>		
				{"chkId" : "사용 가능한 ID입니다." ,
				"success" : "1"}		
			<%
			} else{
			%>		
				{"chkId" : "사용 불가능한 ID입니다."}	
			<%
			}
			%>		
