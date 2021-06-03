<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>


</head>
<body>

	<div>
		<h1>자료실</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./fileBoardInsert.ino">자료실글쓰기</a>
	</div>
	<br>
		<div style="width: 50px; float: left;">글번호</div>	
		<div style="width: 300px; float: left;">제목</div>	
		<div style="width: 150px; float: left;">작성자</div>	
		<div style="width: 150px; float: left;">등록일</div>	
	<hr style="width: 600px">
	<c:forEach items="${fileBoardList }" var="fdto">
			<div style="width: 50px; float: left;">${fdto.seq }</div>	
			<div style="width: 300px; float: left;"><a href="./fileBoardDetail.ino?seq=${fdto.seq }">${fdto.title }</a></div>
			<div style="width: 150px; float: left;">${fdto.name }</div>
			<div style="width: 150px; float: left;"><fmt:formatDate value="${fdto.regdate}" pattern="YYYY/MM/dd" /></div> 
	<hr style="width: 600px">
	</c:forEach>
	<br>
	
	<form action="./listSearch.ino" method="get" style="float: center;" id="searchForm" >
	  		<div>
	    		<select name="searchType" >
					  <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					  <option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>작성자</option>
					   <option value="tn"<c:out value="${scri.searchType eq 'tn' ? 'selected' : ''}"/>>제목+작성자</option>
				</select>
			<input type="text"  name="keyword" id="keywordInput" value="${scri.keyword}" />
	    	<button id="searchBtn" >검색</button>
<script>
 $(function(){
  $('#searchBtn').click(function() {
   self.location = "listSearch"
     + '${pageMaker.makeQuery(1)}'
     + "&searchType="
     + $("select option:selected").val()
     + "&keyword="
     + encodeURIComponent($('#keywordInput').val());
    });
 });   
 </script>
	  		</div>
	  		
	  		</form>

	<div>
                    <c:if test="${pagination.curRange ne 1 }">
                        <a href="#" onClick="fn_paging(1)">[처음]</a> 
                    </c:if>
                    1
                    <c:if test="${pagination.curPage ne 1}">
                        <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
                    </c:if>
                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq  pagination.curPage}">
                                <span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                            </c:when>
                            <c:otherwise>
                                <a href="#" onClick="fn_paging('${pageNum }')"></a> 
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
                    </c:if>
                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
                    </c:if>
                </div>
                
                <div>
                </div>
	
</body>
</html>