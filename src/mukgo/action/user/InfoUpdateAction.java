package mukgo.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.IMypageService;
import mukgo.service.user.MypageServiceImpl;
import mukgo.vo.MemberVO;
import mukgo.web.IAction;

public class InfoUpdateAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("upId");
		String mail = request.getParameter("upEmail");
		String name = request.getParameter("upName");
		String tel = request.getParameter("upTel");
		
		MemberVO vo = new MemberVO();
		vo.setMem_email(mail);
		vo.setMem_name(name);
		vo.setMem_id(id);
		vo.setMem_tel(tel);
		IMypageService service = MypageServiceImpl.getConnection();
		service.userMypageUpdate(vo);
		
		return "/page/userMypage.do";
	}

}
