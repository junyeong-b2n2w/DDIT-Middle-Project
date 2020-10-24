package mukgo.action.user;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mukgo.service.user.order.IOrderService;
import mukgo.service.user.order.OrderServiceImpl;
import mukgo.vo.AddressVO;
import mukgo.vo.DeliveryVO;
import mukgo.vo.MemberVO;
import mukgo.vo.OrderVO;
import mukgo.web.IAction;


public class OrderOkAction  implements IAction{
	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO memvo = (MemberVO)session.getAttribute("memvo");
		IOrderService service = OrderServiceImpl.getConnection();
		String ord_sto_name = request.getParameter("ord_sto_name");
		String ord_please = request.getParameter("ord_please");
		int ord_sto_brand = Integer.parseInt(request.getParameter("ord_sto_brand"));
		String[] menuName = request.getParameterValues("menuName[]");
		String[] menuCnt = request.getParameterValues("menuCnt[]");
		int jikjeop = Integer.parseInt(request.getParameter("jikjeop")); 
		int ord_addr_num = 0;
		int count = Integer.parseInt(request.getParameter("count"));
		
		
		OrderVO vo = new OrderVO();
		vo.setOrd_mem_num(memvo.getMem_num());
		vo.setOrd_menu_brand_num(ord_sto_brand);
		vo.setOrd_please(ord_please);
		System.out.println(ord_sto_name);
		System.out.println(service.storeNum(ord_sto_name));
		vo.setOrd_sto_num(service.storeNum(ord_sto_name));
		
		if(jikjeop == count){
			System.out.println("직접 테스트");
			String postNum = request.getParameter("upyeon");
			String addrName = request.getParameter("addrName");
			String chamgo = request.getParameter("chamgo");
			String sangse = request.getParameter("sangse");
			String[] juso = request.getParameter("juso").split(" ");
			String sido = juso[0];
			String gugun = juso[1];
			String dong = "";
			for(int i=2; i<juso.length; i++){
				dong += juso[i];
			}
			dong += chamgo;
			AddressVO addrvo = new AddressVO();
			addrvo.setAdd_mem_num(memvo.getMem_num());
			addrvo.setAdd_name(addrName);
			addrvo.setAdd_sido(sido);
			addrvo.setAdd_gungu(gugun);
			addrvo.setAdd_dong(dong);
			addrvo.setAdd_detail(sangse);
			addrvo.setAdd_post_num(postNum);
			ord_addr_num = service.insertAddr(addrvo);
		}else{
			ord_addr_num = Integer.parseInt(request.getParameter("ord_addr_num"));
		}
		
		int orderNum = 0;
		if(menuCnt.length > 1){
			vo.setOrd_count(Integer.parseInt(menuCnt[0]));
			vo.setOrd_menu_num(service.menuNum(menuName[0]));
			orderNum = service.insertOrder(vo);
			for (int i = 1; i < menuCnt.length; i++) {
				vo.setOrd_count(Integer.parseInt(menuCnt[i]));
				vo.setOrd_menu_num(service.menuNum(menuName[i]));
				vo.setOrd_num(orderNum);
				service.insertOrderAdd(vo);
			}
		}else{
			for (int i = 0; i < menuCnt.length; i++) {
				vo.setOrd_count(Integer.parseInt(menuCnt[i]));
				vo.setOrd_menu_num(service.menuNum(menuName[i]));
				orderNum = service.insertOrder(vo);
			}
		}
		DeliveryVO devo = new DeliveryVO();
		devo.setDeli_ord_num(orderNum);
		devo.setDeli_ord_addr_num(ord_addr_num);
		service.deliveryStatus(devo);
		
		return "/cart.do";
	}

}
