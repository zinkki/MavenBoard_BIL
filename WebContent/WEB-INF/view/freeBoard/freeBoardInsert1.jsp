<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>�����Խ���</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main1.ino">����Ʈ��</a>
	</div>
	<hr style="width: 600px">
	
	<form action="./freeBoardInsertPro1.ino" method="post" enctype="multipart/form-data">
		<div style="width: 150px; float: left;">�̸� :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name"/></div>
		
		<div style="width: 150px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title"/></div>
	
		<div style="width: 150px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left"><textarea name="content" rows="25" cols="65"  ></textarea></div>
		<div align="right">
		
		<div style="width:150px; float:left;">�����߰�:</div>
		<div style="width: 500px; float: left;" align="left">
		<input type="file" name="file">
		</div>
		
		<input type="submit" value="�۾���">
			
		<input type="button" value="�ٽþ���" onclick="reset()">
		<input type="button" value="���" onclick="removeCheck()">
		&nbsp;&nbsp;&nbsp;
		</div>
	
	</form>
<script>
function removeCheck(){
	if(confirm("������ ����Ͻðڽ��ϱ�?") == true ){
		location.href="main1.ino"
	}else{
		return  false;
	}
}
</script>

	
	
	
</body>
</html>