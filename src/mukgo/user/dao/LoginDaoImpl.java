package mukgo.user.dao;

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
	public int loginMember(MemberVO vo) {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("login.loginMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
