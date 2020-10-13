package mukgo.user.store.service;

import java.util.List;
import java.util.Map;

import mukgo.vo.StoreVO;

public interface IStoreService {
	/**
	 * 가게 검색을 위한 메서드
	 * Map 객체에 (가게명, 가게위치(최대 최소)x, y, 드라이브스루 구분List, 브랜드 구분List)를 넘겨준다
	 * 검색 요청 없을시 기본값(가게명="",가게위치 최대=999, 최소=0, 드라이브스루=(List{0, 1}) 브랜드=(List{1, 2, 3}))
	 * @param Map(sto_name, sto_pos_x_max, sto_pos_x_max
	 * 			, sto_pos_y_max, sto_pos_y_min, dtList, brandList)
	 * @return 리턴 값으로 검색내용에 해당하는 StoreVO List객체를 반환한다.
	 */
	public List<StoreVO> searchStore(Map<String, Object> param);
}
