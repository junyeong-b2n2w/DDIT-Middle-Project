package mukgo.user.service;

import mukgo.user.dao.IJoinDao;
import mukgo.user.dao.JoinDaoImpl;
import mukgo.vo.MemberVO;

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
	public int searchMember(String memId) {
		return dao.searchMember(memId);
	}

	@Override
	public int insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
