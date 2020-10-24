package mukgo.action.user.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class StoreSelectOne implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int sto_num = Integer.parseInt( request.getParameter("sto_num"));
		
		IStoreService service = StoreServiceImpl.getConnection();
		
		StoreVO vo = service.oneStore(sto_num);
		
		request.setAttribute("storeVO", vo);
		
		return "/user/storeSelectOne.jsp";
	}

}
