package mukgo.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.admin.IManegementService;
import mukgo.service.admin.ManegementServiceImpl;
import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class StoreChangeAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		IManegementService service = ManegementServiceImpl.getInstance();
		StoreVO vo = new StoreVO();
		int store_num = Integer.parseInt(request.getParameter("store_num"));
		vo.setSto_mem_num(store_num);
		vo.setSto_access_gb(0);
		
		int cnt = service.storeChange(vo);
		System.out.println("cnt : " + cnt);
		
		request.setAttribute("vo", vo);
		return "/admin/StoreChange.jsp";
	}

}
