package mukgo.action.user.address;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mukgo.service.user.address.AddressServiceImpl;
import mukgo.service.user.address.IAddressService;
import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.web.IAction;

public class AddressInsertAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memvo = (MemberVO)session.getAttribute("memvo");
		request.setCharacterEncoding("utf-8");
		String selbox = request.getParameter("selbox");
		if(selbox == null || selbox.equals("direct")){
			selbox = request.getParameter("jikjeop");
		}
		String upyeon = request.getParameter("upyeon");
		String chamgo = request.getParameter("chamgo");
		String[] juso = request.getParameter("juso").split(" ");
		String sido = juso[0];
		String gugun = juso[1];
		String dong = "";
		for(int i=2; i<juso.length; i++){
			dong += juso[i];
		}
		dong += chamgo;
		String sangse = request.getParameter("sangse");
		AddressVO vo = new AddressVO();
		vo.setAdd_detail(sangse);
		vo.setAdd_sido(sido);
		vo.setAdd_gungu(gugun);
		vo.setAdd_dong(dong);
		vo.setAdd_mem_num(memvo.getMem_num());
		vo.setAdd_mem_gb(memvo.getMem_type_gb());
		vo.setAdd_post_num(upyeon);
		vo.setAdd_name(selbox);
		IAddressService service = AddressServiceImpl.getConnection();
		int cnt = service.addressCheck(selbox);
		if(cnt < 1){
			service.addressInsert(vo);
		}else{
			service.addressUpdate(vo);
		}
		return "/page/userMypage.do";
	}
	
}

