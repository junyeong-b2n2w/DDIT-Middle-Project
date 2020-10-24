package mukgo.service.admin;

import java.util.List;

import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;

public interface IManegementService {
	public List<MemberVO> getAllMember();
	
	public List<StoreVO> getAllStore(); 
	
	public int changeGB(MemberVO vo);
	public int changeGB2(MemberVO vo);
	
	public int storeChange(StoreVO vo);
}
