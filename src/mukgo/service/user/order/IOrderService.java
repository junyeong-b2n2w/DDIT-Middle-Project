package mukgo.service.user.order;



import java.util.List;

import mukgo.vo.AddressVO;
import mukgo.vo.DeliveryVO;
import mukgo.vo.OrderVO;

public interface IOrderService {

	public int insertOrder(OrderVO vo);
	public int insertOrderAdd(OrderVO vo);
	
	public int insertAddr(AddressVO vo);
	public int storeNum(String stoName);
	public int menuNum(String menuName);
	public int deliveryStatus(DeliveryVO vo);
	public List<OrderVO> storeOrderList(int stoNum);
	public List<DeliveryVO> orderDeli(int ordNum);
	public void deliStatusStore(int ordNum);
	public void deliStatusUser(int ordNum);
}
