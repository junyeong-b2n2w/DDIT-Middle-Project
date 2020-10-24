package mukgo.action.user.post;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.post.IPostService;
import mukgo.service.user.post.IPostServiceImpl;
import mukgo.vo.PostVO;
import mukgo.web.IAction;

public class PostListAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		// 페이지별 게시물 조회
				// 1. 클라이언트 요청시 전송되는 데이터 받기
				int page = Integer.parseInt(request.getParameter("page"));
				// int page = 1;
		
				// 2. service 객체 얻어오기
				IPostService service = IPostServiceImpl.getService();
				
				// 3. service 메서드 호출
				int totalcount = service.postCount();
				// 한 페이지당 출력할 글 갯수
				int perlist = 5;
				int perpage = 2;
				int totalpage = (int)Math.ceil((double)totalcount / perlist);
				
				int startpage = ((page - 1) / perpage * perpage) + 1;
				int endpage = startpage + perpage - 1;
				
				if(endpage > totalpage) endpage = totalpage;
				
				
				int start = (page - 1) * perlist + 1;
				int end = start + perlist -1;
				if(end > totalcount) end  = totalcount;
				
				//각 페이지에 출력될 시작번호와 끝번호
				Map<String, Integer>  map = new HashMap<String,Integer>();
				map.put("start", start);
				map.put("end", end);
				
				// 페이지에 출력될 글 가져오기
				List<PostVO> list = service.selectByPage(map);
				
				// 결과값을 request scope에 저장
				request.setAttribute("listpage", list);
				request.setAttribute("totalpage", totalpage);
				request.setAttribute("startpage", startpage);
				request.setAttribute("endpage", endpage);
				
				
		
		return "/post/postList.jsp";
	}

}
