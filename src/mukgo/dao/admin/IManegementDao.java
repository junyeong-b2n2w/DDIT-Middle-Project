package mukgo.dao.admin;

import java.sql.SQLException;
import java.util.List;

import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;

public interface IManegementDao {
	public List<MemberVO> getAllMember();
	
	public List<StoreVO> getAllStore(); 
	
	
	public int changeGB(MemberVO vo)throws SQLException;
	
	public int changeGB2(MemberVO vo)throws SQLException;
	
	public int storeChange(StoreVO vo) throws SQLException;
}
