package mukgo.action.user.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mukgo.service.user.review.IReviewService;
import mukgo.service.user.review.ReviewServiceImpl;
import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.ReviewVO;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class ReviewListAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		IReviewService service = ReviewServiceImpl.getConnection();
		List<ReviewVO> reviewList = service.selectAll();
		Gson gson = new Gson();
		String jsonList = gson.toJson(reviewList); 
		request.setAttribute("result", jsonList);
		return "/review/reviewList.jsp";
	}

}
