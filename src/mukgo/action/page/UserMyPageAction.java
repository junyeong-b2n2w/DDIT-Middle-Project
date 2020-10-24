package mukgo.action.page;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mukgo.service.user.IMypageService;
import mukgo.service.user.MypageServiceImpl;
import mukgo.service.user.address.AddressServiceImpl;
import mukgo.service.user.address.IAddressService;
import mukgo.service.user.order.IOrderService;
import mukgo.service.user.order.OrderServiceImpl;
import mukgo.vo.AddressVO;
import mukgo.vo.DeliveryVO;
import mukgo.vo.MemberVO;
import mukgo.vo.MenuVO;
import mukgo.vo.OrderVO;
import mukgo.web.IAction;

public class UserMyPageAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// service 객체 생성
		IMypageService service = MypageServiceImpl.getConnection();
		
		// session에서 로그인한 멤버정보 가져오기
		HttpSession session = request.getSession();
		MemberVO smemvo = (MemberVO)session.getAttribute("memvo"); 
		String memId = smemvo.getMem_id();
		MemberVO memvo = service.userMypage(memId);
		// 로그인한 멤버 기준으로 주문내역 가져오기
		List<OrderVO> list = service.userRecentOrder(memvo.getMem_num());
		
		// 주문번호별 여러메뉴 저장을 위한 맵생성
		Map<Integer, List<OrderVO>> cntMap = new HashMap<>();
		
		// map에 주문호별 OrderVO가 담긴 리스트 생성 후 map에 넣기
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
		
		// map에서 한 주문번호에 여러 개의 메뉴가 있는경우 정보 하나로 합치기
		List<Integer> priceList = new ArrayList<>();
		System.out.println("==========================================");
		for(int cn : cntMap.keySet()){
			List<OrderVO> ll = new ArrayList<>();
			System.out.println(cn + " : " + cntMap.get(cn));
			if(cntMap.get(cn).size() > 1){
				int menuCnt = 0;
				int menuPrice = 0;
				for(int i=0; i<cntMap.get(cn).size(); i++){
					MenuVO mVo = service.getMenuInfo(cntMap.get(cn).get(i).getOrd_menu_num());
					menuCnt += cntMap.get(cn).get(i).getOrd_count();
					try {
						menuPrice += mVo.getMenu_price() * cntMap.get(cn).get(i).getOrd_count();
					} catch (Exception e) {
					}
				}
				OrderVO oVo = new OrderVO();
				priceList.add(menuPrice);
				oVo.setOrd_count(menuCnt);
				oVo.setOrd_menu_brand_num(cntMap.get(cn).get(0).getOrd_menu_brand_num());
				oVo.setOrd_menu_num(cntMap.get(cn).get(0).getOrd_menu_num());
				oVo.setOrd_num(cntMap.get(cn).get(0).getOrd_num());
				oVo.setOrd_please(cntMap.get(cn).get(0).getOrd_please());
				oVo.setOrd_sto_num(cntMap.get(cn).get(0).getOrd_sto_num());
				oVo.setOrd_date(cntMap.get(cn).get(0).getOrd_date());
//				System.out.println("메뉴 가격 : " + menuPrice + "+++++++++++++++++++++++++++++++++++++++++++");
//				System.out.println("메뉴 개수 : " + menuCnt);
//				System.out.println("브랜드 넘버 : " + cntMap.get(cn).get(0).getOrd_menu_brand_num());
//				System.out.println("메뉴 넘버 : " + cntMap.get(cn).get(0).getOrd_menu_num());
//				System.out.println("주문번호 : " + cntMap.get(cn).get(0).getOrd_num());
//				System.out.println("요청사항 : " + cntMap.get(cn).get(0).getOrd_please());
//				System.out.println("가게 번호 : " + cntMap.get(cn).get(0).getOrd_sto_num() + "+++++++++++++++++++++++++++++++++++++++++++");
				ll.add(oVo);
			}else{
				OrderVO oVo = new OrderVO();
				MenuVO mVo = service.getMenuInfo(cntMap.get(cn).get(0).getOrd_menu_num());
				try {
					priceList.add(mVo.getMenu_price()*cntMap.get(cn).get(0).getOrd_count());
				} catch (Exception e) {
					
				}
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
			System.out.println(cntMap.get(cn).get(0).getOrd_date() + "---------------------------");
			lll.add(cntMap.get(cn).get(0));
		}
		
		
		// 로그인한 멤버 개인정보 가져오기
		MemberVO myvo = service.userMypage(memvo.getMem_id());
		
		
		List<String> stoNames = new ArrayList<>();
		List<MenuVO> menuInfos = new ArrayList<>();
		List<Integer> revChk = new ArrayList<>();
		for(OrderVO vo : lll){
			vo.setOrd_mem_num(memvo.getMem_num());
			stoNames.add(service.getStoreName(vo.getOrd_sto_num()));
			revChk.add(service.reviewCheck(vo));
			menuInfos.add(service.getMenuInfo(vo.getOrd_menu_num()));
		}
		
		
		// 주소 가져오기위한 service 객체생성
		IAddressService addService = AddressServiceImpl.getConnection();
		
		// 로그인한 멤버의 주소 리스트 가져오기
		List<AddressVO> addList = addService.addressList(memvo.getMem_id());
		
		for(int i=0; i<lll.size();i++){
			System.out.println(lll.get(i) + "---------------------------------------------");
		}
		
		
		
		
		Map<Integer, List<DeliveryVO>> param = new HashMap<>();
		IOrderService oService = OrderServiceImpl.getConnection();
		for(int i=0; i<list.size(); i++){
			List<DeliveryVO> dList = oService.orderDeli(list.get(i).getOrd_num());
			param.put(list.get(i).getOrd_num(), dList);
		}
		List<DeliveryVO> deliList = new ArrayList<>();
		for(int key : param.keySet()){
			deliList.add(param.get(key).get(0));
		}
		request.setAttribute("addList", addList);
		request.setAttribute("orderList", lll);
		request.setAttribute("stoNameList", stoNames);
		request.setAttribute("menuList", menuInfos);
		request.setAttribute("revChk", revChk);
		request.setAttribute("userInfo", myvo);
		request.setAttribute("memvo", memvo);
		request.setAttribute("priceList", priceList);
		request.setAttribute("deliList", deliList);
		return "/page/userMypage.jsp";
	}

}
