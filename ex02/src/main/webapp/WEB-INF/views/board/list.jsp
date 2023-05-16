<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- <div class="container"> --> <!--이거 전체 묶음  -->
<div class="container-fluid">
	<h1>List Page</h1>
	<button type="button" onclick="location.href='/board/register'" class="btn btn-primary">글쓰기</button>	
	<button type="button" class="btn btn-primary" id="regBtn">글쓰기 javascript</button>
	
	<table class="table table-hover">
	
  <thead>
    <tr>
      <th scope="col">#번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
      <th scope="col">수정일</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach items="${list }" var="board">
   	<tr>
      <td>
      <c:out value="${board.bno }"></c:out>
      </td>
      <td>
      	<a class="move" href="<c:out value='${board.bno }'/>" style="text-decoration: none;">
      		<c:out value="${board.title}"></c:out>
      	</a>
      </td>
      <td>
      <c:out value="${board.writer}"></c:out>
      </td>
      <td>
      	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/>
      </td>
      <td>
      	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/>
      </td>
    </tr>
   </c:forEach>
    
    
  </tbody>
</table>

<!--Pagination  -->
	<div> 
	  <ul class="pagination">
	  	
	  	<c:if test = "${pageMaker.prev}">
	  		<li class="page-item disabled">
	      		<a class="page-link" href="${pageMaker.startPage -1 }">Previous</a>
	    	</li>
	  	</c:if>
	  
	  	<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	  		<li class="page-item  ${pageMaker.cri.pageNum == num ? 'active' : "" }">
		      <a class="page-link"  href="${num}">${num}</a>
		    </li>
	  	</c:forEach>
	  
	  
	  	<c:if test = "${pageMaker.next}">
	  		<li class="page-item disabled">
	      		<a class="page-link" href="${pageMaker.endPage +1}">Next</a>
	    	</li>
	  	</c:if>
	  
	    
	  </ul>
	</div>
	
	<div>
  <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link" href="#">&laquo;</a>
    </li>
    <li class="page-item active">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">4</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">5</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
    </li>
  </ul>
</div>

	<form id='actionForm' action="/board/list" method="get">
		<input type="text" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="text" name="amount" value="${pageMaker.cri.amount}">
	
	</form>

	


	<div class="modal" id="myModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">처리 유무</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true"></span>
	        </button>
	      </div>
	      <div class="modal-body">
	        처리가 완료되었습니다.
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">그냥 있는 버튼</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			var result = '<c:out value ="${result}" />';
			
			checkModal(result);
			
			function checkModal(result){
				if(result === '' || history.state) {
					return;
				}
				
				if(parseInt(result) > 0){
					$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
				}
				
				$(".modal").modal("show");
			}
			
			$("#regBtn").on("click", function() {
				self.location = "/board/register";
			});
			
			var  actionForm = $("#actionForm");
			
			$(".page-item a").on("click", function(e){
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			
			 $(".move").on("click", function(a) {
				
				a.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"+
						$(this).attr("href")+"'>");
				actionForm.attr("action", "/board/get");
				actionForm.submit();
				
			}) 
			
		});
	
	</script>
	
	<%@ include file="../includes/footer.jsp" %>
	</div>
	<!-- </div> --><!--전체 묶음 div end  -->
	
</body>
</html>