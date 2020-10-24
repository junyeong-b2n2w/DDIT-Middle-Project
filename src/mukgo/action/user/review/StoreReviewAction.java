package mukgo.action.user.review;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mukgo.service.user.review.IReviewService;
import mukgo.service.user.review.ReviewServiceImpl;
import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.ReviewListVO;
import mukgo.web.IAction;

public class StoreReviewAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		int ord_sto_num = Integer.parseInt(request.getParameter("sto_num"));
		
		IReviewService service = ReviewServiceImpl.getConnection();
		
		List<ReviewListVO> list = service.storeReview(ord_sto_num);
		
		
		Gson gson = new Gson();
		
		String jsonList = gson.toJson(list);
		
		System.out.println(jsonList);
		
		request.setAttribute("storeReview",jsonList);
		
		return "/review/storeReview.jsp";
	}

}
