package mukgo.user.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.ReviewVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IReviewDaoImpl implements IReviewDao{
	
	// 객체 선언
	private SqlMapClient client;
	private static IReviewDao dao;
	
	public IReviewDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static IReviewDao getDao(){
		if(dao == null) dao = new IReviewDaoImpl();
		return dao;
	}

	@Override
	public List<ReviewVO> selectAll() {
		List<ReviewVO> list = null;
		try {
			list = client.queryForList("review.selectAll");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ReviewVO> selectByPage(Map<String, Integer> map)
			throws SQLException {
		return client.queryForList("review.selectByPage", map);
	}

	@Override
	public int reviewCount() throws SQLException {
		
		return (Integer) client.queryForObject("review.reviewCount");
	}

	@Override
	public int insertReview(ReviewVO vo) throws SQLException {
		return (Integer)client.insert("review.insertReview", vo);
	}

	@Override
	public int updateReview(ReviewVO vo) throws SQLException {
		return client.update("review.updateReview", vo);
	}

	

	@Override
	public int starRating(int rev_star) throws SQLException {
		return client.update("review.updateStar", rev_star);
	}

	@Override
	public int deleteReview(int rev_delete_gb) throws SQLException {
		return client.update("review.updateDelete", rev_delete_gb);
	}
	
}
