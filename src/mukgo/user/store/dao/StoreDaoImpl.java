package mukgo.user.store.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.StoreVO;

public class StoreDaoImpl implements IStoreDao{
	private SqlMapClient smc;
	private static IStoreDao dao;
	private StoreDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	public static IStoreDao getConnection(){
		if(dao==null) dao = new StoreDaoImpl();
		return dao;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<StoreVO> searchStore(Map<String, Object> param) throws SQLException {
		return smc.queryForList("store.SearchStore", param);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<StoreVO> storeAll() throws SQLException {
		return smc.queryForList("store.StoreAll");
	}

}
