package dev.mvc.notice;

import java.util.List;

public interface NoticeProcInter {
  
  // ���
  public List<NoticeVO> list();
  
  // ��ȸ
  public List<NoticeVO> read(int noticeno);
  
}
