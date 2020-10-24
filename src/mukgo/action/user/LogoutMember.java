package mukgo.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mukgo.dao.user.ILoginDao;
import mukgo.service.user.ILoginService;
import mukgo.service.user.LoginServiceImpl;
import mukgo.vo.MemberVO;
import mukgo.web.IAction;

public class LogoutMember implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		
		return "/page/index.jsp";
	}

}
