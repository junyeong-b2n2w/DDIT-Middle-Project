package mukgo.user.dao;


import java.sql.SQLException;
import java.util.List;

import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;

public interface IMypageDao {
	public MemberVO userMypage(String id) throws SQLException;
	
	public int userMypageUpdate(MemberVO vo) throws SQLException;
	
	public int userMypageDelete(String id) throws SQLException;
	
	public List<AddressVO> userAddress(int memNum) throws SQLException;
	
	public int userAddressUpdate(AddressVO vo) throws SQLException;
	
	public int userAddressDelete(int memNum) throws SQLException;
	
	public List<OrderVO> userRecentOrder(int memNum) throws SQLException;
	
	public String getStoreName(int stoNum) throws SQLException;
	
	public MenuVO getMenuInfo(int menuNum) throws SQLException;
}
