package mukgo.user.service;

import java.util.List;

import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.OrderVO;

public interface IMypageService {
	public MemberVO userMypage(String id);
	
	public int userMypageUpdate(MemberVO vo);
	
	public int userMypageDelete(String id);
	
	public List<AddressVO> userAddress(int memNum);
	
	public int userAddressUpdate(AddressVO vo);
	
	public int userAddressDelete(int memNum);
	
	public List<OrderVO> userRecentOrder(int memNum);
}
