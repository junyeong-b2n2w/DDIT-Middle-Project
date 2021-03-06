package mukgo.action.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.admin.IManegementService;
import mukgo.service.admin.ManegementServiceImpl;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class AdminStoreSearchAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		IManegementService service = ManegementServiceImpl.getInstance();
		
		List<StoreVO> list = service.getAllStore();
		
		request.setAttribute("storeList",list);
		
		return "/admin/adminSearchStore.jsp";
	}
	
}
