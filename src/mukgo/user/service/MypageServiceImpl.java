package mukgo.user.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mukgo.user.dao.IMypageDao;
import mukgo.user.dao.MypageDaoImpl;
import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.OrderVO;

public class MypageServiceImpl implements IMypageService{
	private IMypageDao dao;
	private static IMypageService service;
	private MypageServiceImpl() {
		dao = MypageDaoImpl.getConnection();
	}
	public static IMypageService getConnection(){
		if(service ==null) service = new MypageServiceImpl();
		return service;
	}
	@Override
	public MemberVO userMypage(String id) {
		MemberVO vo = new MemberVO();
		try {
			vo = dao.userMypage(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int userMypageUpdate(MemberVO vo) {
		int cnt = 0;
		try {
			cnt = dao.userMypageUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int userMypageDelete(String id) {
		int cnt = 0;
		try {
			cnt = dao.userMypageDelete(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<AddressVO> userAddress(int memNum) {
		List<AddressVO> list = new ArrayList<>();
		try {
			list = dao.userAddress(memNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int userAddressUpdate(AddressVO vo) {
		int cnt = 0;
		try {
			cnt = dao.userAddressUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int userAddressDelete(int memNum) {
		int cnt = 0;
		try {
			cnt = dao.userAddressDelete(memNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<OrderVO> userRecentOrder(int memNum) {
		List<OrderVO> list = new ArrayList<>();
		try {
			list = dao.userRecentOrder(memNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
