package mukgo.action.user.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.order.IOrderService;
import mukgo.service.user.order.OrderServiceImpl;
import mukgo.web.IAction;

public class DeliStatusUserAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int ordNum = Integer.parseInt(request.getParameter("ordNum"));
		IOrderService service = OrderServiceImpl.getConnection();
		service.deliStatusUser(ordNum);
		return "/page/userMypage.do";
	}

}
