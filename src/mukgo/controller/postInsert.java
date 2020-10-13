package mukgo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.user.post.service.IPostService;
import mukgo.user.post.service.IPostServiceImpl;
import mukgo.vo.PostVO;

/**
 * Servlet implementation class postInsert
 */
@WebServlet("/postInsert.do")
public class postInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전체 게시물 조회
		// service객체 획득
		IPostService service = IPostServiceImpl.getService();
		// service메서드 호출
		List<PostVO> list = service.selectAll();
		// 결과값을 request scope에 저장
		request.setAttribute("listvalue", list);
		// jsp로
		RequestDispatcher disp = request.getRequestDispatcher("NullJAVA/postAll.jsp");
		disp.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 페이지별 게시물 조회
		// 클라이언트 요청시 전송데이터 받기
	}
	
}
