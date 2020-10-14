package mukgo.user.post.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mukgo.user.post.service.IPostService;
import mukgo.user.post.service.IPostServiceImpl;
import mukgo.vo.PostVO;
import mukgo.web.IAction;

public class PostAllAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		// service객체 얻기
		IPostService service = IPostServiceImpl.getService();
		
		// service메서드 호출
		List<PostVO> list = service.selectAll();
		
		Gson gson =  new Gson();
		String jsonList = gson.toJson(list);
		// 결과값 request scope에 저장
		request.setAttribute("listvalue", jsonList);
		
		return "/post/postAll.jsp";
	}
	
}
