<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

function confirm_event() {
	if(confirm("�۾��⸦ ��� �Ͻðڽ��ϱ�?") == true) {
		location.href="/mavenBoard/main.ino";
	}else {
		return;
	}
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
	<form action="./freeBoardInsertPro.ino">
		<div style="width: 100px; float: left;">�̸� :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name"/></div><br>
		
		<div style="width: 100px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title"/></div><br>
	
		<div style="width: 100px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left"><textarea name="content" rows="25" cols="65"  ></textarea></div><br>
		
		<div align="right">
		<input type="submit" value="�۾���">
		<input type="reset" value="�ٽþ���" onclick="">
		<input type="button" value="���" onclick="confirm_event();">
		&nbsp;&nbsp;&nbsp; 
		</div>
	
	</form>
	
	
	
</body>
</html>