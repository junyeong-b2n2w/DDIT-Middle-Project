package mukgo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.web.IAction;
import mukgo.web.URIActionMapper;

// 모든 요청을 받아서 처리하는 Servlet
public class WebController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		uri = uri.substring(request.getContextPath().length());
		String viewPage = "";
		IAction action = null;
		
		action = URIActionMapper.getAction(uri);
		
		if(action == null){
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}else{
			viewPage = action.process(request, response);
			if(viewPage != null){
				if(action.isRedirect()){	// 리다이렉트가 true일 경우
					response.sendRedirect(request.getContextPath() + viewPage);
				}else{	// 포워딩
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/" + viewPage);
					rd.forward(request, response);
				}
			}
		}
	}

}
