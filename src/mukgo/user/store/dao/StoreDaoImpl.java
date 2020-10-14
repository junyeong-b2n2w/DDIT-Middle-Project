package mukgo.user.store.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.MenuVO;
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
		
		list = client.queryForList("store.allStore");
		
		return list;
	}
	//지점검색
	@Override
	public List<StoreVO> searchStore(Map<String, Object> param) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("store.SearchStore", param);
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
	public List<StoreVO> storeMenu(int num) throws SQLException {
		// TODO Auto-generated method stub
		List<StoreVO> list = null;
		return (List<StoreVO>)client.queryForList("store.StoreMenu",num);
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
	public int storeUpdateDelete(MenuVO vo) throws SQLException {
		
		return client.update("store.storeDeleteMenu",vo);
	}
	//가게정보
	@Override
	public int storeInfo(StoreVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)client.queryForObject("store.StoreInfo", vo);
	}



	
	

}
