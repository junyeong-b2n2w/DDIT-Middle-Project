package mukgo.action.user.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.MenuVO;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class StoreMenuInsertAction implements IAction{
	private boolean redirect = false;
	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return redirect;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int menu_delete_gb = 0;
		String menu_category = request.getParameter("category");
		String menu_name = request.getParameter("menuname");
		int menu_brand_num = Integer.parseInt(request.getParameter("menu_brand_num"));
		int menu_price = Integer.parseInt(request.getParameter("price"));
		int menu_cal = Integer.parseInt(request.getParameter("cal"));
		
//		int menu_num = 1;
//		int menu_brand_num =2;
//		int menu_delete_gb = 3;
//		String menu_category = "메뉴";
//		String menu_name = "메뉴" ;
//		int menu_price = 5;
//		int menu_cal = 6;
		IStoreService service = StoreServiceImpl.getConnection();
		
		MenuVO muvo = new MenuVO();
		
		muvo.setMenu_delete_gb(menu_delete_gb);
		muvo.setMenu_category(menu_category);
		muvo.setMenu_brand_num(menu_brand_num);
		muvo.setMenu_name(menu_name);
		muvo.setMenu_price(menu_price);
		muvo.setMenu_cal(menu_cal);
		
		int cnt = service.storeInsertMenu(muvo);
		System.out.println("cnt = " + cnt);
		request.setAttribute("result", cnt);
		if(cnt>0) {
			redirect = true;
			return "/user/storemenu.do";
		}
			
		return "/user/storeform.jsp";
	}

}
