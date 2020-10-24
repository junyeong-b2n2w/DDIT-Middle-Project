package mukgo.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mukgo.dao.user.ILoginDao;
import mukgo.service.user.ILoginService;
import mukgo.service.user.LoginServiceImpl;
import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class LoginMemberAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		String id =request.getParameter("mem_id");
		String pass = request.getParameter("mem_pw");
		
		ILoginService service = LoginServiceImpl.getInstance();
		
		MemberVO vo = new MemberVO();
		
		vo.setMem_id(id);
		vo.setMem_pw(pass);
		
	
		MemberVO resultVO = service.loginMember(vo);
		
		int result = 0;
		
		
		
		if(resultVO != null){
			result =1;
			session.setAttribute("mem_id", resultVO.getMem_id());
			session.setAttribute("memvo", resultVO);
		}
		
		if(resultVO != null && resultVO.getMem_type_gb() == 2) {
			IStoreService storeService = StoreServiceImpl.getConnection();
			
			String storeName = storeService.storeName(resultVO.getMem_num());
			
			StoreVO svo = storeService.oneStore(resultVO.getMem_sto_num());
			
			session.setAttribute("store_name", storeName);
			session.setAttribute("store_num", svo.getSto_num());
		}
		
		request.setAttribute("result", result);
		
		
		
		
		request.setAttribute("resultVO", resultVO);
		
		
		return "/user/loginSession.jsp";
	}

}
