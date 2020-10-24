package mukgo.action.page;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.post.IPostService;
import mukgo.service.user.post.IPostServiceImpl;
import mukgo.vo.PostVO;
import mukgo.web.IAction;

public class BoardPageAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PostVO vo = new PostVO();
		int bonum = 0;
		// 게시판번호 FRONT에서 받아와서 노출되는 게시판 설정
		if(request.getParameter("post_bor_num") == null){
			bonum = 1;
		}else{
			bonum = Integer.parseInt(request.getParameter("post_bor_num"));
		}
		System.out.println(bonum);
		vo.setPost_bor_num(bonum);
		//vo.setPost_bor_num(2);
		System.out.println(request.getParameter("post_bor_num"));
		// service객체 얻기
		IPostService service = IPostServiceImpl.getService();
		
		// service메서드 호출
		List<PostVO> list = service.selectAll(vo);
		
//		Gson gson =  new Gson();
//		String jsonList = gson.toJson(list);
		
		// 결과값 request scope에 저장
		request.setAttribute("listvalue", list);
		
		//중간에 이 List를 JSON 폼으로 바꿔주는 역할이 필요해 - jsp.
		
		return "/post/postGet.jsp";
	}

}
