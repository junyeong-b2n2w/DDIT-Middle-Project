package mukgo.action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mukgo.service.user.IMypageService;
import mukgo.service.user.MypageServiceImpl;
import mukgo.service.user.address.AddressServiceImpl;
import mukgo.service.user.address.IAddressService;
import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.web.IAction;

public class CartOrderAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("memvo");
		
		IAddressService service = AddressServiceImpl.getConnection();
		List<AddressVO> list = service.addressList(vo.getMem_id());
		request.setAttribute("list", list);
		return "/user/cartOrderList.jsp";
	}

}
