<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 30%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 15%;"></col>
    </colgroup>
    <%-- table 컬럼 --%>
    <thead>
      <tr>
        <th style='text-align: center;'>번호</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>작성자</th>
        <th style='text-align: center;'>등록일</th>
        <th style='text-align: center;'>수정일</th>
      </tr>
    </thead>
      
    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="noticeVO" items="${list }">
        <c:set var="noticeno" value="${noticeVO.noticeno }" />
        <c:set var="title" value="${noticeVO.title }" />
        <c:set var="id" value="${noticeVO.id }" />
        <c:set var="file1" value="${noticeVO.file1 }" />
        <c:set var="u_date" value="${noticeVO.u_date }" />
        <c:set var="c_date" value="${noticeVO.c_date }" />
        <tr> 
          <td style='vertical-align: middle; text-align: center;'>${noticeno}</td>
          <td style='vertical-align: middle; text-align: center;'><a href="../read/${noticeno}">${title}</a></td>  
          <td style='vertical-align: middle; text-align: center;'>${id}</td> 
          <td style='vertical-align: middle; text-align: center;'>${c_date}</td>
          <td style='vertical-align: middle; text-align: center;'>${u_date}</td>
        </tr>
      </c:forEach>        
    </tbody>
  </table>
    
  <button onclick="location.href='../create'" class="btn btn-info" style="vertical-align: text-top; margin-left: 90%">등록</button>
  
  <DIV class='bottom_menu'>${paging }</DIV>
  <br><br>
 
</body>
</body>
 
</html>

