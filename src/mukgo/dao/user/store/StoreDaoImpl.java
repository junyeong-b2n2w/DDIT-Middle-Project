package mukgo.dao.user.store;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;
import mukgo.vo.StoreVO;

public class StoreDaoImpl implements IStoreDao{
	//객체생성
	private SqlMapClient client;
	private static IStoreDao dao;
	
	private StoreDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static IStoreDao getConnection() {
		if(dao == null) dao = new StoreDaoImpl();
		
		return dao;
	}
	
	//전체 지점 출력
	public List<StoreVO> allStore()throws SQLException{
		List<StoreVO> list = null;
		
		list = (List<StoreVO>)client.queryForList("store.allStore");
		
		return list;
	}
	//지점검색
	@Override
	public List<StoreVO> searchStore(Map<String, Object> param) throws SQLException {
		// TODO Auto-generated method stub
		return (List<StoreVO>)client.queryForList("store.SearchStore", param);
	}
	
	
	//평점
	@Override
	public int storeGrade(int grade) throws SQLException {
		
		return (Integer)client.queryForObject("store.StoreGrade",grade);
	}
	
	//리뷰수
	@Override
	public int storeReviewCnt() throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)client.queryForObject("store.StoreReviewCnt");
	}

	//찜수
	@Override
	public int storeChoiceCnt() throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)client.queryForObject("store.StoreChoiceCnt");
	}

	
	//가게메뉴들
	@Override
	public List<StoreVO> storeMenu() throws SQLException {
		
		return (List<StoreVO>)client.queryForList("store.StoreMenu");
	}
	
	
	//메뉴추가
	@Override
	public int storeInsertMenu(MenuVO vo) throws SQLException {
		int cnt = 0;
		Object obj = client.insert("store.storeInsertMenu", vo);
		if(obj == null) cnt = 1;
		return cnt;
	}
	@Override
	public int storeDelete(int num) throws SQLException {
		
		return client.delete("store.storeDelete",num);
	}
	
	//메뉴수정
	@Override
	public int storeUpdate(MenuVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("store.storeUpdate",vo);
	}

	@Override
	public MenuVO getMenu(int num) throws SQLException {
		MenuVO vo = null;
		
		vo = (MenuVO)client.queryForObject("store.getMenu", num);
		return vo;
	}

	@Override
	public List<StoreVO> storeBrandNum( ) throws SQLException {
		
		return client.queryForList("store.storeBrandNum");
	}

	@Override
	public List<StoreVO> storeMenuSelect(int sto_brand) throws SQLException {
		return client.queryForList("store.StoreMenuSelect", sto_brand);
	}

	@Override
	public StoreVO oneStore(int sto_num) throws SQLException {
		// TODO Auto-generated method stub
		return (StoreVO) client.queryForObject("store.StoreOne",sto_num);
	}

	@Override
	public List<MenuVO> stroemenuprint(int sto_brand) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("store.stroemenuprint", sto_brand);
	}

	@Override
	public String storeStar(int stoNum) throws SQLException {
		return (String) client.queryForObject("store.storeStar", stoNum);
	}

	public List<Map<String, Object>> storeOrder(int ord_sto_num) throws SQLException {
		return client.queryForList("store.storeOrder", ord_sto_num);
	}

	@Override
	public StoreVO storeInformationf(int sto_num) throws SQLException {
		
		return (StoreVO) client.queryForObject("store.storeInformation", sto_num);
	}

	@Override
	public String storeName(int stoMemNum) throws SQLException {

		return (String)client.queryForObject("store.StoreName", stoMemNum);
	}

	@Override
	public int storeInfoUpdate(StoreVO vo) throws SQLException {
		return client.update("store.storeInfoUpdate",vo);
	}


	@Override
	public int orderCount(int sto_num) throws SQLException {
		return (int)client.queryForObject("store.orderCount",sto_num);
	}



}
