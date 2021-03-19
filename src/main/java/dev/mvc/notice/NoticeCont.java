package dev.mvc.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;


import java.util.List;
 
@RestController
public class NoticeCont {
    @Autowired
    private NoticeProc noticeProc;
    
    public NoticeCont() {
      System.out.println("created");
    }
 
    // 목록
    @GetMapping("list")
    public List<NoticeVO> list() {
      List<NoticeVO> list = noticeProc.list();
      return list;
    }
    
    // 조회
    @GetMapping("read/{noticeno}")
    public List<NoticeVO> read(@PathVariable int noticeno) {
      List<NoticeVO> list = noticeProc.read(noticeno);
      return list;
    }


}

