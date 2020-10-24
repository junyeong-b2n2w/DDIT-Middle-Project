package mukgo.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.IJoinService;
import mukgo.service.user.JoinServiceImpl;
import mukgo.web.IAction;

public class JoinSearchMemberAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String mem_id = request.getParameter("mem_id");
		
		IJoinService service = JoinServiceImpl.getInstance();
		
		String id = service.searchMember(mem_id);
		
		request.setAttribute("chkId", id);
		
		return "/user/joinSerchMember.jsp";
	}

}
