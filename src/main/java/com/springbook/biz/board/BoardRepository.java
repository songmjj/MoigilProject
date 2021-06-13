package com.springbook.biz.board;




import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface BoardRepository extends JpaRepository<Board, Integer> {
   
	@Query("SELECT b FROM Board b WHERE b.boardTitle like %?1%")
	public Page<Board> findByBoardtitle(String searchKeyword, Pageable pageable);

	@Query("SELECT b FROM Board b WHERE b.boardContents like %?1%")
	public Page<Board> findByBoardcontent(String searchKeyword, Pageable pageable);

	
	@Query("SELECT b FROM Board b WHERE b.areaCode like %?1% and b.boardTitle like %?2%")
	public Page<Board> findByBoardtitleSeoul(String areaCode, String searchKeyword, Pageable pageable);

	@Query("SELECT b FROM Board b WHERE b.areaCode like %?1% and b.boardContents like %?2%")
	public Page<Board> findByBoardcontentSeoul(String areaCode, String searchKeyword, Pageable pageable);
	
	@Query("SELECT b FROM Board b WHERE b.areaCode like %?1% and b.boardTitle like %?2%")
	public Page<Board> findByBoardtitleGyeonggi(String areaCode, String searchKeyword, Pageable pageable);
	
	@Query("SELECT b FROM Board b WHERE b.areaCode like %?1% and b.boardContents like %?2%")
	public Page<Board> findByBoardcontentGyeonggi(String aCode, String searchKeyword, Pageable pageable);
	
	
	// @Query("SELECT r FROM Reply r WHERE r.boardNo =:boardNo order by r.userReplyNo desc")
	   //ArrayList<Reply> ReplylistDesc(@Param("boardNo")Integer boardNo);
	
	//Page<User> findAllByAccount(Pageable pageable, String account);
	Page<Board> findAllByAreaCode(Pageable pageable, String string);
}
