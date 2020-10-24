package mukgo.action.page;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.web.IAction;

public class MapSearchAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int brand = 0;
		try {
			brand = Integer.parseInt(request.getParameter("brand"));
		} catch (Exception e) {
		}
		request.setAttribute("brand", brand);
		return "/page/map_search.jsp";
	}

}
