package dev.mvc.notice;

import java.util.List;

public interface NoticeProcInter {
  
  // 목록
  public List<NoticeVO> list();
  
  // 조회
  public List<NoticeVO> read(int noticeno);
  
}
