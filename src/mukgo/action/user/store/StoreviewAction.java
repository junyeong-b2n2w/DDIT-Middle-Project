package mukgo.action.user.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.MenuVO;
import mukgo.web.IAction;

public class StoreviewAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		IStoreService service = StoreServiceImpl.getConnection();
		
		MenuVO vo = service.getMenu(mem_num);
		
		request.setAttribute("vo", vo);
		return "/user/storeview.jsp";
	}

}
