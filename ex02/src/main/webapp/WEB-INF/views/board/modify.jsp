<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%@ include file="../includes/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 수정</title>
</head>
<body>
	
	<form action="/board/modify" method="post" role="form">
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"></c:out>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"></c:out>'>
  
  
  <fieldset>
    <legend>게시물 수정페이지</legend>
    
    
    <span class="badge bg-light">
    <c:out value="글번호 :   ${board.bno }"></c:out>
    </span> <!--글번호  -->
    <input class="form-control" type="hidden" name="bno" value="${board.bno }">
    
    
    <div class="form-group row"> <!--작성자  -->
      <label for="staticEmail" class="col-sm-2 col-form-label">작성자</label>
      <div class="col-sm-10">
        <input type="text"  class="form-control-plaintext" id="staticEmail" 
        name="writer" value='<c:out value="${board.writer}"></c:out>'
         readonly="readonly">
      </div>
    </div>
    
    <div class="form-group"> <!--제목  -->
      <label for="exampleInputEmail1" class="form-label mt-4">글 제목</label>
      <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
      value='<c:out value="${board.title }" />'>
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    

    <div class="form-group"><!--내용  -->
      <label for="exampleTextarea" class="form-label mt-4">글 내용</label>
      <textarea class="form-control" name="content" id="exampleTextarea" rows="3" ><c:out value="${board.content }"></c:out></textarea>
    </div>
   <br>
   <br>
	
	<div class="form-group">
		<label>RegDate</label>
		<input class="form-control" name="regDate" 
		value='<fmt:formatDate pattern ="yyyy/MM/dd" value = "${board.regdate }"/>' readonly="readonly" >
	
	</div>
	
	<div class="form-group">
		<label>Update Date</label>
		<input class="form-control"  
		value='<fmt:formatDate pattern ="yyyy/MM/dd" value = "${board.updateDate}"/>' readonly="readonly" >
	
	</div>



   <div>
   	
   	<button type="button" data-oper='modify' class="btn btn-primary" >modify</button>
   	<button type="button" data-oper='remove' class="btn btn-danger">Remove</button>
   	<button type="button" data-oper='list' class="btn btn-secondary">List</button>
   
   
   </div>
   
  </fieldset>
</form>

<script type="text/javascript">
	$(document).ready(function(){
	
		var formObj = $("form");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove'){
				
				formObj.attr("action", "/board/remove");
				
			}else if(operation === 'list'){
				
				formObj.attr("action", "/board/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				
			}
			formObj.submit();
		});
	});
	
</script>



<%@ include file="../includes/footer.jsp" %>
</body>
</html>