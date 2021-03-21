package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

public interface NoticeDAOInter {
  
  // ���
  public List<NoticeVO> list();
  
  // ���
  public int create(NoticeVO noticeVO);
  
  // ��ȸ
  public NoticeVO read(int noticeno);
  
  // ����
  public int update(NoticeVO noticeVO);
  
  // ����
  public int delete(int noticeno);
  
  // ��ü �� ��
  public int search_count();
  
  // ����¡ ���
  public List<NoticeVO> list_page(HashMap<String, Object> map);
}
