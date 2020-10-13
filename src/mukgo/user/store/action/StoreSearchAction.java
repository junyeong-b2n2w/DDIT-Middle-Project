package mukgo.user.store.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mukgo.user.store.service.IStoreService;
import mukgo.user.store.service.StoreServiceImpl;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class StoreSearchAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
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
		//----------------------------------------------
		
		// 검색값 가져오기
		String name = request.getParameter("sto_name");
		if(name != null) sto_name = name;
		String posX = request.getParameter("sto_pos_x");
		if(posX != null ) {
			sto_pos_x_max = new Double(posX)+0.15;
			sto_pos_x_min = new Double(posX)-0.15;
		}
		String posY = request.getParameter("sto_pos_y");
		if(posY != null ) {
			sto_pos_y_max = new Double(posY)+0.15;
			sto_pos_y_min = new Double(posY)-0.15;
		}
		String dt = request.getParameter("dt");
		if(dt != null){
			dtList = new ArrayList<>();
			dtList.add(Integer.parseInt(dt));
		} 
		String brand = request.getParameter("brand");
		if(brand != null){
			brandList = new ArrayList<>();
			brandList.add(Integer.parseInt(brand));
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
		List<StoreVO> storeList = service.searchStore(param);
		Gson gson = new Gson();
		String jsonList = gson.toJson(storeList);
		request.setAttribute("storeList", jsonList);
		return "/user/storeSearch.jsp";
	}

}
