<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
</head>
<body>

	<div>
		<h1>자유게시판</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./freeBoardInsert.ino">글쓰기</a>
	</div>
	<br>
		<div style="width: 50px; float: left;">글번호</div>	
		<div style="width: 300px; float: left;">제목</div>	
		<div style="width: 150px; float: left;">작성자</div>	
		<div style="width: 150px; float: left;">등록일</div>	
	<hr style="width: 600px">
	<c:forEach items="${freeBoardList }" var="dto">
			<div style="width: 50px; float: left;">${dto.num }</div>	
			<div style="width: 300px; float: left;"><a href="./freeBoardDetail.ino?num=${dto.num }">${dto.title }</a></div>
			<div style="width: 150px; float: left;">${dto.name }</div>
			<div style="width: 150px; float: left;">${dto.regdate }</div> 
			
	<hr style="width: 600px">
	</c:forEach>
	<br>
<form action="./listSearch.ino" method="get" style="float: center;" id="searchForm" >
	  		<div class = "form-group" >
	    		<select id="searchType" class="form-control" name="searchType" >
					  <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					  <option value="w"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>작성자</option>
					   <option value="tw"<c:out value="${scri.searchType eq 'tn' ? 'selected' : ''}"/>>제목+작성자</option>
				</select>
			<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
			<button id="searchBtn">검색</button>
			<script>
				$(function() {
					$('#searchBtn').click(
							function() {
								location.href = "./listSearch.ino"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());
							});
				});
			</script>
		</div>
	  
		</form>
	
		<!--  <form style="float: center;">
			${pageResult }
		</form>-->
	<div>

  <c:if test="${pageMaker.prev}">
  <a href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
  </c:if> 
  
  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
 <a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
  </c:forEach>
    
  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
  <a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
  </c:if> 

</div>
                
	<div>
    </div>
	<!-- 표시 -->
</body>
</html>