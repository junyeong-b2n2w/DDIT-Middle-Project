package mukgo.user.dao;

import mukgo.vo.MemberVO;

public interface IMemberDao {
	public int searchMember(String memId);
	   
	public int insertMember(MemberVO vo);
}
