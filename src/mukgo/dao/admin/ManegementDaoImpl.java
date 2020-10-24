package mukgo.dao.admin;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sun.security.ntlm.Client;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;

public class ManegementDaoImpl implements IManegementDao{
	
	private static ManegementDaoImpl dao;
	private SqlMapClient smc;
	
	private ManegementDaoImpl(){
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static ManegementDaoImpl getInstance() {
		if(dao == null) dao = new ManegementDaoImpl();
		
		return dao;
	}

	@Override
	public List<MemberVO> getAllMember() {
		List<MemberVO> list = null;
		try {
			list = (List<MemberVO>)smc.queryForList("admin.getAllMember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<StoreVO> getAllStore() {
		List<StoreVO> list = null;
		try {
			list = smc.queryForList("admin.getAllStore");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int changeGB(MemberVO vo) throws SQLException {
		System.out.println("dao vo : " + vo.getMem_num());
		return smc.update("admin.changeGB",vo);
	}

	@Override
	public int changeGB2(MemberVO vo) throws SQLException {
		
		return smc.update("admin.changeGB2",vo);
	}
	
	@Override
	public int storeChange(StoreVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("admin.storeChange",vo);
	}

}
