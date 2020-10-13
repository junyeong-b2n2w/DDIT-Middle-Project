package mukgo.user.dao;


import java.sql.SQLException;

import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.OrderVO;

public interface IMypageDao {
	public MemberVO userMypage(String id) throws SQLException;
	
	public int userMypageUpdate(MemberVO vo) throws SQLException;
	
	public int userMypageDelete(String id) throws SQLException;
	
	public AddressVO userAddress(String id) throws SQLException;
	
	public int userAddressUpdate(AddressVO vo) throws SQLException;
	
	public int userAddressDelete(String id) throws SQLException;
	
	public OrderVO userRecentOrder(String id) throws SQLException;
}
