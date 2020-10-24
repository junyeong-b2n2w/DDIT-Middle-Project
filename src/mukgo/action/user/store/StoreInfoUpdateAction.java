package mukgo.action.user.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class StoreInfoUpdateAction implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			
		StoreVO vo = new StoreVO();
		
		System.out.println(Integer.parseInt(request.getParameter("sto_brand")));
		System.out.println(request.getParameter("sto_delivery_gb"));
		System.out.println(request.getParameter("sto_dt_gb"));
		
		
		vo.setSto_access_gb(1);
		vo.setSto_brand(Integer.parseInt(request.getParameter("sto_brand")));
		vo.setSto_delete_gb(0);
		vo.setSto_delivery_gb(Integer.parseInt(request.getParameter("sto_delivery_gb")));
		vo.setSto_dt_gb(Integer.parseInt(request.getParameter("sto_dt_gb")));
		vo.setSto_name(request.getParameter("sto_name"));
		vo.setSto_num(Integer.parseInt(request.getParameter("sto_num")));
		vo.setSto_opentoclose(request.getParameter("sto_opentoclose"));
		vo.setSto_pos_x(Double.parseDouble(request.getParameter("sto_pos_x")));
		vo.setSto_pos_y(Double.parseDouble(request.getParameter("sto_pos_y")));
		vo.setSto_tel(request.getParameter("sto_tel"));
		
		IStoreService service = StoreServiceImpl.getConnection();
		
		service.storeInfoUpdate(vo);
		
		
		
		return "/user/storeInfoUpdate.jsp";
	}

	
}
