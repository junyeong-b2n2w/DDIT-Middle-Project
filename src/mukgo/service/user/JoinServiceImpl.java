package mukgo.service.user;

import mukgo.dao.user.IJoinDao;
import mukgo.dao.user.JoinDaoImpl;
import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;

public class JoinServiceImpl implements IJoinService{
	private IJoinDao dao;
	private static JoinServiceImpl service;
	
	public static JoinServiceImpl getInstance(){
		if(service == null) service = new JoinServiceImpl();
		
		return service;
	}
	
	private JoinServiceImpl(){
		dao = JoinDaoImpl.getInstance();
	}

	@Override
	public String searchMember(String memId) {
		return dao.searchMember(memId);
	}

	@Override
	public int insertMember(MemberVO vo) {
		return dao.insertMember(vo);
	}

	@Override
	public int insertStoreMember(MemberVO vo) {
		return dao.insertStoreMember(vo);
	}

	@Override
	public int insertStore(StoreVO vo) {
		return dao.insertStore(vo);
	}

	@Override
	public int insertStoreAddr(AddressVO vo) {
		return dao.insertStoreAddr(vo);
	}

	@Override
	public int setMemberStore(MemberVO vo) {
		return dao.setMemberStore(vo);
	}

}
