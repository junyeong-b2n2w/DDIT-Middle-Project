package mukgo.service.user.address;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mukgo.dao.user.address.AddressDaoImpl;
import mukgo.dao.user.address.IAddressDao;
import mukgo.vo.AddressVO;

public class AddressServiceImpl implements IAddressService{
	private IAddressDao dao;
	private static IAddressService service;
	private AddressServiceImpl() {
		dao = AddressDaoImpl.getConnection();
	}
	public static IAddressService getConnection(){
		if(service==null) service = new AddressServiceImpl();
		return service;
	}
	@Override
	public List<AddressVO> addressList(String id) {
		List<AddressVO> list = new ArrayList<>();
		try {
			list = dao.addressList(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int addressInsert(AddressVO vo) {
		int cnt = 0;
		try {
			cnt = dao.addressInsert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int addressUpdate(AddressVO vo) {
		int cnt = 0;
		try {
			cnt = dao.addressUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int addressDelete(int postNum) {
		int cnt = 0;
		try {
			cnt = dao.addressDelete(postNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int addressCheck(String addName) {
		int cnt = 0;
		try {
			cnt = dao.addressCheck(addName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

}
