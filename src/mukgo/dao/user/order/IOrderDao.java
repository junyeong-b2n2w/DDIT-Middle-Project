package mukgo.dao.user.order;

import java.sql.SQLException;
import java.util.List;

import mukgo.vo.AddressVO;
import mukgo.vo.DeliveryVO;
import mukgo.vo.OrderVO;

public interface IOrderDao {

	public int insertOrder(OrderVO vo) throws SQLException;
	public int insertOrderAdd(OrderVO vo) throws SQLException;
	
	public int insertAddr(AddressVO vo) throws SQLException;
	
	public int storeNum(String stoName) throws SQLException;
	public int menuNum(String menuName) throws SQLException;
	
	public int deliveryStatus(DeliveryVO vo) throws SQLException;
	
	public List<OrderVO> storeOrderList(int stoNum) throws SQLException;
	
	public List<DeliveryVO> orderDeli(int ordNum) throws SQLException;
	
	public void deliStatusStore(int ordNum) throws SQLException;
	public void deliStatusUser(int ordNum) throws SQLException;
}
