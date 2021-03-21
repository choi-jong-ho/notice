<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>게시글 수정</title>
 
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head> 
 
<body>
  <h3>게시글 수정</h3>
  <div style="padding : 30px;">
    <form method='POST' action='./${noticeVO.noticeno}'>
      <input type="hidden" name="_method" value="PUT"/>
        <div class="form-group">
          <label>제목</label>
            <input type="text" name="title" id='title' class="form-control" value="${noticeVO.title }">
        </div>
        <div class="form-group">
          <label>내용</label>
          <textarea name="contents" id='contents' class="form-control" rows="5">${noticeVO.contents }
          </textarea>
        </div>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='../list/1'" 
                    class="btn btn-info">취소[목록]</button>
    </form>
  </DIV>
</body>
</html>