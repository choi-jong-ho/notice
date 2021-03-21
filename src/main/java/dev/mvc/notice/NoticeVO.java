package dev.mvc.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/*
   noticeno                      NUMBER(10)         NOT NULL    PRIMARY KEY,
   title                           VARCHAR2(100)    NOT NULL,
   id                              VARCHAR2(50)     NOT NULL,
    contents                    VARCHAR2(200)    NOT NULL,
    c_date                           DATE            NOT NULL,
    u_date                           DATE            NULL,
    file1                          VARCHAR2(100)     NULL
    */
public class NoticeVO {
  private int noticeno = 0;
  private String title = "";
  private String id = "";
  private String contents = "";
  private String c_date = "";
  private String u_date = "";
  private String file1 = "";
  
  private List<MultipartFile> file1MF;
  
  public int getNoticeno() {
    return noticeno;
  }
  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  public String getC_date() {
    return c_date;
  }
  public void setC_date(String c_date) {
    this.c_date = c_date;
  }
  public String getU_date() {
    return u_date;
  }
  public void setU_date(String u_date) {
    this.u_date = u_date;
  }
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public List<MultipartFile> getFile1MF() {
    return file1MF;
  }
  public void setFile1MF(List<MultipartFile> file1mf) {
    file1MF = file1mf;
  }

}
