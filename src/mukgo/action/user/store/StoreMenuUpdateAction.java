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

public class StoreMenuUpdateAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		int menu_delete_gb = Integer.parseInt(request.getParameter("menu_delete_gb"));
//		String menu_category = request.getParameter("menu_category");
		
		int menu_brand_num = Integer.parseInt(request.getParameter("menu_brand_num"));
		String menu_category = request.getParameter("menu_category");
		String menu_name = request.getParameter("menu_name");
		int menu_price = Integer.parseInt(request.getParameter("menu_price"));
		int menu_cal = Integer.parseInt(request.getParameter("menu_cal"));
		int menu_num = Integer.parseInt(request.getParameter("menu_num"));
		
		
		MenuVO vo = new MenuVO();
		vo.setMenu_brand_num(menu_brand_num);
		vo.setMenu_category(menu_category);
		vo.setMenu_name(menu_name);
		vo.setMenu_price(menu_price);
		vo.setMenu_cal(menu_cal);
		vo.setMenu_num(menu_num);
		
		IStoreService service = StoreServiceImpl.getConnection();
		
		service.storeUpdate(vo);
		
		List<StoreVO> list = (List<StoreVO>)service.storeMenu();
		request.setAttribute("menulist", list);
		return "/user/storemenu.jsp";
	}
	
}
