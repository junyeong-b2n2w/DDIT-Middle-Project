package mukgo.action.user.store;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.MenuVO;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;


public class StoreMenuUpdateDeleteAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//int menu_delete_gb = Integer.parseInt(request.getParameter(""));
		//int mneu_num = Integer.parseInt(request.getParameter(""));
		IStoreService service = StoreServiceImpl.getConnection();
		int menu_num = Integer.parseInt(request.getParameter("menu_num"));
		
		int result = service.storeDelete(menu_num);
		
		request.setAttribute("result", result);
		
		List<StoreVO> list = (List<StoreVO>)service.storeMenu();
		request.setAttribute("menulist", list);
		return "/user/storemenu.jsp";
	}
	
}
