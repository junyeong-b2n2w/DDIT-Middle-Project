package mukgo.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mukgo.service.user.IJoinService;
import mukgo.service.user.JoinServiceImpl;
import mukgo.vo.AddressVO;
import mukgo.vo.MemberVO;
import mukgo.vo.StoreVO;
import mukgo.web.IAction;

public class JoinInsertStoreAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		IJoinService service = JoinServiceImpl.getInstance();
		
		String id = request.getParameter("mem_id");
		String pw = request.getParameter("mem_pw");
		int type = 2;
		String tel = request.getParameter("mem_tel");
		String reg = request.getParameter("mem_reg_num");
		String email = request.getParameter("mem_email");
		String name = request.getParameter("mem_name");
		
		MemberVO mem = new MemberVO();
		
		mem.setMem_id(id);
		mem.setMem_pw(pw);
		mem.setMem_type_gb(type);	
		mem.setMem_tel(tel);
		mem.setMem_reg_num(reg);
		mem.setMem_email(email);
		mem.setMem_name(name);
		
		int num = service.insertStoreMember(mem);
//		request.setAttribute("insertResult", num);
		
		
		String sto_name = request.getParameter("sto_name");
		String sto_tel = request.getParameter("sto_tel");
		double sto_pos_x = 0;
		double sto_pos_y = 0;
		int sto_brand = Integer.parseInt(request.getParameter("sto_brand"));
		String sto_opentoclose = request.getParameter("sto_opentoclose");
		
		StoreVO store = new StoreVO();
		
		store.setSto_mem_num(num);
		store.setSto_name(sto_name);
		store.setSto_tel(sto_tel);
		store.setSto_pos_x(sto_pos_x);
		store.setSto_pos_y(sto_pos_y);
		store.setSto_brand(sto_brand);
		store.setSto_dt_gb(1);
		store.setSto_delivery_gb(1);
		store.setSto_opentoclose(sto_opentoclose);
		
		int sto_num = service.insertStore(store);
		
		String add_sido = request.getParameter("add_sido");
		String add_gungu = request.getParameter("add_gungu");
		String add_dong = request.getParameter("add_dong");
		String add_detail = request.getParameter("add_detail");
		String add_post_num = request.getParameter("add_post_num");
		
		AddressVO addr = new AddressVO();
		
		addr.setAdd_mem_gb(2);
		addr.setAdd_mem_num(num);
		addr.setAdd_name(request.getParameter("sto_name"));
		addr.setAdd_sido(add_sido);
		addr.setAdd_gungu(add_gungu);
		addr.setAdd_dong(add_dong);
		addr.setAdd_detail(add_detail);
		addr.setAdd_post_num(add_post_num);
		
		int cnt = service.insertStoreAddr(addr);
		request.setAttribute("insertResult", cnt);
		
		MemberVO memStoVo = new MemberVO();
		
		memStoVo.setMem_num(num);
		memStoVo.setMem_sto_num(sto_num);
		
		service.setMemberStore(memStoVo);
		
		return "user/joinInsertStore.jsp";
	}

}
