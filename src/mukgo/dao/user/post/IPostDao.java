package mukgo.dao.user.post;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import mukgo.vo.PostVO;

public interface IPostDao {
	
	// 전체 글 출력
	public List<PostVO> selectAll(PostVO vo);
		
	// 페이지별 리스트
	public List<PostVO> selectByPage(Map<String, Integer> map) throws SQLException;
		
	// 전체 글 개수
	public int postCount() throws SQLException;
		
	// 글쓰기
	public int insertPost(PostVO vo) throws SQLException;
		
	// 글 수정
	public int updatePost(PostVO vo) throws SQLException;
		
	// 글 삭제 구분
	public int deletePostGB(PostVO vo) throws SQLException;
		
	// 부모게시글 구분
	public int parentPostNo(int post_parentpost_num) throws SQLException;
	
	// 답글 작성
	public int insertReply(PostVO vo) throws SQLException;

	public int updateReply(PostVO vo) throws SQLException;
}
