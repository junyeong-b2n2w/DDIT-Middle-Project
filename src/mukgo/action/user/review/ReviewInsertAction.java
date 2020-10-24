package mukgo.action.user.review;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mukgo.service.user.review.IReviewService;
import mukgo.service.user.review.ReviewServiceImpl;
import mukgo.vo.MemberVO;
import mukgo.vo.ReviewImageVO;
import mukgo.vo.ReviewVO;
import mukgo.web.IAction;

public class ReviewInsertAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String path = "D:/A_TeachingMaterial/4.MiddleProject/workspace/NullJAVA/WebContent/asset/img";
		int size = 1024*1024*20;
		String content = "";
		String star = "";
		String ordNum="";
		String fileName1 = "";
		String fileName2 = "";
		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			
			star = multi.getParameter("star");
			content = multi.getParameter("content");
			ordNum = multi.getParameter("ord_num");
			fileName1 = multi.getFilesystemName("file1");
			
			System.out.println(fileName1);
			fileName2 = multi.getFilesystemName("file2");

			IReviewService service = ReviewServiceImpl.getConnection();
			
			ReviewVO vo = new ReviewVO();
			HttpSession session = request.getSession();
			MemberVO memvo = (MemberVO)session.getAttribute("memvo");
			vo.setRev_mem_num(memvo.getMem_num());
			vo.setRev_ord_num(Integer.parseInt(ordNum));
			vo.setRev_star(Integer.parseInt(star));
			vo.setRev_content(content);
			service.insertNewReview(vo);
			
			ReviewImageVO ivo = new ReviewImageVO();
			if(fileName1!=null){
				ivo.setRev_img_path(path);
				ivo.setRev_img_name(fileName1);
				service.insertReviewImage(ivo);
			}
			if(fileName2!=null){
				ivo.setRev_img_path(path);
				ivo.setRev_img_name(fileName2);
				service.insertReviewImage(ivo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/page/userMypage.do";
	}

}
