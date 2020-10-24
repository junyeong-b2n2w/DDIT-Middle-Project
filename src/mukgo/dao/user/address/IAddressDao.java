package mukgo.dao.user.address;

import java.sql.SQLException;
import java.util.List;

import mukgo.vo.AddressVO;

public interface IAddressDao {
	
	// 주소 목록
	public List<AddressVO> addressList(String id) throws SQLException;
	// 주소 추가
	public int addressInsert(AddressVO vo) throws SQLException;
	// 주소 수정
	public int addressUpdate(AddressVO vo) throws SQLException;
	// 주소 삭제
	public int addressDelete(int postNum) throws SQLException;
	public int addressCheck(String addName) throws SQLException;
}
