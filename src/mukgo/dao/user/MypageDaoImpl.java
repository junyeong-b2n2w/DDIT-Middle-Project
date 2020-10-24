package mukgo.dao.user;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;
import mukgo.vo.ReviewImageVO;
import mukgo.vo.ReviewVO;

public class MypageDaoImpl implements IMypageDao{
	private static IMypageDao dao;
	private SqlMapClient smc;
	
	private MypageDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static IMypageDao getConnection(){
		if(dao==null) dao = new MypageDaoImpl();
		return dao;
	}
	
	@Override
	public MemberVO userMypage(String id) throws SQLException {
		return (MemberVO) smc.queryForObject("mypage.userMypage", id);
	}

	@Override
	public int userMypageUpdate(MemberVO vo) throws SQLException {
		return smc.update("mypage.userMypageUpdate", vo);
	}

	@Override
	public int userMypageDelete(String id) throws SQLException {
		return smc.update("mypage.userMypageDelete", id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AddressVO> userAddress(int memNum) throws SQLException {
		return smc.queryForList("mypage.userAddress", memNum);
	}

	@Override
	public int userAddressUpdate(AddressVO vo) throws SQLException {
		return smc.update("mypage.userAddressUpadate", vo);
	}

	@Override
	public int userAddressDelete(int memNum) throws SQLException {
		return smc.delete("mypage.userAddressDelete", memNum);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderVO> userRecentOrder(int memNum) throws SQLException {
		return smc.queryForList("mypage.userRecentOrder", memNum);
	}

	@Override
	public String getStoreName(int stoNum) throws SQLException {
		return (String) smc.queryForObject("mypage.getStoreName", stoNum);
	}

	@Override
	public MenuVO getMenuInfo(int menuNum) throws SQLException {
		return (MenuVO) smc.queryForObject("mypage.getMenuInfo", menuNum);
	}

	@Override
	public int reviewCheck(OrderVO vo) throws SQLException {
		return (Integer) smc.queryForObject("mypage.reviewCheck", vo);
	}

	@Override
	public int reviewInsert(ReviewVO vo) throws SQLException {
		return (int) smc.insert("mypage.reviewInsert", vo);
	}

	@Override
	public int reviewImageInsert(ReviewImageVO vo) throws SQLException {
		return (int) smc.insert("mypage.reviewImageInsert", vo);
	}

	@Override
	public int reviewDelete(int revNum) throws SQLException {
		return smc.delete("mypage.reviewDelete", revNum);
	}

	@Override
	public int reviewUpdate(ReviewVO vo) throws SQLException {
		return smc.update("mypage.reviewUpdate", vo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReviewImageVO> reviewImageSelect(int revNum) throws SQLException {
		return smc.queryForList("mypage.reviewImageSelect", revNum);
	}

	@Override
	public int reviewImageDelete(int revImgNum) throws SQLException {
		return smc.delete("mypage.reviewImageDelete", revImgNum);
	}

}
