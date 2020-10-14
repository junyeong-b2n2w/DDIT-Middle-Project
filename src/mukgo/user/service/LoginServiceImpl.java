package mukgo.user.service;

import mukgo.user.dao.ILoginDao;
import mukgo.user.dao.LoginDaoImpl;
import mukgo.util.BuildSqlMapClient;
import mukgo.vo.MemberVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class LoginServiceImpl implements ILoginService{
	private static ILoginService service;
	private ILoginDao dao;
	
	private LoginServiceImpl(){
		dao = LoginDaoImpl.getInstance();
	}
	
	public static ILoginService getInstance(){
		if(service == null) service = new LoginServiceImpl();
		
		return service;
	}

	@Override
	public MemberVO loginMember(MemberVO vo) {
		return dao.loginMember(vo);
	}

	
}
