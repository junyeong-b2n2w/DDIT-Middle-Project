package mukgo.dao.user.order;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.AddressVO;
import mukgo.vo.DeliveryVO;
import mukgo.vo.OrderVO;

public class OrderDaoImpl implements IOrderDao{
	private SqlMapClient smc;
	private static IOrderDao dao;
	private OrderDaoImpl(){
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	public static IOrderDao getConnection(){
		if(dao == null) dao = new OrderDaoImpl();
		return dao;
	}

	@Override
	public int insertOrder(OrderVO vo) throws SQLException {
		return (int) smc.insert("order.insertOrder", vo);
	}

	@Override
	public int insertAddr(AddressVO vo) throws SQLException {
		return (int) smc.insert("order.insertAddr", vo);
	}
	@Override
	public int storeNum(String stoName) throws SQLException {
		return (int) smc.queryForObject("order.storeNum", stoName);
	}
	@Override
	public int menuNum(String menuName) throws SQLException {
		return (int) smc.queryForObject("order.menuNum", menuName);
	}
	@Override
	public int insertOrderAdd(OrderVO vo) throws SQLException {
		return (int) smc.insert("order.insertOrderAdd", vo);
	}
	@Override
	public int deliveryStatus(DeliveryVO vo) throws SQLException {
		return (int) smc.insert("order.deliveryStatus", vo);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderVO> storeOrderList(int stoNum) throws SQLException {
		return smc.queryForList("order.storeOrderList", stoNum);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<DeliveryVO> orderDeli(int ordNum)
			throws SQLException {
		return smc.queryForList("order.orderDeli", ordNum);
	}
	@Override
	public void deliStatusStore(int ordNum) throws SQLException {
		smc.update("order.deliStatusStore", ordNum);
	}
	@Override
	public void deliStatusUser(int ordNum) throws SQLException {
		smc.update("order.deliStatusUser", ordNum);
	}

}
