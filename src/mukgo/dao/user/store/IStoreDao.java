package mukgo.dao.user.store;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;
import mukgo.vo.StoreVO;

public interface IStoreDao {
	//가게이름
	public List<StoreVO> allStore() throws SQLException;
	
	public StoreVO oneStore(int sto_num) throws SQLException;
	
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
	public int storeDelete(int num) throws SQLException;
	
	//메뉴수정
	public int storeUpdate(MenuVO vo) throws SQLException;
	//가게메뉴 조회
	public List<StoreVO> storeMenu() throws SQLException;
	
	public List<StoreVO> storeMenuSelect(int sto_brand) throws SQLException;
	
	public List<StoreVO> storeBrandNum() throws SQLException;
	
	public MenuVO getMenu(int num)throws SQLException;
	
	public List<MenuVO> stroemenuprint(int sto_brand) throws SQLException;
	
	public String storeStar(int stoNum) throws SQLException;

	public List<Map<String, Object>> storeOrder(int ord_sto_num) throws SQLException;
	
	public StoreVO storeInformationf(int sto_num) throws SQLException;
	
	public String storeName(int stoMemNum) throws SQLException;
	
	public int storeInfoUpdate(StoreVO vo) throws SQLException;
	
	public int orderCount(int sto_num) throws SQLException;
	
	
}
