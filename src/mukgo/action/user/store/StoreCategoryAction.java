package mukgo.action.user.store;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class StoreCategoryAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		  IStoreService service = StoreServiceImpl.getConnection();
		 
		  List<StoreVO> list = service.storeBrandNum();
		  
		  
		  request.setAttribute("list", list);
		  
		  return "/user/storeCategory.jsp";
	}

}
