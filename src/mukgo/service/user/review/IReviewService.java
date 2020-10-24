package mukgo.service.user.review;

import java.util.List;
import java.util.Map;

import mukgo.vo.ReviewImageVO;
import mukgo.vo.ReviewListVO;
import mukgo.vo.ReviewVO;

public interface IReviewService {
	
	// 전체 리스트
	public List<ReviewVO> selectAll();
	
	// 페이지별 리스트
	public List<ReviewVO> selectByPage(Map<String, Integer> map);
	 
	// 전체 리뷰개수
	public int reviewCount();
	
	// 리뷰쓰기 
	public int insertReview(ReviewVO vo);
	
	// 리뷰수정
	public int updateReview(ReviewVO vo);
	
	// 별점부여
	public int starRating(int rev_star);
	
	// 삭제 구분
	public int deleteReview(int rev_delete_gb);
	
	
	public int insertNewReview(ReviewVO vo);
	
	public int insertReviewImage(ReviewImageVO vo);
	
	public List<ReviewVO> reviewprint(int sto_num);
	
	public List<ReviewListVO> storeReview(int sto_num);

}
