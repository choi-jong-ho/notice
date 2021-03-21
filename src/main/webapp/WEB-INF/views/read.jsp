<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>게시글 조회</title>
</head>
<body>
    <h3>게시글 조회</h3>
    <c:set var="noticeno" value="${noticeVO.noticeno }" />
    <c:set var="title" value="${noticeVO.title }" />
    <c:set var="contents" value="${noticeVO.contents }" />
    <c:set var="id" value="${noticeVO.id }" />
    <c:set var="file1" value="${noticeVO.file1 }" />
    <c:set var="u_date" value="${noticeVO.u_date }" />
    <c:set var="c_date" value="${noticeVO.c_date }" />
    <div style="padding : 30px;">
      <div class="form-group">
        <label>제목</label>
        <span>${title}</span>
      </div>
      <div class="form-group">
        <label>작성자</label>
        <span>${id}</span>
      </div>
      <div class="form-group">
        <label>작성일</label>
        <span>"${c_date}"</span>
      </div>
      <div class="form-group">
        <label>최종 수정일</label>
        <span>"${u_date}"</span>
      </div>
      <div class="form-group">
        <label>내용</label>
        <p>${contents}</p>
      </div>
      <div class="form-group">
        <label>파일</label>
        <p>${file1}</p>
      </div>
      <div class="form-group">
          <input type="button" value="수정" onclick='location.href="../update/${noticeno}"'>
          <form action="../delete/${noticeno}" method="post">
            <input type="hidden" name="_method" value="DELETE"/>
              <input type="submit" value="삭제">
          </form>
      </div>
    </div>
</body>
</html>