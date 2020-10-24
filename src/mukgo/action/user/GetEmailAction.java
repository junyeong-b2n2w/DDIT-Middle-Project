package mukgo.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mukgo.web.IAction;

public class GetEmailAction implements IAction{
	

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String mailinput = request.getParameter("mailinput");
		
		
		HttpSession msession = request.getSession();
		response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=utf-8");
	    PrintWriter out = response.getWriter();
		
		
		String mailnum2 = (String)msession.getAttribute("auth");
		
		
		
		if(mailnum2.equals(mailinput)){
			out.write("인증완료");
			
		}else {
			out.write("인증실패");
		}
		return null;
	}

}
