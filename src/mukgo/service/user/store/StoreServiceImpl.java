package mukgo.service.user.store;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.dao.user.store.IStoreDao;
import mukgo.dao.user.store.StoreDaoImpl;
import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;
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
	public List<StoreVO> storeMenu() {
		List<StoreVO> list = null;
		
		try {
			list = dao.storeMenu();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//메뉴추가
	
	@Override
	public int storeDelete(int num){
		int cnt = 0;
		
		try {
			cnt = dao.storeDelete(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	//메누추가
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

	//메뉴수정
	@Override
	public int storeUpdate(MenuVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.storeUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public MenuVO getMenu(int num) {
		MenuVO cnt = null;
		try {
			cnt = dao.getMenu(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<StoreVO> storeBrandNum() {
		List<StoreVO> list = null;
		
		try {
			list = dao.storeBrandNum();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return list;
	}

	@Override
	public List<StoreVO> storeMenuSelect(int sto_brand) {
		
		List<StoreVO> list = null;
		
		try {
			list = dao.storeMenuSelect(sto_brand);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public StoreVO oneStore(int sto_num) {
		StoreVO vo = null;

		try {
			vo = dao.oneStore(sto_num);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return vo;
	}

	@Override
	public List<MenuVO> stroemenuprint(int sto_brand) {
		List<MenuVO> list = null;
		
		try {
			list = dao.stroemenuprint(sto_brand);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String storeStar(int stoNum) {
		String res = "";
		try {
			res = dao.storeStar(stoNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<Map<String, Object>> storeOrder(int ord_sto_num) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.storeOrder(ord_sto_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public StoreVO storeInformation(int sto_num) {
		StoreVO vo = null;
		
		try {
			vo = dao.storeInformationf(sto_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public String storeName(int stoMemNum) {
		String store_name = null;
		
		try {
			store_name = dao.storeName(stoMemNum);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return store_name;
	}

	@Override
	public int storeInfoUpdate(StoreVO vo) {

		int cnt = 0;
		try {
			cnt = dao.storeInfoUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
		
		
	}


	@Override
	public int orderCount(int sto_num) {
		int count = 0;
		
		try {
			count = dao.orderCount(sto_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}



	//가게알림이
	
	

}
