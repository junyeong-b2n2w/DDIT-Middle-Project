package mukgo.action.page;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.store.IStoreService;
import mukgo.service.user.store.StoreServiceImpl;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class MapSearchPageAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 검색 없을시에 기본값
		request.setCharacterEncoding("utf-8");
		String sto_name = "";
		double sto_pos_x_max = 999.0;
		double sto_pos_x_min = 0.15;
		double sto_pos_y_max = 999.0;
		double sto_pos_y_min = 0.15;
		List<Integer> brandList = new ArrayList<>();
		brandList.add(1);
		brandList.add(2);
		brandList.add(3);
		brandList.add(4);
		brandList.add(5);
		//----------------------------------------------
		
		// 검색값 가져오기
		String name = request.getParameter("sto_name");
		System.out.println(name);
		if(name != null || name!="") sto_name = name;
		try {
			String posX = request.getParameter("sto_pos_x");
			sto_pos_x_max = Double.parseDouble(posX)+0.015;
			sto_pos_x_min = Double.parseDouble(posX)-0.015;
			System.out.println(posX);
		} catch (Exception e) {
		}
		try {
			String posY = request.getParameter("sto_pos_y");
			sto_pos_y_max = Double.parseDouble(posY)+0.015;
			sto_pos_y_min = Double.parseDouble(posY)-0.015;
			System.out.println(posY);
		} catch (Exception e) {
		}
		String dt = request.getParameter("dt");
		String bd = request.getParameter("bd");
		System.out.println(dt + "   " + bd);
		try {
			String[] brand = request.getParameterValues("brand");
			brandList = new ArrayList<>();
			for(String data : brand){
				brandList.add(Integer.parseInt(data));
				System.out.println(data);
			}
		} catch (Exception e) {
		}
		// 값 넣어서 서비스객체에 전송 결과값 전달
		IStoreService service = StoreServiceImpl.getConnection();
		Map<String, Object> param = new HashMap<>();
		param.put("sto_name", sto_name);
		param.put("sto_pos_x_max", sto_pos_x_max);
		param.put("sto_pos_y_max", sto_pos_y_max);
		param.put("sto_pos_x_min", sto_pos_x_min);
		param.put("sto_pos_y_min", sto_pos_y_min);
		param.put("dt", dt);
		param.put("brandList", brandList);
		param.put("bd", bd);
		List<StoreVO> storeList = service.searchStore(param);
		List<String> brandImg = new ArrayList<>();
		List<String> stoStar = new ArrayList<>();
		String imgPath = "/NullJAVA/asset/i/";
		for(StoreVO vo : storeList){
			switch (vo.getSto_brand()) {
			case 1: 
				brandImg.add(imgPath + "macdonald.png");
				break;
			case 2: 
				brandImg.add(imgPath + "lotteria.jpg");
				break;
			case 3:
				brandImg.add(imgPath + "burger_king.png");
				break;
			case 4: 
				brandImg.add(imgPath + "momstouch.jpg");
				break;
			case 5: 
				brandImg.add(imgPath + "hamburger.png");
				break;
			}
			String star = service.storeStar(vo.getSto_num());
			stoStar.add(star);
		}
		request.setAttribute("storeList", storeList);
		request.setAttribute("starList", stoStar);
		request.setAttribute("imgList", brandImg);
		return "/user/storeSearchList.jsp";
	}

}
