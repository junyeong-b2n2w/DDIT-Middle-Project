package mukgo.dao.user.post;

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
	public List<PostVO> selectAll(PostVO vo) {
		List<PostVO> list = null;
		try {
			list = client.queryForList("post.selectAll", vo);
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
		return (Integer)client.queryForObject("post.postCount");
	}

	@Override
	public int insertPost(PostVO vo) throws SQLException {
		return (Integer)client.insert("post.insertPost", vo);
	}

	@Override
	public int updatePost(PostVO vo) throws SQLException {
		return client.update("post.updatePost", vo);
	}

	@Override
	public int deletePostGB(PostVO vo) throws SQLException {
		return client.update("post.updateDelete", vo);
	}

	@Override
	public int parentPostNo(int post_parentpost_num) throws SQLException {
		return (Integer)client.insert("post.insertParentNo", post_parentpost_num);
	}

	@Override
	public int insertReply(PostVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)client.insert("post.insertReply", vo);
	}

	@Override
	public int updateReply(PostVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)client.insert("post.updateReply", vo);
	}

}
