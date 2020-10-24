package mukgo.dao.user;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;

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
	public String searchMember(String memId) {
		String id = null;
		try {
			id =  (String) smc.queryForObject("join.searchMember", memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public int insertMember(MemberVO vo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("join.insertMember", vo);
			if(obj == null) cnt = 0;
			else cnt = (int)obj;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int insertStoreMember(MemberVO vo) {
		int num = 0;
		try {
			num = (int) smc.insert("join.insertMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int insertStore(StoreVO vo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("join.insertStore", vo);
			if(obj == null) cnt = 0;
			else cnt = (int)obj;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int insertStoreAddr(AddressVO vo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("join.insertStoreAddr", vo);
			if(obj == null) cnt = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int setMemberStore(MemberVO vo) {
		int cnt = 0;
		try {
			cnt = smc.update("join.setMemberStore", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
