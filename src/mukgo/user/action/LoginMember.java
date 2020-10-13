package mukgo.user.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mukgo.user.service.IJoinService;
import mukgo.user.service.JoinServiceImpl;
import mukgo.web.IAction;

public class LoginMember implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		String id =request.getParameter("mem_id");
		String pass = request.getParameter("mem_pw");
		
		IJoinService service = JoinServiceImpl.getInstance();
		
		int cnt = service.searchMember(id);
		
		request.setAttribute("idCount", cnt);
		
		if(cnt > 0){
			session.setAttribute("mem_id", id);
		}
		
		return "/user/loginSession.jsp";
	}

}
