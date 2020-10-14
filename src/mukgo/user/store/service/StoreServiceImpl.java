package mukgo.user.store.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.user.store.dao.IStoreDao;
import mukgo.user.store.dao.StoreDaoImpl;
import mukgo.vo.MenuVO;
import mukgo.vo.StoreVO;

public class StoreServiceImpl implements IStoreService {
	
	private IStoreDao dao;
	private static IStoreService service;
	
	private StoreServiceImpl(){
		dao = StoreDaoImpl.getConnection();
	}
	
	public static IStoreService getConnection() {
		if(service == null) service = new StoreServiceImpl();
		
		return service;
	}
	
	@Override //전체 지점출력
	public List<StoreVO> allStore() {
		
		List<StoreVO> list = null;
		try {
			list = dao.allStore();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	//지점검색
	@Override
	public List<StoreVO> searchStore(Map<String, Object> param) {
		List<StoreVO> searchList = null;
		try {
			searchList = dao.searchStore(param);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchList;
	}
	

	
	//평균 평점
	@Override
	public int storeGrade(int grade) {
		int cnt = 0;
		
		try {
			cnt = dao.storeGrade(grade);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	//리뷰수

	@Override
	public int storeReviewCnt() {
		int cnt = 0;
		
		try {
			cnt = dao.storeReviewCnt();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	//찜수
	@Override
	public int storeChoiceCnt() {
		int cnt = 0 ;
		
		try {
			cnt = dao.storeChoiceCnt();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	
	//가게메뉴들
	@Override
	public List<StoreVO> storeMenu(int num) {
		List<StoreVO> list = null;
		
		try {
			list = dao.storeMenu(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//메뉴추가
	
	@Override
	public int storeUpdateDelete(MenuVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.storeUpdateDelete(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	//가게정보
	@Override
	public int storeInfo(StoreVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.storeInfo(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int storeInsertMenu(MenuVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.storeInsertMenu(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}



	


	//가게알림이
	
	

}
