package mukgo.user.post.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.user.post.service.IPostService;
import mukgo.user.post.service.IPostServiceImpl;
import mukgo.vo.PostVO;
import mukgo.web.IAction;

public class PostInsertAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		// 1. 클라이언트 요청데이터
		PostVO vo = new PostVO();
//		vo.setPost_num(Integer.parseInt(request.getParameter("post_num")));
//		vo.setPost_parentpost_num(Integer.parseInt(request.getParameter("post_parentpost_num")));
//		vo.setPost_delete_gb(Integer.parseInt(request.getParameter("post_delete_gb")));
//		vo.setPost_name(request.getParameter("post_name"));
//		vo.setPost_mem_num(Integer.parseInt(request.getParameter("post_mem_num")));
//		vo.setPost_writer(request.getParameter("post_writer"));
//		vo.setPost_date(request.getParameter("post_date"));
//		vo.setPost_content(request.getParameter("post_content"));
//		vo.setPost_bor_num(Integer.parseInt(request.getParameter("post_bor_num")));
		
		vo.setPost_parentpost_num(0);
		vo.setPost_delete_gb(0);
		vo.setPost_name("TESTINSERT2");
		vo.setPost_mem_num(1111);
		vo.setPost_writer("David Kim2");
		vo.setPost_content("This is The Test of INSERT2");
		vo.setPost_bor_num(1);
		
		// 2. service객체 얻기
		IPostService service = IPostServiceImpl.getService();
		
		// 3. service메서드 호출
		int cnt = service.insertPost(vo);
		
		// 4. request에 저장
		request.setAttribute("result", cnt);
		
		return "/post/postUpdate.jsp";
	}

}
