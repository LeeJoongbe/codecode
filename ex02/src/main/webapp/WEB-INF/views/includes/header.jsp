<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    


<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">DOoooo</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01" style="">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/board/list">Board</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
          </div>
        </li>
      </ul>
      <form class="d-flex" id='searchForm' action="/board/list" method='get'>
      	    <div class="form-group">
		      
		      <select name="type" class="form-select" id="exampleSelect1">
		        <option value=""
		        	<c:out value="${pageMaker.cri.type == null?'selected':'' }" />
		        >--</option>
		        <option value="T"
		        	<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }" />
		        >제목</option>
		        <option value="C"
		        	<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }" />
		        >내용</option>
		        <option value="W"
		        	<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }" />
		        >작성자</option>
		        <option value="TC"
		        	<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }" />
		        >제목 or 내용</option>
		        <option value="TW"
		        	<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }" />
		        >제목 or 작성자</option>
		        <option value="TWC"
		        	<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':'' }" />
		        >제목 or 내용 or 작성자</option>
		      </select>
		    </div>
      
         <input name="keyword" class="form-control me-sm-2" type="search" placeholder="Search" 
        	value="<c:out value="${pageMaker.cri.keyword}" />"
        >
        <input type="hidden" name="pageNum" value="<c:out value="${pageMaker.cri.pageNum }"/>">
        <input type="hidden" name="amount" value="<c:out value="${pageMaker.cri.amount }"/>">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>


<div class="container">

		<script type="text/javascript">
		$(document).ready(function() {
			var searchForm = $("#searchForm");
			$("#searchForm button").on("click", function(e){
				
				if(!searchForm.find("option:selected").val()){
					alert("검색종류를 선택하세요");
					return false;
				}
				if(!searchForm.find("input[name='keyword']").val()){
					alert("키워드를 입력하세요");
					return false;
				}
				
				searchForm.find("input[name='pageNum']").val("1");
				searchForm.find("input[name='amount']").val("10");
				e.preventDefault();
				
				searchForm.submit();
				
			});
			
			
		});
		
		</script>
</body>
</html>