<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

function confirm_event() {
	if(confirm("글쓰기를 취소 하시겠습니까?") == true) {
		location.href="/mavenBoard/filemain.ino";
	}else {
		return;
	}
}

</script>
</head>
<body>
	<div>
		<h1>자유게시판</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./filemain.ino">자료실 리스트로</a>
	</div>
	<hr style="width: 600px">
	<form action="./fileBoardInsertPro.ino" method="post" enctype="multipart/form-data">
		<div style="width: 100px; float: left;">이름 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name"/></div><br>
		
		<div style="width: 100px; float: left;">제목 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title"/></div><br>
	
		<div style="width: 100px; float: left;">내용 :</div>
		<div style="width: 500px; float: left;" align="left"><textarea name="content" rows="25" cols="65"  ></textarea></div><br>
		
		<div style="width: 100px; float: left;">파일 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="file" name="file" accept="image/*" /></div><br>
		
		<div align="right">
		<input type="submit" value="글쓰기">
		<input type="reset" value="다시쓰기" onclick="">
		<input type="button" value="취소" onclick="confirm_event();">
		&nbsp;&nbsp;&nbsp; 
		</div>
	
	</form>
	
	
	
</body>
</html>