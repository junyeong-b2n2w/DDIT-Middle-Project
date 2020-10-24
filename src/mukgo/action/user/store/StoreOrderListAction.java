package mukgo.action.user.store;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.event.MenuListener;

import com.google.gson.Gson;

import mukgo.service.user.IMypageService;
import mukgo.service.user.MypageServiceImpl;
import mukgo.service.user.order.IOrderService;
import mukgo.service.user.order.OrderServiceImpl;
import mukgo.vo.DeliveryVO;
import mukgo.vo.MemberVO;
import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;
import mukgo.web.IAction;

public class StoreOrderListAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		IMypageService service = MypageServiceImpl.getConnection();
		IOrderService oService = OrderServiceImpl.getConnection();
		
		// session에서 로그인한 멤버정보 가져오기
		HttpSession session = request.getSession();
		MemberVO memvo = (MemberVO)session.getAttribute("memvo");
		List<OrderVO> list = oService.storeOrderList(memvo.getMem_sto_num());
		Map<Integer, List<DeliveryVO>> param = new HashMap<>();
		for(int i=0; i<list.size(); i++){
			List<DeliveryVO> dList = oService.orderDeli(list.get(i).getOrd_num());
			param.put(list.get(i).getOrd_num(), dList);
		}
		List<DeliveryVO> deliList = new ArrayList<>();
		for(int key : param.keySet()){
			deliList.add(param.get(key).get(0));
		}
		Map<Integer, List<OrderVO>> cntMap = new HashMap<>();
		for(int i=0; i<list.size(); i++){
			List<OrderVO> cntList = new ArrayList<>();
			int chk = list.get(i).getOrd_num();
			for(int j=0;j<list.size();j++){
				if(chk==list.get(j).getOrd_num()){
					cntList.add(list.get(j));
				}
			}
			cntMap.put(chk, cntList);
		}
		List<Integer> priceList = new ArrayList<>();
		List<String> mList = new ArrayList<>();
		for(int cn : cntMap.keySet()){
			List<OrderVO> ll = new ArrayList<>();
			if(cntMap.get(cn).size() > 1){
				int menuCnt = 0;
				int menuPrice = 0;
				for(int i=0; i<cntMap.get(cn).size(); i++){
					MenuVO mVo = service.getMenuInfo(cntMap.get(cn).get(i).getOrd_menu_num());
					menuCnt += cntMap.get(cn).get(i).getOrd_count();
					menuPrice += mVo.getMenu_price() * cntMap.get(cn).get(i).getOrd_count();
				}
				OrderVO oVo = new OrderVO();
				priceList.add(menuPrice);
				MenuVO mVo = service.getMenuInfo(cntMap.get(cn).get(0).getOrd_menu_num());
				mList.add(mVo.getMenu_name());
				oVo.setOrd_count(menuCnt);
				oVo.setOrd_menu_brand_num(cntMap.get(cn).get(0).getOrd_menu_brand_num());
				oVo.setOrd_menu_num(cntMap.get(cn).get(0).getOrd_menu_num());
				oVo.setOrd_num(cntMap.get(cn).get(0).getOrd_num());
				oVo.setOrd_please(cntMap.get(cn).get(0).getOrd_please());
				oVo.setOrd_sto_num(cntMap.get(cn).get(0).getOrd_sto_num());
				oVo.setOrd_date(cntMap.get(cn).get(0).getOrd_date());
				ll.add(oVo);
			}else{
				OrderVO oVo = new OrderVO();
				MenuVO mVo = service.getMenuInfo(cntMap.get(cn).get(0).getOrd_menu_num());
				mList.add(mVo.getMenu_name());
				priceList.add(mVo.getMenu_price()*cntMap.get(cn).get(0).getOrd_count());
				oVo.setOrd_count(cntMap.get(cn).get(0).getOrd_count());
				oVo.setOrd_menu_brand_num(cntMap.get(cn).get(0).getOrd_menu_brand_num());
				oVo.setOrd_menu_num(cntMap.get(cn).get(0).getOrd_menu_num());
				oVo.setOrd_num(cntMap.get(cn).get(0).getOrd_num());
				oVo.setOrd_please(cntMap.get(cn).get(0).getOrd_please());
				oVo.setOrd_sto_num(cntMap.get(cn).get(0).getOrd_sto_num());
				oVo.setOrd_date(cntMap.get(cn).get(0).getOrd_date());
				ll.add(oVo);
			}
			cntMap.put(cn, ll);
		}
		
		// Map에 리스트로 담겼던값 리스트로 빼기
		List<OrderVO> lll = new ArrayList<>();
		for(int cn : cntMap.keySet()){
			lll.add(cntMap.get(cn).get(0));
		}
//		Gson gson = new Gson();
//		String orderList = gson.toJson(lll);
//		String llll = gson.toJson(priceList);
//		String lllll = gson.toJson(mList);
//		System.out.println(orderList);
//		System.out.println(llll);
//		System.out.println(lllll);
		request.setAttribute("orderList", lll);
		request.setAttribute("priceList", priceList);
		request.setAttribute("menuList", mList);
		request.setAttribute("deliList", deliList);
		return "/user/storeOrder.jsp";
	}
	
}
