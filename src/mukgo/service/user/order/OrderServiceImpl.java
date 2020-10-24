package mukgo.service.user.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mukgo.dao.user.order.IOrderDao;
import mukgo.dao.user.order.OrderDaoImpl;
import mukgo.vo.AddressVO;
import mukgo.vo.DeliveryVO;
import mukgo.vo.OrderVO;

public class OrderServiceImpl implements IOrderService{
	private IOrderDao dao;
	private static IOrderService service;
	private OrderServiceImpl(){
		dao = OrderDaoImpl.getConnection();
	}
	public static IOrderService getConnection(){
		if(service==null) service = new OrderServiceImpl();
		return service;
	}
	@Override
	public int insertOrder(OrderVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertOrder(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int insertAddr(AddressVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertAddr(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int storeNum(String stoName) {
		int cnt = 0;
		try {
			cnt = dao.storeNum(stoName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int menuNum(String menuName) {
		int cnt = 0;
		try {
			cnt = dao.menuNum(menuName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int insertOrderAdd(OrderVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertOrderAdd(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int deliveryStatus(DeliveryVO vo) {
		int cnt = 0;
		try {
			cnt = dao.deliveryStatus(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<OrderVO> storeOrderList(int stoNum) {
		List<OrderVO> list = new ArrayList<>();
		try {
			list = dao.storeOrderList(stoNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<DeliveryVO> orderDeli(int ordNum) {
		List<DeliveryVO> list = new ArrayList<>();
		try {
			list = dao.orderDeli(ordNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public void deliStatusStore(int ordNum) {
		try {
			dao.deliStatusStore(ordNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void deliStatusUser(int ordNum) {
		try {
			dao.deliStatusUser(ordNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
