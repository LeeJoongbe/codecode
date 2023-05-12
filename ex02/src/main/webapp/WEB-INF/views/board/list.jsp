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
      <a href="/board/get?bno=<c:out value='${board.bno }'/>" style="text-decoration: none;">
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
	        <button type="button" class="btn btn-primary">Save changes</button>
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
			})
			
		});
	
	</script>
	
	<%@ include file="../includes/footer.jsp" %>
</body>
</html>