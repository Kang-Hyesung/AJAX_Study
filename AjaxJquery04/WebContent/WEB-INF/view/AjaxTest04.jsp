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
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendButton").click(function()
		{
			//alert("확인");
			
			var params = "title=" + $.trim($("#title").val())
			           + "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type:"POST"
				, url:"ajaxtest04ok.do"
				, data:params
				, datatype:"xml"
				, success:function(args)
				{
					var out = "";
					
					$(args).find("records").each(function()
					{
						var item = $(this);
						var num = item.attr("id");
						var title = item.find("title").text();
						var content = item.find("content").text();
						
						out += "<br>=========================";
						out += "<br> 번호 : " + num;
						out += "<br> 이름 : " + title;
						out += "<br> 내용 : " + content;
						out += "<br>=========================";
						
						$("#resultDiv").html(out);
						
						$("#title").val("");
						$("#content").val("");
						$("#title").focus();
					})
				}
				, beforeSend:showRequest
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
		});
	});
	
	function showRequest()
	{
		if (!$.trim($("#title").val()))
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			
			return false;
		}
		
		if(!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			
			return false;
		}
		
		return true;
	}

</script>

</head>
<body>

<div>
	<h1>jQuery 의 ajax() 활용 실습</h1>
	<p>xml control</p>
	<hr />
</div>

<div>
	제목 <input type="text" id="title" class="txt" />
	<br /><br />
	
	내용 <input type="text" id="content" class="txt" />
	<br /><br />
	
	<input type="button" value="등록하기" class="btn" id="sendButton" />
</div>
<br />

<div id="resultDiv">
</div>




</body>
</html>













