<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

function button_u() {
	document.detail.action = "";
}
function button_d(seq) {
	
}
function button_c() {
	document.detail.action = "./main.ino";
}
function buttin_fd() {
	document.detail.action = "";
}

</script>
</head>
<body>

	<div>
		<h1>�ڷ�ǰԽ���</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./filemain.ino">�ڷ�� ����Ʈ��</a>
	</div>
	<hr style="width: 600px">
	
	<!-- <form action="./freeBoardInsertPro.ino">  -->
	<form name="detail" method="post">
		<div style="width: 100px; float: left;">�̸� :</div>
		<div style="width: 500px; float: left;" align="left">
		<input type="text" name="name" id="name" value="${freeBoardFileDto.name }" /></div><br>
		
		<div style="width: 100px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left">
		<input type="text" name="title"  value="${freeBoardFileDto.title }" readonly/></div><br>
		
		<div style="width: 100px; float: left;">�ۼ�����</div>
		<div style="width: 500px; float: left;" align="left">
		<input type="text" name="regdate"  value="${freeBoardFileDto.regdate }" readonly/></div><br>
		
		<div style="width: 100px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left">
		<textarea name="content" rows="25" id="content" cols="65"  >${freeBoardFileDto.content }</textarea></div><br>
		
		<div style="width: 100px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left">
		<input type="text" name="files[0]" id="files[0]" value="${freeBoardFileDto.boardimageName }" readonly/><input type="submit" value="����" onclick="button_fd();"></div>
		<br>
		
		<input type="hidden" id="seq" name="seq" value="${freeBoardFileDto.seq}"/>
		
		<div align="right">
		<%-- <input type="button" value="����" onclick = "location.href = './freeBoardModify.ino?num=${freeBoardDto.num }'"> --%>
		<!-- <input type="button" value="����" onclick="button_m();"> -->
		<input type="submit" value="���" onclick="button_c();">
		&nbsp;&nbsp;&nbsp;
		</div>
	</form>
	
	
	
</body>
</html>
