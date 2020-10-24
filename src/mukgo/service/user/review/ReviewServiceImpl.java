package mukgo.service.user.review;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import mukgo.dao.user.review.IReviewDao;
import mukgo.dao.user.review.IReviewDaoImpl;
import mukgo.vo.ReviewImageVO;
import mukgo.vo.ReviewListVO;
import mukgo.vo.ReviewVO;

public class ReviewServiceImpl implements IReviewService{
	
	private IReviewDao dao;
	private static IReviewService service;
	
	private ReviewServiceImpl(){
		dao = IReviewDaoImpl.getConnection();
	}
	
	public static IReviewService getConnection() {
		if(service == null) service = new ReviewServiceImpl();
		
		return service;
	}
	@Override
	public List<ReviewVO> selectAll() {
		List<ReviewVO> list = null;
		try {
			list = dao.selectAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ReviewVO> selectByPage(Map<String, Integer> map) {
		List<ReviewVO> list = null;
		
		try {
			list = dao.selectByPage(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int reviewCount() {
		int cnt = 0;
		 
		try {
			cnt = dao.reviewCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int insertReview(ReviewVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.insertReview(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateReview(ReviewVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.insertReview(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int starRating(int rev_star) {
		int cnt = 0;
		
		try {
			cnt = dao.starRating(rev_star);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteReview(int rev_delete_gb) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteReview(rev_delete_gb);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	//가게리뷰

	@Override
	public int insertReviewImage(ReviewImageVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertReviewImage(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int insertNewReview(ReviewVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertNewReview(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<ReviewVO> reviewprint(int sto_num) {
		List<ReviewVO> list = null;
		
		try {
			list = dao.reviewprint(sto_num);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ReviewListVO> storeReview(int sto_num) {
		List<ReviewListVO> list = null;
		
		try {
			list = dao.storeReview(sto_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//리뷰번호
	
	//리뷰내용
	
	//리뷰 별점
	
	//리뷰 이미지
	
	//리뷰아이디 
	
	//리뷰시간
}
