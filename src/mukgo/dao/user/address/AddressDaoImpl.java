package mukgo.dao.user.address;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.AddressVO;

public class AddressDaoImpl implements IAddressDao{
	private SqlMapClient smc;
	private static IAddressDao dao;
	private AddressDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	public static IAddressDao getConnection(){
		if(dao == null) dao = new AddressDaoImpl();
		return dao;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<AddressVO> addressList(String id) throws SQLException {
		return smc.queryForList("address.addressList", id);
	}

	@Override
	public int addressInsert(AddressVO vo) throws SQLException {
		return (int) smc.insert("address.addressInsert", vo);
	}

	@Override
	public int addressUpdate(AddressVO vo) throws SQLException {
		return smc.update("address.addressUpdate", vo);
	}

	@Override
	public int addressDelete(int postNum) throws SQLException {
		return smc.delete("address.addressDelete", postNum);
	}
	@Override
	public int addressCheck(String addName) throws SQLException {
		return (int) smc.queryForObject("address.addressCheck", addName);
	}

}
