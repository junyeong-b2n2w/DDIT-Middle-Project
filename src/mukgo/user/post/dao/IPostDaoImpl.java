package mukgo.user.post.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import mukgo.util.BuildSqlMapClient;
import mukgo.vo.PostVO;

public class IPostDaoImpl implements IPostDao{

	// 객체 선언
	private SqlMapClient client;
	private static IPostDao dao;
	
	public IPostDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient(); 
	}
	
	public static IPostDao getConnection(){
		if(dao == null) dao = new IPostDaoImpl();
		return dao;
	}
	
	@Override
	public List<PostVO> selectAll() {
		List<PostVO> list = null;
		try {
			list = client.queryForList("post.selectAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return list;
	}

	@Override
	public List<PostVO> selectByPage(Map<String, Integer> map)
			throws SQLException {
		return client.queryForList("post.selectByPage", map);
	}

	@Override
	public int postCount() throws SQLException {
		return (Integer)client.queryForObject("post.boardCount");
	}

	@Override
	public int insertPost(PostVO vo) throws SQLException {
		return (Integer)client.insert("post.insertBoard", vo);
	}

	@Override
	public int updatePost(PostVO vo) throws SQLException {
		return client.update("post.updateBoard", vo);
	}

	@Override
	public int deletePostGB(int post_delete_gb) throws SQLException {
		return client.update("post.updateDelete", post_delete_gb);
	}

	@Override
	public int parentPostNo(int post_parentpost_num) throws SQLException {
		return (Integer)client.insert("post.insertParentNo", post_parentpost_num);
	}

}
