package mukgo.action.user.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.review.IReviewService;
import mukgo.service.user.review.ReviewServiceImpl;
import mukgo.vo.ReviewVO;
import mukgo.web.IAction;

public class ReviewprintAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int sto_num = Integer.parseInt(request.getParameter("sto_num"));
		
		
		IReviewService service = ReviewServiceImpl.getConnection();
		
		List<ReviewVO> reviewlist = service.reviewprint(sto_num);
		
		request.setAttribute("reviewlist", reviewlist);
		System.out.println("sto_num : " + sto_num);
		return "/review/reviewprint.jsp";
	}

}
