package mukgo.user.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.MemberVO;

public class JoinDaoImpl implements IJoinDao{
	private static JoinDaoImpl dao;
	private SqlMapClient smc;
	
	private JoinDaoImpl(){
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static JoinDaoImpl getInstance(){
		if(dao == null) dao = new JoinDaoImpl();
		
		return dao;
	}

	@Override
	public int searchMember(String memId) {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("join.searchMember", memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int insertMember(MemberVO vo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("join.insertMember", vo);
			if(obj == null) cnt = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
