package mukgo.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.admin.IManegementService;
import mukgo.service.admin.ManegementServiceImpl;
import mukgo.vo.MemberVO;
import mukgo.web.IAction;

public class ChangeGbAction2 implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		IManegementService service = ManegementServiceImpl.getInstance();
		MemberVO vo = new MemberVO();
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		vo.setMem_num(mem_num);
		vo.setMem_quit_gb(0);
		System.out.println("num : " + vo.getMem_num() );
		System.out.println("gb : " + vo.getMem_quit_gb());
		int cnt = service.changeGB2(vo);
		System.out.println("cnt : " + cnt);
		
		request.setAttribute("vo", vo);
		return "/admin/ChangeGb2.jsp";
	}

}
