package mukgo.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IAction {
	// IAction을 Implements한 클래스에서 View(jsp)를 결정하고
	// 해당 View로 redirect할것인지 forward를 할것인지 결정하는 메서드
	public boolean isRedirect();
	
	// IAction을 implements한 클래스의 process()메서드를 호출해서 URI를 기준으로한
	// 요청 처리를 위임하고 View페이지를 반환하는 메서드.
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException;
}
