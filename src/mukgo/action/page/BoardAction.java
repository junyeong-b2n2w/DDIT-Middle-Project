package mukgo.action.page;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.post.IPostService;
import mukgo.service.user.post.IPostServiceImpl;
import mukgo.vo.PostVO;
import mukgo.web.IAction;

public class BoardAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		return "/page/board.jsp";
	}

}
