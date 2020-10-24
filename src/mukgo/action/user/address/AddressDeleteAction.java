package mukgo.action.user.address;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.address.AddressServiceImpl;
import mukgo.service.user.address.IAddressService;
import mukgo.web.IAction;

public class AddressDeleteAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int addNum = Integer.parseInt(request.getParameter("addNum"));
		IAddressService service = AddressServiceImpl.getConnection();
		service.addressDelete(addNum);
		
		return "/page/userMypage.do";
	}

}
