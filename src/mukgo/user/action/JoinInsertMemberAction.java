package mukgo.user.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.user.service.IJoinService;
import mukgo.user.service.JoinServiceImpl;
import mukgo.vo.MemberVO;
import mukgo.web.IAction;

public class JoinInsertMemberAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		IJoinService service = JoinServiceImpl.getInstance();
		
		String id = request.getParameter("mem_id");
		int num = Integer.parseInt(request.getParameter("mem_num"));
		String pw = request.getParameter("mem_pw");
		int type = Integer.parseInt(request.getParameter("mem_type_gb"));
		int quit = Integer.parseInt(request.getParameter("mem_quit_gb"));
		String tel = request.getParameter("mem_tel");
		String reg = request.getParameter("mem_reg_num");
		String email = request.getParameter("mem_email");
		
		MemberVO vo = new MemberVO();
		
		vo.setMem_id(id);
		vo.setMem_num(num);
		vo.setMem_pw(pw);
		vo.setMem_type_gb(type);
		vo.setMem_quit_gb(quit);
		vo.setMem_tel(tel);
		vo.setMem_reg_num(reg);
		vo.setMem_email(email);
		
		int cnt = service.insertMember(vo);
		request.setAttribute("insertResult", cnt);
		
		return "user/joinInsertMember.jsp";
	}

}
