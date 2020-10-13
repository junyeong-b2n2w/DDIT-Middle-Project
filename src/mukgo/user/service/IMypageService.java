package mukgo.user.service;

import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.OrderVO;

public interface IMypageService {
	public MemberVO userMypage(String id);
	
	public int userMypageUpdate(MemberVO vo);
	
	public int userMypageDelete(String id);
	
	public AddressVO userAddress(String id);
	
	public int userAddressUpdate(AddressVO vo);
	
	public int userAddressDelete(String id);
	
	public OrderVO userRecentOrder(String id);
}
