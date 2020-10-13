package mukgo.user.store.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import mukgo.vo.StoreVO;

public interface IStoreDao {
	public List<StoreVO> searchStore(Map<String, Object> param) throws SQLException;
}
