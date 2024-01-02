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
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
		$(function()
		{
			$("#sendButton").click(function()
			{
				var params = "su1="   + $("#su1").val()
				  		   + "&su2="  + $("#su2").val()
				  		   + "&oper=" + $("#oper").val();
				
				
				$.ajax(
				{
					type:"POST"
					, url:"ajaxtest03ok.do"
					, data:params
					, success:function(args)
					{
						$("#result").html(args);
					}
					, error:function(e)
					{
						alert(e.responseText);
					}
				});
			});
		});

</script>

</head>
<body>
	
<div>
	<input type="text" id="su1" class="txt txtNum" />
	
	<select name="" id="oper">
		<option value="add">덧셈</option>
		<option value="sub">뺄셈</option>
		<option value="mul">곱셈</option>
		<option value="div">나눗셈</option>
	</select>
	
	<input type="text" id="su2" class="txt txtNum" />
	<input type="button" value=" = " id="sendButton" class="btn" />
</div>
<br>


<div id="result">
</div>
<br>
<br>

<div>
	<input type="radio" name="rdo"/>rdo1
    <input type="radio" name="rdo"/>rdo2
</div>

<div>
	<input type="checkbox" name="chk"/>chk1
    <input type="checkbox" name="chk"/>chk2
</div>

<div>
	<input type="text" />
</div>



</body>
</html>             