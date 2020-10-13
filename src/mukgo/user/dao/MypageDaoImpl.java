package mukgo.user.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.OrderVO;

public class MypageDaoImpl implements IMypageDao{
	private static IMypageDao dao;
	private SqlMapClient smc;
	
	private MypageDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static IMypageDao getConnection(){
		if(dao==null) dao = new MypageDaoImpl();
		return dao;
	}
	
	@Override
	public MemberVO userMypage(String id) throws SQLException {
		return null;
	}

	@Override
	public int userMypageUpdate(MemberVO vo) throws SQLException {
		return 0;
	}

	@Override
	public int userMypageDelete(String id) throws SQLException {
		return 0;
	}

	@Override
	public AddressVO userAddress(String id) throws SQLException {
		return null;
	}

	@Override
	public int userAddressUpdate(AddressVO vo) throws SQLException {
		return 0;
	}

	@Override
	public int userAddressDelete(String id) throws SQLException {
		return 0;
	}

	@Override
	public OrderVO userRecentOrder(String id) throws SQLException {
		return null;
	}
	
}
