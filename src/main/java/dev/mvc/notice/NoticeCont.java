package dev.mvc.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
 
@Controller
public class NoticeCont {
    @Autowired
    private NoticeProc noticeProc;
    
    // 컨트롤러 실행 여부 표시create.jsp
    public NoticeCont() {
      System.out.println("created");
    }

    
    // 등록 폼
    @GetMapping("/create")
    public ModelAndView create_form() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("create");
      return mav;
    }
     
    // 등록 
    @PostMapping("/create")
    public String create(@ModelAttribute("NoticeVO") NoticeVO noticeVO, HttpServletRequest request) {
      long fsize = 0; // 파일 사이즈
      String file1 = "";

      String upDir = Tool.getRealPath(request, "/storage");
      List<MultipartFile> file1MF = noticeVO.getFile1MF();

      int count = file1MF.size(); // 전송 파일 갯수
      if (count > 0) {
        for (MultipartFile multipartFile : file1MF) { // 파일 추출, 1개이상 파일 처리
          fsize = multipartFile.getSize(); // 파일 크기
          if (fsize > 0) { // 파일 크기 체크
            file1 = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장, 업로드된 파일명
          }
          noticeVO.setFile1(file1);
        }
      }
      noticeProc.create(noticeVO);
      return "redirect:./list/1";
    }
    
    // 조회
    @GetMapping("/read/{noticeno}")
    public ModelAndView read(@PathVariable("noticeno") int noticeno) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("read");
      
      NoticeVO noticeVO = noticeProc.read(noticeno);
      mav.addObject("noticeVO", noticeVO);
      
      return mav;
    }
    
    // 수정 폼
    @GetMapping("/update/{noticeno}")
    public ModelAndView update_form(@PathVariable int noticeno) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("update");
      
      NoticeVO noticeVO = noticeProc.read(noticeno);
      mav.addObject("noticeVO", noticeVO);
      return mav;
    }
    
    // 수정 
    @PutMapping("/update/{noticeno}")
    public String update(@ModelAttribute("NoticeVO") NoticeVO noticeVO, @PathVariable int noticeno) {
      noticeProc.update(noticeVO);
      return "redirect:../list/1";
    }
    
    // 삭제
    @DeleteMapping("/delete/{noticeno}")
    public String delete( @PathVariable int noticeno) {
      noticeProc.delete(noticeno);
      return "redirect:../list/1";
    }
    
    // 목록
    @GetMapping("/list/{nowPage}")
    public ModelAndView list(@PathVariable("nowPage") int nowPage) {
      ModelAndView mav = new ModelAndView();
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("nowPage", nowPage);
      
      List<NoticeVO> list = noticeProc.list_page(map);
      mav.addObject("list", list);
      
      int count = noticeProc.search_count();
      mav.addObject("count", count);
      
      String paging = noticeProc.pagingBox("../list", count, nowPage);
      mav.addObject("paging", paging);
      mav.addObject("nowPage", nowPage);
      
      mav.setViewName("list");
      return mav;
    }


}

