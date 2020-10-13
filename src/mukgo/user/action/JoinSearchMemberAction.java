package mukgo.user.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.user.service.IJoinService;
import mukgo.user.service.JoinServiceImpl;
import mukgo.vo.MemberVO;
import mukgo.web.IAction;

public class JoinSearchMemberAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("mem_id");
		
		IJoinService service = JoinServiceImpl.getInstance();
		
		int cnt = service.searchMember(id);
		
		request.setAttribute("idCount", cnt);
		
		return "/user/joinSerchMember.jsp";
	}

}
