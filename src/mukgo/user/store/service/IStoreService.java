package mukgo.user.store.service;

import java.util.List;
import java.util.Map;

import mukgo.vo.MenuVO;
import mukgo.vo.StoreVO;

public interface IStoreService {
	//가게이름
	public List<StoreVO> allStore();
	//가게검색
	public List<StoreVO> searchStore(Map<String, Object> param);
	//평균별점
	public int storeGrade(int grade);
	//리뷰수
	public int storeReviewCnt();
	//찜수
	public int storeChoiceCnt();
	//가게메뉴들
	public List<StoreVO> storeMenu(int num);
	//메뉴추가
	public int storeInsertMenu(MenuVO vo);
	
	//메뉴삭제
	public int storeUpdateDelete(MenuVO vo);
	//매장정보
	public int storeInfo(StoreVO vo);
	
}
