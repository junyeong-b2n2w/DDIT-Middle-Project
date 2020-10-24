package mukgo.service.user.address;

import java.util.List;

import mukgo.vo.AddressVO;

public interface IAddressService {
	// 주소 목록
	public List<AddressVO> addressList(String id);
	// 주소 추가
	public int addressInsert(AddressVO vo);
	// 주소 수정
	public int addressUpdate(AddressVO vo);
	// 주소 삭제
	public int addressDelete(int postNum);
	// 주소 확인
	public int addressCheck(String addName);
}
