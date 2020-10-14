package mukgo.user.dao;


import java.sql.SQLException;
import java.util.List;

import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;
import mukgo.vo.ReviewImageVO;
import mukgo.vo.ReviewVO;

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
	
	public int reviewCheck(OrderVO vo) throws SQLException;
	
	public int reviewInsert(ReviewVO vo) throws SQLException;
	
	public int reviewDelete(int revNum) throws SQLException;
	
	public int reviewUpdate(ReviewVO vo) throws SQLException;
	
	public int reviewImageInsert(ReviewImageVO vo) throws SQLException;
	
	public List<ReviewImageVO> reviewImageSelect(int revNum) throws SQLException;
	
	public int reviewImageDelete(int revImgNum) throws SQLException;
}
