<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%@ include file="../includes/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
</head>
<body>
	
	<form action="/board/register" method="post" role="form">
  <fieldset>
    <legend>게시물 등록</legend>
    
    <div class="form-group row"> <!--작성자  -->
      <label for="staticEmail" class="col-sm-2 col-form-label">작성자</label>
      <div class="col-sm-10">
        <input type="text"  class="form-control-plaintext" name="writer" id="staticEmail" placeholder="작성자 이름을 입력하세요">
      </div>
    </div>
    
    <div class="form-group"> <!--제목  -->
      <label for="exampleInputEmail1" class="form-label mt-4">글 제목</label>
      <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="내용을 입력하세요">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    

    <div class="form-group"><!--내용  -->
      <label for="exampleTextarea" class="form-label mt-4">글 내용</label>
      <textarea class="form-control" name="content" id="exampleTextarea" rows="3"></textarea>
    </div>
   <br>
   <br>
   <div>
   	
   	<button type="submit" class="btn btn-primary">Submit</button>
   	<button type="reset" class="btn btn-secondary">Reset</button>
   	<button type="button" class="btn btn-secondary"
   	onclick="location.href='/board/list'"
   	>List</button>
   </div>
   
    
  </fieldset>
</form>

<%@ include file="../includes/footer.jsp" %>
</body>
</html>