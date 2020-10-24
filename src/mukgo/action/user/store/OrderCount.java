package mukgo.action.user.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.web.IAction;

public class OrderCount implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int store_num = Integer.parseInt(request.getParameter("sto_num"));
		
		IStoreService service = StoreServiceImpl.getConnection();
		
		int count = service.orderCount(store_num);
		
		request.setAttribute("count", count);
		
		return "/user/orderCount.jsp";
	}

	
}
