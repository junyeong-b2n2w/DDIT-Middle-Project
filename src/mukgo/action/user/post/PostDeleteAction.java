package mukgo.action.user.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.post.IPostService;
import mukgo.service.user.post.IPostServiceImpl;
import mukgo.vo.PostVO;
import mukgo.web.IAction;

public class PostDeleteAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PostVO vo = new PostVO();
		// 삭제 상태로 전환할 게시글 번호 얻어오기, 테스트를 위해 임시 하드코딩
		// vo.setPost_num(1);
		vo.setPost_num(Integer.parseInt(request.getParameter("post_num")));
		
		// 삭제구분 컬럼값을 1로 변환하기
		vo.setPost_delete_gb(1);
		
		// 2. service객체 얻기
		IPostService service = IPostServiceImpl.getService();
		
		// 3. service메서드 호출
		int cnt = service.deletePostGB(vo);
				
		// 4. request에 저장
		request.setAttribute("result", cnt);
		
		// 5. jsp로 전송
		return "/post/postDelete.jsp";
	}

}
