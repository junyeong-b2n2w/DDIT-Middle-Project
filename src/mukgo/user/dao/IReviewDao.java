package mukgo.user.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import mukgo.vo.ReviewVO;

public interface IReviewDao {
	// 전체 리뷰 조회
	public List<ReviewVO> selectAll();
	
	// 페이지별 리뷰 조회
	public List<ReviewVO> selectByPage(Map<String, Integer> map)throws SQLException;
	
	// 전체 리뷰 개수
	public int reviewCount() throws SQLException;
	
	// 리뷰쓰기
	public int insertReview(ReviewVO vo) throws SQLException;
	
	// 리뷰수정
	public int updateReview(ReviewVO vo) throws SQLException;
	
	// 별점 부여
	public int starRating(int rev_star) throws SQLException;
	
	// 삭제 구분
	public int deleteReview(int rev_delete_gb) throws SQLException;
	
	// 부모리뷰번호받기
}
