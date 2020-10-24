package mukgo.service.user.store;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;
import mukgo.vo.StoreVO;

public interface IStoreService {
	//가게이름
	public List<StoreVO> allStore();
	public StoreVO oneStore(int sto_num);
	
	//가게검색
	public List<StoreVO> searchStore(Map<String, Object> param);
	//평균별점
	public int storeGrade(int grade);
	//리뷰수
	public int storeReviewCnt();
	//찜수
	public int storeChoiceCnt();
	//가게메뉴들
	public List<StoreVO> storeMenu();
	//메뉴추가
	public int storeInsertMenu(MenuVO vo);
	
	//브랜드검색
	public List<StoreVO> storeBrandNum();
	
	//메뉴수정
	public int storeUpdate(MenuVO vo);
	//메뉴삭제
	public int storeDelete(int num);
	
	public MenuVO getMenu(int num);

	public List<StoreVO> storeMenuSelect(int sto_brand);

	//브래든별메뉴출력
	public List<MenuVO> stroemenuprint(int sto_brand);
	
	public String storeStar(int stoNum);
	
	public List<Map<String, Object>> storeOrder(int ord_sto_num);
	
	public StoreVO storeInformation(int sto_num) ;
	
	public String storeName(int stoMemNum);
	
	public int storeInfoUpdate(StoreVO vo);

	
	public int orderCount(int sto_num) ;
	

}
