
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%
   String path = "D:/A_TeachingMaterial/4.MiddleProject/workspace/NullJAVA/WebContent/asset/img";
		int size = 1024*1024*20;
		System.out.println(path + "테테테테스스");
		String content = "";
		String fileName1 = "";
		String fileName2 = "";
		String orgfileName1 = "";
		String orgfileName2 = "";
		 System.out.println("request getContentType : " + request.getContentType());
		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			content = multi.getParameter("content");
			
			fileName1 = multi.getFilesystemName("file1");
			orgfileName1 = multi.getOriginalFileName("file1");			
			
			
			fileName2 = multi.getFilesystemName("file2");
			orgfileName2 = multi.getOriginalFileName("file2");			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
%>
<html>
<body>
	<form action="../test.jsp" method="post">
		<input type="text" name="cont" value="<%=content%>"> 
		<input type="text" name="fileName1" value="<%=fileName1%>"> 
		<input type="hidden" name="fileName2" value="<%=fileName2%>"> 
		<input type="hidden" name="orgfileName1" value="<%=orgfileName1%>">
		<input type="hidden" name="orgfileName2" value="<%=orgfileName2%>">
		<input type="submit" value="업로드 확인">
	</form>
</body>
</html>