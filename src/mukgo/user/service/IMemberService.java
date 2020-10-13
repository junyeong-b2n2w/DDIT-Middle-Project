package mukgo.user.service;

import mukgo.vo.MemberVO;

public interface IMemberService {
	public int searchMember(String memId);
	   
	public int insertMember(MemberVO vo);
}
