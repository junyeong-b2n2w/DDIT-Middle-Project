package mukgo.user.post.service;

import java.util.List;
import java.util.Map;

import mukgo.vo.PostVO;

public interface IPostService {
	// 전체 글 출력
	public List<PostVO> selectAll();
	
	// 페이지별 리스트
	public List<PostVO> selectByPage(Map<String, Integer> map);
	
	// 전체 글 개수
	public int postCount();
	
	// 글쓰기
	public int insertPost(PostVO vo);
	
	// 글 수정
	public int updatePost(PostVO vo);
	
	// 글 삭제 구분
	public int deletePostGB(int post_delete_gb);
	
	// 부모게시글 구분
	public int parentPostNo(int post_parentpost_num);
}
