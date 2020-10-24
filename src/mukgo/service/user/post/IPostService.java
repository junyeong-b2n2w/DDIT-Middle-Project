package mukgo.service.user.post;

import java.util.List;
import java.util.Map;

import mukgo.vo.PostVO;

public interface IPostService {
	// 게시판 전체 글 출력
	public List<PostVO> selectAll(PostVO vo);
	
	// 페이지별 리스트
	public List<PostVO> selectByPage(Map<String, Integer> map);
	
	// 전체 글 개수
	public int postCount();
	
	// 글쓰기
	public int insertPost(PostVO vo);
	
	// 글 수정
	public int updatePost(PostVO vo);
	
	// 글 삭제 구분
	public int deletePostGB(PostVO vo);
	
	// 부모게시글 구분
	public int parentPostNo(int post_parentpost_num);
	
	// 답글 작성
	public int insertReply(PostVO vo);
	
	// 글 수정
	public int updateReply(PostVO vo);
}
