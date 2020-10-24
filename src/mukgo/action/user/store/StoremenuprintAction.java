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

public class StoremenuprintAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int sto_num = Integer.parseInt(request.getParameter("sto_num"));
		
		IStoreService serivce = StoreServiceImpl.getConnection();
		List<MenuVO> menulist = serivce.stroemenuprint(sto_num);
		
		request.setAttribute("menulist", menulist);
		return "/user/storemenuprint.jsp";
		
		
		
	}
	
	

}
