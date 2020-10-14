package mukgo.user.store.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mukgo.user.store.service.IStoreService;
import mukgo.user.store.service.StoreServiceImpl;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class StoreAllAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		IStoreService service = StoreServiceImpl.getConnection();
		List<StoreVO> storeList = service.allStore();
		Gson gson = new Gson();
		String jsonList = gson.toJson(storeList); 
		request.setAttribute("storeList", jsonList);
		return "/user/storeAll.jsp";
	}

}
