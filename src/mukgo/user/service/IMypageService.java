package mukgo.user.service;

import java.sql.SQLException;
import java.util.List;

import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;
import mukgo.vo.ReviewImageVO;
import mukgo.vo.ReviewVO;

public interface IMypageService {
	public MemberVO userMypage(String id);
	
	public int userMypageUpdate(MemberVO vo);
	
	public int userMypageDelete(String id);
	
	public List<AddressVO> userAddress(int memNum);
	
	public int userAddressUpdate(AddressVO vo);
	
	public int userAddressDelete(int memNum);
	
	public List<OrderVO> userRecentOrder(int memNum);
	
	public String getStoreName(int stoNum);
	
	public MenuVO getMenuInfo(int menuNum);
	
	public int reviewCheck(OrderVO vo);
	
	public int reviewInsert(ReviewVO vo);
	
	public int reviewDelete(int revNum);
	
	public int reviewUpdate(ReviewVO vo);
	
	public int reviewImageInsert(ReviewImageVO vo);
	
	public List<ReviewImageVO> reviewImageSelect(int revNum);
	
	public int reviewImageDelete(int revImgNum);
}
