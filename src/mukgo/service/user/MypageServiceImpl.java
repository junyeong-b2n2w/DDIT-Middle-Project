package mukgo.service.user;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mukgo.dao.user.IMypageDao;
import mukgo.dao.user.MypageDaoImpl;
import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;
import mukgo.vo.ReviewImageVO;
import mukgo.vo.ReviewVO;

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
	@Override
	public String getStoreName(int stoNum){
		String storeName = "";
		try {
			storeName = dao.getStoreName(stoNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return storeName;
	}
	@Override
	public MenuVO getMenuInfo(int menuNum){
		MenuVO vo = new MenuVO();
		try {
			vo = dao.getMenuInfo(menuNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	@Override
	public int reviewCheck(OrderVO vo) {
		int cnt = 0;
		try {
			cnt = dao.reviewCheck(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int reviewInsert(ReviewVO vo) {
		int cnt = 0;
		try {
			cnt = dao.reviewInsert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int reviewDelete(int revNum) {
		int cnt = 0;
		try {
			cnt = dao.reviewDelete(revNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int reviewUpdate(ReviewVO vo) {
		int cnt = 0;
		try {
			cnt = dao.reviewUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int reviewImageInsert(ReviewImageVO vo) {
		int cnt = 0;
		try {
			cnt = dao.reviewImageInsert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<ReviewImageVO> reviewImageSelect(int revNum) {
		List<ReviewImageVO> list = new ArrayList<>();
		try {
			list = dao.reviewImageSelect(revNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int reviewImageDelete(int revImgNum) {
		int cnt = 0;
		try {
			cnt = dao.reviewImageDelete(revImgNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
