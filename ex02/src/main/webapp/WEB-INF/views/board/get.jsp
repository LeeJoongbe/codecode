<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%@ include file="../includes/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이지</title>
</head>
<body>
	

  <fieldset>
    <legend>게시물 상세페이지</legend>
    
    
    <span class="badge bg-light">
    <c:out value="글번호 :   ${board.bno }"></c:out>
    </span> <!--글번호  -->
    
    <div class="form-group row"> <!--작성자  -->
      <label for="staticEmail" class="col-sm-2 col-form-label">작성자</label>
      <div class="col-sm-10">
        <input type="text"  class="form-control-plaintext" id="staticEmail" 
        value='<c:out value="${board.writer}"></c:out>'
         readonly="readonly">
      </div>
    </div>
    
    <div class="form-group"> <!--제목  -->
      <label for="exampleInputEmail1" class="form-label mt-4">글 제목</label>
      <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
      value='<c:out value="${board.title }" />'
       readonly="readonly">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    

    <div class="form-group"><!--내용  -->
      <label for="exampleTextarea" class="form-label mt-4">글 내용</label>
      <textarea class="form-control" name="content" id="exampleTextarea" rows="3" 
      readonly="readonly"><c:out value="${board.content }"></c:out></textarea>
    </div>
   <br>
   <br>
   <div>
   	
   	<button data-oper='modify' class="btn btn-primary" 
   	onclick="location.href='/board/modify?bno=<c:out value="${board.bno }" />'">
   	modify</button>
   	<button data-oper='list' class="btn btn-secondary"
   	onclick="location.href='/board/list'"
   	>List</button>
   </div>
   
   
   
    
  </fieldset>


 	<form id='operForm' action="/board/modify" method="get">
 	 <input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'>
 	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"></c:out>'>
 	<input type="hidden" name="amount" value='<c:out value="${cri.amount}"></c:out>'>
 	</form>

	<script type="text/javascript">
		$(document).ready(function() {
			var operForm= $("#operForm");
			
			$("button[data-oper = 'modify']").on("click", function(e){
				
				operForm.attr("action", "/board/modify").submit();
				
			});
			
			$("button[data-oper = 'list']").on("click", function(e){
				operForm.find('#bno').remove();
				operForm.attr('action', "/board/list")
				operForm.submit();
			});
			
		});
	
	</script>



<%@ include file="../includes/footer.jsp" %>
</body>
</html>