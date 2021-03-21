package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

public interface NoticeDAOInter {
  
  // 목록
  public List<NoticeVO> list();
  
  // 등록
  public int create(NoticeVO noticeVO);
  
  // 조회
  public NoticeVO read(int noticeno);
  
  // 수정
  public int update(NoticeVO noticeVO);
  
  // 삭제
  public int delete(int noticeno);
  
  // 전체 글 수
  public int search_count();
  
  // 페이징 목록
  public List<NoticeVO> list_page(HashMap<String, Object> map);
}
