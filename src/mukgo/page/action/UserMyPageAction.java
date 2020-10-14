package mukgo.page.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.user.service.IMypageService;
import mukgo.user.service.MypageServiceImpl;
import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;
import mukgo.web.IAction;

public class UserMyPageAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		IMypageService service = MypageServiceImpl.getConnection();
		List<OrderVO> list = service.userRecentOrder(1234);
		List<String> stoNames = new ArrayList<>();
		List<MenuVO> menuInfos = new ArrayList<>();
		List<Integer> revChk = new ArrayList<>();
		for(OrderVO vo : list){
			stoNames.add(service.getStoreName(vo.getOrd_sto_num()));
			revChk.add(service.reviewCheck(vo));
			menuInfos.add(service.getMenuInfo(vo.getOrd_menu_num()));
		}
		request.setAttribute("orderList", list);
		request.setAttribute("stoNameList", stoNames);
		request.setAttribute("menuList", menuInfos);
		request.setAttribute("revChk", revChk);
		return "/page/userMypage.jsp";
	}

}
