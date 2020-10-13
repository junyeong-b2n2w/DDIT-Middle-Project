package mukgo.user.store.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import mukgo.user.store.dao.IStoreDao;
import mukgo.user.store.dao.StoreDaoImpl;
import mukgo.vo.StoreVO;

public class StoreServiceImpl implements IStoreService{
	private static IStoreService service;
	private IStoreDao dao;
	
	private StoreServiceImpl() {
		dao = StoreDaoImpl.getConnection();
	}
	
	public static IStoreService getConnection(){
		if(service==null) service=new StoreServiceImpl(); 
		return service;
	}
	
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

	@Override
	public List<StoreVO> storeAll(){
		List<StoreVO> storeList = null;
		try {
			storeList = dao.storeAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return storeList;
	}

}
