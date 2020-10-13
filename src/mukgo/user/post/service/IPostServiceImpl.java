package mukgo.user.post.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import mukgo.user.post.dao.IPostDao;
import mukgo.user.post.dao.IPostDaoImpl;
import mukgo.vo.PostVO;

public class IPostServiceImpl implements IPostService{

	// 객체 변수 선언
	private static IPostService service; 
	private IPostDao dao;
	
	public IPostServiceImpl() {
		dao = IPostDaoImpl.getConnection();
	}
	
	public static IPostService getService(){
		if(service == null) service = new IPostServiceImpl();
		return service;
	}
	
	@Override
	public List<PostVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<PostVO> selectByPage(Map<String, Integer> map) {
		List<PostVO> list = null;
		try {
			list = dao.selectByPage(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int postCount() {
		int count = 0;
		try {
			count = dao.postCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int insertPost(PostVO vo) {
		int seq = 0;
		try {
			seq = dao.insertPost(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return seq;
	}

	@Override
	public int updatePost(PostVO vo) {
		int cnt = 0;
		try {
			cnt = dao.updatePost(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deletePostGB(int post_delete_gb) {
		int cnt = 0;
		try {
			cnt = dao.deletePostGB(post_delete_gb);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int parentPostNo(int post_parentpost_num) {
		int cnt = 0;
		try {
			cnt = dao.parentPostNo(post_parentpost_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
}
