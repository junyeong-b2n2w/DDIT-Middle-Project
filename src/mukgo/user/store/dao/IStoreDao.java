package mukgo.user.store.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import mukgo.vo.MenuVO;
import mukgo.vo.StoreVO;

public interface IStoreDao {
	//가게이름
	public List<StoreVO> allStore() throws SQLException;
	//검색
	public List<StoreVO> searchStore(Map<String, Object> param) throws SQLException;
	//평균별점
	public int storeGrade(int grade) throws SQLException;
	//리뷰수
	public int storeReviewCnt() throws SQLException;
	//찜수
	public int storeChoiceCnt() throws SQLException;
	//메뉴추가
	public int storeInsertMenu(MenuVO vo) throws SQLException; 
	//메뉴삭제
	public int storeUpdateDelete(MenuVO vo) throws SQLException;
	//가게메뉴 조회
	public List<StoreVO> storeMenu(int num) throws SQLException;
	//가게정보
	public int storeInfo(StoreVO vo)throws SQLException;
	
	
}
