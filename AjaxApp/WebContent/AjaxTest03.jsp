<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest03.jsp</title>
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>css/main.css"> --%>

<style type="text/css">
	#result
	{
		display: inline-block;
		width: 250px;
		color: #f33;
		font-size: small
	}
</style>

<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">

	function check()
	{
		// 확인
		//alert("함수 호출");
		
		// 데이터 수집
		var id = document.getElementById("id").value;
		
		// URL 구성
		var url = "test03.do?id=" + id;
		
		// XMLHttpRequest 객체 생성
		ajax = createAjax();					
		
		ajax.open("GET", url, true);		
		
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState == 4)
			{
				if(ajax.status == 200)
				{
					callBack();
				}
			}
		};

		ajax.send("");
		
	}
	
	

	function callBack()
	{
		var data = ajax.responseText;

		document.getElementById("result").innerHTML = data;
	}
	
</script>

</head>
<body>
	
<div>
	<h1>회원 가입</h1>
	<p>- Test03Send.java</p>
	<p>- AjaxTest03.jsp</p>
	<p>- ajax.js</p>
	<p>- main.css</p>
	<p>- Test03.java</p>
	<p>- Test03_ok.jsp</p>
	<p>- web.xml</p>
	<p>※ url : test03send.do -> ajaxtest03/ test03.do </p>
	<p>※ 자료구조 활용 -> superman / batman / admin</p>
	
</div>
	
<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="txt control"/>
			<input type="button" value="중복검사" class="btn control" onclick="check()"/>
			<span id="result"></span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td><input type="text" id="name" class="txt control"/></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" id="addr" class="txt control"/></td>
	</tr>
</table>	

</body>
</html>
















