package mukgo.dao.user;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.MemberVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class LoginDaoImpl implements ILoginDao{
	private static LoginDaoImpl dao;
	private SqlMapClient smc;
	
	private LoginDaoImpl(){
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static LoginDaoImpl getInstance(){
		if(dao == null) dao = new LoginDaoImpl();
		
		return dao;
	}

	@Override
	public MemberVO loginMember(MemberVO vo) {
		MemberVO resultVO = null;
		try {
			resultVO = (MemberVO) smc.queryForObject("login.loginMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultVO;
	}

}
