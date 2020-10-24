package mukgo.action.user.store;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.google.gson.Gson;

import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class StoreInformationAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		int sto_num = Integer.parseInt(request.getParameter("mem_sto_num"));		
		
		IStoreService service = StoreServiceImpl.getConnection();
		
		StoreVO vo = service.storeInformation(sto_num);
		
		
		Gson gson = new Gson();
		
		String jsonVO = gson.toJson(vo);
		
		System.out.println(jsonVO);
		
		request.setAttribute("storeInformation",jsonVO);
		
		return "/user/storeInformation.jsp";
	}

}
