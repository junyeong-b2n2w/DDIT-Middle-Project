package mukgo.user.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mukgo.user.dao.ILoginDao;
import mukgo.user.service.ILoginService;
import mukgo.user.service.LoginServiceImpl;
import mukgo.vo.MemberVO;
import mukgo.web.IAction;

public class LoginMember implements IAction{

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
			
		}
		
		request.setAttribute("result", result);
		
		
		
		
		request.setAttribute("resultVO", resultVO);
		
		
		return "/user/loginSession.jsp";
	}

}
