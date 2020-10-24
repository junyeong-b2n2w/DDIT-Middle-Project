package mukgo.action.user.store;

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

public class StoreSearchAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 검색 없을시에 기본값
		String sto_name = "";
		double sto_pos_x_max = 999.0;
		double sto_pos_x_min = 0.15;
		double sto_pos_y_max = 999.0;
		double sto_pos_y_min = 0.15;
		List<Integer> dtList = new ArrayList<>();
		dtList.add(1);
		dtList.add(0);
		List<Integer> brandList = new ArrayList<>();
		brandList.add(1);
		brandList.add(2);
		brandList.add(3);
		List<Integer> bdList = new ArrayList<>();
		bdList.add(1);
		bdList.add(0);
		//----------------------------------------------
		
		// 검색값 가져오기
		String name = request.getParameter("sto_name");
		if(name != null || name!="") sto_name = name;
		String posX = "";
		try {
			posX = request.getParameter("sto_pos_x");
			sto_pos_x_max = Double.parseDouble(posX)+0.15;
			sto_pos_x_min = Double.parseDouble(posX)-0.15;
		} catch (Exception e) {
		}
		try {
			String posY = request.getParameter("sto_pos_y");
			sto_pos_y_max = Double.parseDouble(posY)+0.15;
			sto_pos_y_min = Double.parseDouble(posY)-0.15;
		} catch (Exception e) {
		}
		try {
			String[] dt = request.getParameterValues("dt");
			dtList = new ArrayList<>();
			for(String data : dt){
				dtList.add(Integer.parseInt(data));
			}
		} catch (Exception e) {
		}
		try {
			String[] bd = request.getParameterValues("bd");
			bdList = new ArrayList<>();
			for(String data : bd){
				bdList.add(Integer.parseInt(data));
			}
		} catch (Exception e) {
		}
		try {
			String[] brand = request.getParameterValues("brand");
			brandList = new ArrayList<>();
			for(String data : brand){
				brandList.add(Integer.parseInt(data));
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
		param.put("dtList", dtList);
		param.put("brandList", brandList);
		param.put("bdList", bdList);
		List<StoreVO> storeList = service.searchStore(param);
		request.setAttribute("storeList", storeList);
		return "/page/map_search.do";
	}

}
