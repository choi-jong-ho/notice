package dev.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component("dev.mvc.notice.NoticeProc")
public class NoticeProc implements NoticeProcInter {
  @Autowired
  NoticeDAOInter noticeDAO;
  
  @Override
  public List<NoticeVO> list(){
    List<NoticeVO> list = noticeDAO.list();
    return list;
  }

  @Override
  public List<NoticeVO> read(int noticeno) {
    List<NoticeVO> list = noticeDAO.read(noticeno);
    return list;
  }
}
