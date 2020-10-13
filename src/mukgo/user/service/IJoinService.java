package mukgo.user.service;

import mukgo.vo.MemberVO;

public interface IJoinService {
	public int searchMember(String memId);
	   
	public int insertMember(MemberVO vo);
}
