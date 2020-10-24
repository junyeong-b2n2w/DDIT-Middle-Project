package mukgo.service.admin;

import java.sql.SQLException;
import java.util.List;

import mukgo.dao.admin.ManegementDaoImpl;
import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;


public class ManegementServiceImpl implements IManegementService{
	private ManegementDaoImpl dao;
	private static ManegementServiceImpl service;
	
	private ManegementServiceImpl(){
		dao = ManegementDaoImpl.getInstance();
	}
	
	public static ManegementServiceImpl getInstance() {
		if(service == null) service = new ManegementServiceImpl();
		
		return service;
	}

	@Override
	public List<MemberVO> getAllMember() {
		return dao.getAllMember();
	}

	@Override
	public List<StoreVO> getAllStore() {
		return dao.getAllStore();
	}

	@Override
	public int changeGB(MemberVO vo) {
		int cnt = 0;
		System.out.println("service vo " + vo.getMem_num());
		try {
			cnt = dao.changeGB(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int changeGB2(MemberVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.changeGB2(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int storeChange(StoreVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.storeChange(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	
}
