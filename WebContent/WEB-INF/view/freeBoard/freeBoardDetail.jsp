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
	document.detail.action = "./freeBoardModifyPro.ino";
}
function button_d(num) {
	if(confirm("�����Ͻðڽ��ϱ�?")==true) {
		document.detail.action = "./freeBoardDeletePro.ino";
	}else { return; 
	}
}
function button_c() {
	document.detail.action = "./main.ino";
}

</script>
</head>
<body>

	<div>
		<h1>�����Խ���</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.ino">����Ʈ��</a>
	</div>
	<hr style="width: 600px">
	
	<!-- <form action="./freeBoardInsertPro.ino">  -->
	<form name="detail" method="post">
		<div style="width: 100px; float: left;">�̸� :</div>
		<div style="width: 500px; float: left;" align="left">
		<input type="text" name="name" id="name" value="${freeBoardDto.name }" /></div><br>
		
		<div style="width: 100px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left">
		<input type="text" name="title"  value="${freeBoardDto.title }" readonly/></div><br>
		
		<div style="width: 100px; float: left;">�ۼ�����</div>
		<div style="width: 500px; float: left;" align="left">
		<input type="text" name="regdate"  value="${freeBoardDto.regdate }" readonly/></div><br>
		
		<div style="width: 100px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left">
		<textarea name="content" rows="25" id="content" cols="65"  >${freeBoardDto.content }</textarea></div><br>
		
		<input type="hidden" name="num" value="${freeBoardDto.num}"/>
		
		<div align="right">
		<%-- <input type="button" value="����" onclick = "location.href = './freeBoardModify.ino?num=${freeBoardDto.num }'"> --%>
		<!-- <input type="button" value="����" onclick="button_m();"> -->
		<input type="submit" value="����" onclick="button_u();">
		<input type="submit" value="����" onclick="button_d();">
		<input type="submit" value="���" onclick="button_c();">
		&nbsp;&nbsp;&nbsp;
		</div>
	</form>
	
</body>
</html>