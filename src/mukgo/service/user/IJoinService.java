package mukgo.service.user;

import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;

public interface IJoinService {
	public String searchMember(String memId);
	   
	public int insertMember(MemberVO vo);
	
	public int insertStoreMember(MemberVO vo);
	
	public int insertStore(StoreVO vo);
	
	public int insertStoreAddr(AddressVO vo);
	
	public int setMemberStore(MemberVO vo);
}
