package mukgo.action.user.store;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.MenuVO;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class StoreMenuAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		IStoreService service = StoreServiceImpl.getConnection();
		//int cnt = request.getParameter("");
		
//		List<StoreVO> menuList = service.storeMenu(2);
//		Gson gson = new Gson();
//		String json = gson.toJson(menuList); 
//		request.setAttribute("menuList", json);
		List<StoreVO> menuList = service.storeMenu();
		request.setAttribute("menulist", menuList);
		return "/user/storemenu.jsp";
	}

}
